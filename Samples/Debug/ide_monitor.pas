unit ide_monitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, SynEdit, SynMemo,syncobjs;

type
  TVMonitorForm = class(TForm)
    Edit1: TEdit;
    MoveTimer: TTimer;
    DelayTimer: TTimer;
    Memo: TSynMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure MoveTimerTimer(Sender: TObject);
    procedure DelayTimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FDirection:integer;
    FWidth:integer;
    FReaded:string;
    FReading:TSimpleEvent;
    FInRead,FStop:boolean;
    FBeforeInput: TNotifyEvent;
    procedure setMaxWidth(const Value: integer);
  protected
    procedure SetEditPos;
  public
    { Public declarations }
    procedure Output(data:string);
    function Input:string;
    procedure Esperar;
    procedure Clear;
    procedure Stop;
    property LineWidth:integer read FWidth write setMaxWidth;
    property Stopped:boolean read FStop;
    property BeforeInput:TNotifyEvent read FBeforeInput write FBeforeInput;
  end;

var
  VMonitorForm: TVMonitorForm;

implementation

{$R *.DFM}

{ TVMonitorForm }

procedure TVMonitorForm.Output(data: string);
var
  sts:TStrings;
  i:integer;
begin
  if not Visible then
    Show;
  sts := TStringList.Create;
  try
    sts.Text:=data+chr(13)+chr(10);
    if sts.Count = 0 then
      exit;
    if Memo.Lines.Count > 0 then begin
      sts[0] := Memo.Lines[Memo.Lines.Count - 1] + sts[0];
      Memo.Lines.Delete(Memo.Lines.Count -1);
    end;
    i:=0;
    while i<sts.Count do begin
      data := sts[i];
      if Length(data) > FWidth then begin
        sts[i] := Copy(data,1,FWidth);
        sts.Insert(i+1,Copy(data,FWidth+1,Length(data)));
      end;
      Inc(i);
    end;
    Memo.Lines.AddStrings(sts);
    Memo.SelStart := Length(Memo.Lines.text)-1;
  finally
    sts.Free;
  end;
end;

procedure TVMonitorForm.FormCreate(Sender: TObject);
begin
  FWidth := 80;
  Memo.RightEdge := FWidth * 2;
  FReading:=TSimpleEvent.Create;
  Edit1.Color := Memo.Color;
  Edit1.Font := Memo.Font;
  Edit1.Height := Trunc(- Edit1.Font.Height * 1.5);
  Edit1.Width := Memo.ClientWidth;
  Edit1.Visible := False;
end;

function TVMonitorForm.Input: string;
begin
  result := '';
  if FInRead then
    exit;
  if not Visible then try
    Show;
  except
  end;
  if Assigned(BeforeInput) then
    BeforeInput(Self);
  FInRead := True;
  try
    Memo.SelStart := Length(Memo.Lines.Text)- 1;
    FReaded := '';
    Edit1.Clear;
    Edit1.MaxLength := FWidth - Length(Memo.Lines[Memo.Lines.Count - 1]);
    SetEditPos;
    Edit1.Visible := True;
    try
      Edit1.SetFocus;
    except
    end;
    while (FReading.WaitFor(50) <> wrSignaled) and not FStop do
      application.processMessages;
    FReading.ResetEvent;
    Edit1.Visible := False;
    result := FReaded + Edit1.Text;
    Output(Edit1.Text);
  finally
    FInRead:=False;
  end;
end;

procedure TVMonitorForm.FormDestroy(Sender: TObject);
begin
  FReading.Free;
end;

procedure TVMonitorForm.Clear;
begin
  Memo.Lines.Clear;
  FStop := False;
end;

procedure TVMonitorForm.Stop;
begin
  if FInRead then begin
    FReading.SetEvent;
    FStop := True;
  end;
end;

procedure TVMonitorForm.setMaxWidth(const Value: integer);
begin
  FWidth := Value;
  Memo.RightEdge := FWidth * 2;
  Edit1.MaxLength := FWidth;
end;

procedure TVMonitorForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    FReading.SetEvent
end;

procedure TVMonitorForm.Memo1Enter(Sender: TObject);
begin
  if Edit1.Visible then try
    Edit1.SetFocus;
  except
  end;
