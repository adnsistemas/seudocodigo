unit UAyudaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, UArbolEstructuraFrame, UContenidoAyudaFrame;

type
  TAyudaForm = class(TForm)
    Splitter1: TSplitter;
    ArbolEstructuraFrame1: TArbolEstructuraFrame;
    ContenidoAyudaFrame1: TContenidoAyudaFrame;
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FActual,FAyuda: string;
    FUsarArchivos: boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure mostrarContenido;
    property usarArchivos:boolean read FUsarArchivos write FUsarArchivos default false;
    property nombreAyuda:string read FAyuda write FAyuda;
  end;

var
  AyudaForm: TAyudaForm;

implementation

{$R *.dfm}

procedure TAyudaForm.FormCreate(Sender: TObject);
begin
  nombreAyuda := '.';
end;

procedure TAyudaForm.FormShow(Sender: TObject);
var
  nombre:string;
begin
  if FActual <> FAyuda then begin
    FActual := FAyuda;
    nombre := '';
    if FAyuda <> '.' then
      nombre := FAyuda;
    ArbolEstructuraFrame1.Load(nombre,FUsarArchivos);
    ContenidoAyudaFrame1.Load(nombre,FUsarArchivos);
  end;
  if (ArbolEstructuraFrame1.TreeView.Items.Count > 0) and not Assigned(ArbolEstructuraFrame1.NodoActual) then
    ArbolEstructuraFrame1.TreeView.Select(ArbolEstructuraFrame1.TreeView.Items[0]);
  mostrarContenido;
end;

procedure TAyudaForm.mostrarContenido;
begin
  // cargar la sección seleccionada en el RichEdit
  if Assigned(ArbolEstructuraFrame1.NodoActual) and ArbolEstructuraFrame1.CDSEstructura.Locate('numero',ArbolEstructuraFrame1.numeroActual,[]) then
    ContenidoAyudaFrame1.Mostrar(ArbolEstructuraFrame1.CDSEstructura.FieldByName('contenido').AsInteger,true)
  else
    ContenidoAyudaFrame1.Mostrar(0);
end;

procedure TAyudaForm.TreeView1DblClick(Sender: TObject);
begin
  mostrarContenido;
end;

procedure TAyudaForm.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    mostrarContenido;
end;

end.
