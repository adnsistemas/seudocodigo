unit ide_evaluador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

resourcestring
  RS_CANT_ASSIGN_VALUE = 'No se puede asignar el nuevo valor. Verifique que sean tipos compatibles';
type
  Tevaluator = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    EditVariable: TEdit;
    GroupBox3: TGroupBox;
    MemoActual: TMemo;
    MemoNuevo: TMemo;
    procedure FormResize(Sender: TObject);
    procedure EditVariableKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoNuevoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure SetNewValue;
    procedure ResolverExpresion(Expr:string);
  public
    { Public declarations }
    procedure ShowVariable(varname:string);
  end;

var
  evaluator: Tevaluator;

implementation

uses ide_editor;

{$R *.DFM}

procedure Tevaluator.FormResize(Sender: TObject);
begin
  EditVariable.Width := GroupBox2.ClientWidth - EditVariable.Left * 2;
end;

procedure Tevaluator.EditVariableKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    ResolverExpresion(EditVariable.Text);
end;

procedure Tevaluator.ShowVariable(varname: string);
begin
  EditVariable.Text := varname;
  MemoActual.Text := editor.ce.GetVarContents(varname);
  MemoNuevo.Text := MemoActual.Text;
  MemoNuevo.SelectAll;
  MemoNuevo.ReadOnly := False;
  MemoNuevo.Enabled := True;
  if not Visible then
    Show;
  BringToFront;
end;

procedure Tevaluator.SetNewValue;
begin
  if not editor.ce.SetVarContents(EditVariable.Text,MemoNuevo.Text) then
    MessageDlg(RS_CANT_ASSIGN_VALUE,mtError,[mbOk],0);
  ShowVariable(EditVariable.Text);
  editor.UpdateAll;
end;

procedure Tevaluator.MemoNuevoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key = 13)and not MemoNuevo.ReadOnly then
    SetNewValue;
end;

procedure Tevaluator.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure Tevaluator.ResolverExpresion(Expr: string);
var
  i: Longint;
  isVar:boolean;
  s1, s: string;
begin
  with editor.ce do begin
    isVar := False;
    s := Uppercase(Expr);
    if pos('.', s) > 0 then
    begin
      s1 := copy(s,1,pos('.', s) -1);
      delete(s,1,pos('.', Name));
    end else begin
      s1 := s;
      s := '';
    end;
    for i := 0 to Exec.CurrentProcVars.Count -1 do
    begin
      isVar := Uppercase(Exec.CurrentProcVars[i]) =  s1;
      if isVar then
        break;
    end;
    if not isVar then
    begin
      for i := 0 to Exec.CurrentProcParams.Count -1 do
      begin
        isVar := Uppercase(Exec.CurrentProcParams[i]) =  s1;
        if isVar then
          break;
      end;
    end;
    if not isVar then
    begin
      for i := 0 to Exec.GlobalVarNames.Count -1 do
      begin
        isVar := Uppercase(Exec.GlobalVarNames[i]) =  s1;
        if isVar then
          break;
      end;
    end;
  end;
  if isVar then
    ShowVariable(Expr)
  else begin
    MemoActual.Text := 'Identificador desconocido';
    MemoNuevo.Clear;
    MemoNuevo.ReadOnly := True;
    MemoNuevo.Enabled := False;
  end;
end;

end.
