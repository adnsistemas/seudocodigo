program editorAyuda;

uses
  Vcl.Forms,
  UEditorAyudaForm in 'UEditorAyudaForm.pas' {EditorAyudaForm},
  UArbolEstructuraFrame in 'UArbolEstructuraFrame.pas' {ArbolEstructuraFrame: TFrame},
  UContenidoAyudaFrame in 'UContenidoAyudaFrame.pas' {ContenidoAyudaFrame: TFrame},
  RichOle in 'RichOle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEditorAyudaForm, EditorAyudaForm);
  Application.Run;
end.
