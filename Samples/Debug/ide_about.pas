unit ide_about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

resourcestring
	RS_VERSION='Versión: %1d.%d.%d';

type
  TAcercaForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Label8: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Label7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AcercaForm: TAcercaForm;

implementation

uses shellapi;
{$R *.DFM}

const
  Urls:array[0..4] of PChar = ('http://www.frm.utn.edu.ar/algoritmos','http://www.remobjects.com/','http://synedit.sourceforge.net/','mailto:dabdala@frm.utn.edu.ar','http://code.google.com/p/seudocodigo/');

procedure TAcercaForm.Label7Click(Sender: TObject);
begin
  ShellExecute(Handle,'open',Urls[TLabel(Sender).Tag],nil,nil,0);
end;

procedure TAcercaForm.FormCreate(Sender: TObject);
var
	buffer:string;
  verinfo:Pointer;
  sres:integer;
  spHandle:cardinal;
begin
sres:=GetFileVersionInfoSize(PChar(application.ExeName),spHandle);
SetLength(buffer,sres+1);
if GetFileVersionInfo(PChar(application.ExeName),0,sres,Pointer(buffer)) then begin
  if VerQueryValue(Pointer(buffer),'\',verinfo,spHandle) then
    Label8.Caption:=Format(RS_VERSION,[VS_FixedFileInfo(verinfo^).dwProductVersionMS shr 16,(VS_FixedFileInfo(verinfo^).dwProductVersionMS and $FF),(VS_FixedFileInfo(verinfo^).dwProductVersionLS and $FF)])
  else
  	Label8.Visible:=False;
end else
	Label8.Visible:=False;
end;

end.
