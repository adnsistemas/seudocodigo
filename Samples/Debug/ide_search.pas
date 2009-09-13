unit ide_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TLocalizarForm = class(TForm)
    TabControl1: TTabControl;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    procedure TabControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LocalizarForm: TLocalizarForm;

implementation

uses ide_editor, SynEditTypes;

{$R *.DFM}

procedure TLocalizarForm.TabControl1Change(Sender: TObject);
begin
  RadioGroup1.Enabled := TabControl1.TabIndex = 0;
end;

procedure TLocalizarForm.Button2Click(Sender: TObject);
var
  sops:TSynSearchOptions;
begin
  if Trim(Edit1.Text) = '' then
    exit;
  if TabControl1.TabIndex = 0 then begin
    sops := [];
    if RadioGroup1.ItemIndex = 0 then
      sops := sops + [ssoBackwards];
    editor.CurrentEd.SearchReplace(Edit1.Text,'',sops);
  end else begin
    try
      editor.CurrentEd.GotoLineAndCenter(StrToInt(Trim(Edit1.Text)));
    except
    end;
  end;
end;

procedure TLocalizarForm.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
