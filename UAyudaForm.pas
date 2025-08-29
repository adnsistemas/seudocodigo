unit UAyudaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient;

type
  TAyudaForm = class(TForm)
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    RichEdit1: TRichEdit;
    CDSEstructura: TClientDataSet;
    CDSContenidos: TClientDataSet;
    CDSEstructuranumero: TIntegerField;
    CDSEstructurapadre: TIntegerField;
    CDSEstructuratitulo: TStringField;
    CDSEstructuracontenido: TIntegerField;
    CDSContenidosnumero: TIntegerField;
    CDSContenidoscontenido: TMemoField;
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure mostrarContenido;
  end;

var
  AyudaForm: TAyudaForm;

implementation

{$R *.dfm}

procedure TAyudaForm.FormCreate(Sender: TObject);
var
  rs:TResourceStream;
begin
  try
    rs := TResourceStream.Create(HInstance,'CDSE',RT_RCDATA);
    try
      CDSEstructura.LoadFromStream(rs);
    finally
      rs.Free;
    end;
    rs := TResourceStream.Create(HInstance,'CDSC',RT_RCDATA);
    try
      CDSContenidos.LoadFromStream(rs);
    finally
      rs.Free;
    end;
  except
    // ignorar
  end;
end;

procedure TAyudaForm.mostrarContenido;
begin
  // cargar la sección seleccionada en el RichEdit
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
