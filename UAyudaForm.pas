unit UAyudaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TAyudaForm = class(TForm)
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    RichEdit1: TRichEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AyudaForm: TAyudaForm;

implementation

{$R *.dfm}

end.