end;

procedure TVMonitorForm.FormActivate(Sender: TObject);
begin
  if Edit1.Visible then try
    Edit1.SetFocus;
  except
  end;
end;

procedure TVMonitorForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TEdit do begin
    if (GetTextLen = MaxLength) and not(Key in [char(VK_DELETE),char(VK_BACK)]) then begin
      Output(Text);
      Memo.Lines.Add('');
      FReaded := FReaded + Text;
      Clear;
      MaxLength := FWidth;
      SetEditPos;
    end;
  end;
end;

procedure TVMonitorForm.SetEditPos;
var
  cpos:TPoint;
  pv:boolean;
begin
  pv := Edit1.Visible;
  try
    Edit1.Visible := False;
    Memo.SelStart := Length(Memo.Lines.Text);
    try
      Memo.SetFocus;
    except
    end;
    GetCaretPos(cpos);
    cpos := Self.ScreenToClient(Memo.ClientToScreen(cpos));
    Edit1.Left := cpos.x;
    Edit1.Width := Memo.ClientWidth - Edit1.Left;
    Edit1.Top := cpos.y;
  finally
    Edit1.Visible := pv;
  end;
  if Edit1.Visible then try
    Edit1.SetFocus;
  except
  end;
end;

procedure TVMonitorForm.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lt:string;
begin
  if (Key = VK_BACK) and (TEdit(Sender).Text = '') and (FReaded <> '') then with Sender as TEdit do begin
    Memo.Lines.Delete(Memo.Lines.Count-1);
    if Length(FReaded) > FWidth then begin
      Edit1.Text := Copy(FReaded,Length(FReaded) - FWidth + 1,FWidth);
      Delete(FReaded,Length(FReaded) - FWidth + 1,FWidth);
      Memo.Lines[Memo.Lines.Count -1] := '';
    end else begin
      Edit1.Text := FReaded;
      FReaded := '';
      lt := Memo.Lines[Memo.Lines.Count-1];
      Memo.Lines[Memo.Lines.Count-1] := Copy(lt,1,Length(lt) - Edit1.GetTextLen);
    end;
    SetEditPos;
    Edit1.SelStart := Edit1.GetTextLen;
  end;
end;

procedure TVMonitorForm.FormResize(Sender: TObject);
begin
  Edit1.Width := Memo.ClientWidth - Edit1.Left;
end;

procedure TVMonitorForm.FormShow(Sender: TObject);
begin
  if not Assigned(HostDockSite) and (Memo.Lines.Text = '') then begin
    Left := screen.Width - Width;
    Top := 0;
  end;
end;

procedure TVMonitorForm.Esperar;
begin
  if FInRead then
    exit;
  if not Visible then
    Show;
  FInRead := True;
  try
    Memo.OnKeyPress := Memo1KeyPress;
    try
      Memo.SetFocus;
    except
    end;
    while (FReading.WaitFor(50) <> wrSignaled) and not FStop do
      application.processMessages;
    FReading.ResetEvent;
  finally
    Memo.OnKeyPress := nil;
    FInRead:=False;
  end;
end;

procedure TVMonitorForm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  FReading.SetEvent;
end;

procedure TVMonitorForm.MoveTimerTimer(Sender: TObject);
var
  delta:integer;
begin
  delta := Round(10 * screen.height / 768);
  case FDirection of
    0:Top := Top - delta;
    1:Left := Left + delta;
    2:Top := Top + delta;
    3:Left := Left - delta;
  end;
end;

procedure TVMonitorForm.DelayTimerTimer(Sender: TObject);
begin
  MoveTimer.Enabled := True;
  DelayTimer.Enabled := False;
end;

procedure TVMonitorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) then begin
    FDirection := -1;
    case Key of
      VK_UP:FDirection := 0;
      VK_DOWN:FDirection := 2;
      VK_LEFT:FDirection := 3;
      VK_RIGHT:FDirection := 1;
    end;
    DelayTimer.Enabled := Key in [VK_UP,VK_DOWN,VK_LEFT,VK_RIGHT];
  end;
end;

procedure TVMonitorForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DelayTimer.Enabled := False;
  MoveTimer.Enabled := False;
end;

end.
