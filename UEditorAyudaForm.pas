unit UEditorAyudaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, Vcl.StdCtrls, UArbolEstructuraFrame,
  UContenidoAyudaFrame, Vcl.StdActns, Vcl.ExtActns, Vcl.Menus, Vcl.ExtDlgs;

type
  TEditorAyudaForm = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    AAgregarHermano: TAction;
    AAgregarHijo: TAction;
    ImageList1: TImageList;
    ToolButton6: TToolButton;
    ABorrar: TAction;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    Panel2: TPanel;
    ToolBar3: TToolBar;
    Panel3: TPanel;
    Edit1: TEdit;
    AGuardar: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ANegrita: TAction;
    AItalica: TAction;
    ASubrayado: TAction;
    ACaracter: TAction;
    AConfirmarContenido: TAction;
    ACancelarContenido: TAction;
    ToolButton16: TToolButton;
    FontDialog1: TFontDialog;
    ArbolEstructuraFrame1: TArbolEstructuraFrame;
    ContenidoAyudaFrame1: TContenidoAyudaFrame;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ColorBox1: TColorBox;
    PopupMenu1: TPopupMenu;
    Edicin1: TMenuItem;
    Copiar1: TMenuItem;
    Cortar1: TMenuItem;
    Pegar1: TMenuItem;
    Borrar1: TMenuItem;
    Copiar2: TMenuItem;
    SeleccionarTodo1: TMenuItem;
    Deshacer1: TMenuItem;
    Fuente1: TMenuItem;
    Negrita1: TMenuItem;
    Itlica1: TMenuItem;
    Subrayado1: TMenuItem;
    N1: TMenuItem;
    Letra1: TMenuItem;
    Prrafo1: TMenuItem;
    AlignLeft1: TMenuItem;
    Center1: TMenuItem;
    AlignRight1: TMenuItem;
    RichEditAlignLeft1: TRichEditAlignLeft;
    RichEditAlignCenter1: TRichEditAlignCenter;
    RichEditAlignRight1: TRichEditAlignRight;
    OpenPictureDialog1: TOpenPictureDialog;
    N2: TMenuItem;
    InsertarImagen1: TMenuItem;
    AImagen: TAction;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure AAgregarHermanoExecute(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AAgregarHijoExecute(Sender: TObject);
    procedure AGuardarExecute(Sender: TObject);
    procedure ABorrarUpdate(Sender: TObject);
    procedure AEditarExecute(Sender: TObject);
    procedure ABorrarExecute(Sender: TObject);
    procedure ANegritaExecute(Sender: TObject);
    procedure AItalicaExecute(Sender: TObject);
    procedure ASubrayadoExecute(Sender: TObject);
    procedure AConfirmarContenidoExecute(Sender: TObject);
    procedure ACaracterExecute(Sender: TObject);
    procedure ArbolEstructuraFrame1TreeViewEdited(Sender: TObject;
      Node: TTreeNode; var S: string);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ANegritaUpdate(Sender: TObject);
    procedure AItalicaUpdate(Sender: TObject);
    procedure ASubrayadoUpdate(Sender: TObject);
    procedure ContenidoAyudaFrame1RichEditSelectionChange(Sender: TObject);
    procedure ContenidoAyudaFrame1RichEditKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure AImagenExecute(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    procedure cambiarEstiloTexto(cual:TFontStyle);
    procedure nodoABorrar(DataSet:TDataSet);
    procedure SetComboSize;
    procedure SetComboFont;
    procedure SetComboColor;
    function IsFontStyle(Style:TFontStyle):boolean;
  public
    { Public declarations }
  end;

var
  EditorAyudaForm: TEditorAyudaForm;

implementation

uses UAyudaForm;

{$R *.dfm}

procedure TEditorAyudaForm.AAgregarHermanoExecute(Sender: TObject);
begin  
  ArbolEstructuraFrame1.AgregarHermano('',ContenidoAyudaFrame1.Agregar(''));
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TEditorAyudaForm.AAgregarHijoExecute(Sender: TObject);
begin
  ArbolEstructuraFrame1.AgregarHijo('',ContenidoAyudaFrame1.Agregar(''));
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TEditorAyudaForm.ABorrarExecute(Sender: TObject);
begin
  if MessageDlg('¿Eliminar toda la rama?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    ArbolEstructuraFrame1.BorrarActual;
end;

procedure TEditorAyudaForm.ABorrarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(ArbolEstructuraFrame1.NodoActual);
end;

procedure TEditorAyudaForm.ACaracterExecute(Sender: TObject);
var
  atts: TTextAttributes;
begin
  if ContenidoAyudaFrame1.RichEdit.SelLength > 0 then
    atts := ContenidoAyudaFrame1.RichEdit.SelAttributes
  else
    atts := ContenidoAyudaFrame1.RichEdit.DefAttributes;
  Fontdialog1.Font.Assign(atts);
  if FontDialog1.Execute() then
    atts.Assign(FontDialog1.Font);
end;

procedure TEditorAyudaForm.AConfirmarContenidoExecute(Sender: TObject);
begin
  ContenidoAyudaFrame1.Modificar;
end;

procedure TEditorAyudaForm.AEditarExecute(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TEditorAyudaForm.AGuardarExecute(Sender: TObject);
begin
  ContenidoAyudaFrame1.Guardar;
  ArbolEstructuraFrame1.Guardar;
end;

procedure TEditorAyudaForm.AImagenExecute(Sender: TObject);
var
  bmp:TBitmap;
begin
  if OpenPictureDialog1.Execute then begin
    bmp := TBitmap.Create;
    try
      bmp.LoadFromFile(OpenPictureDialog1.FileName);
      ContenidoAyudaFrame1.InsertarImagen(ContenidoAyudaFrame1.CDSContenidos.FieldByName('numero').AsInteger,bmp);
    finally
      bmp.Free;
    end;
  end;
end;

procedure TEditorAyudaForm.AItalicaExecute(Sender: TObject);
begin
  cambiarEstiloTexto(fsItalic);
end;

procedure TEditorAyudaForm.AItalicaUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Checked := IsFontStyle(fsItalic);
end;

procedure TEditorAyudaForm.ANegritaExecute(Sender: TObject);
begin
  cambiarEstiloTexto(fsBold);
end;

procedure TEditorAyudaForm.ANegritaUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Checked := IsFontStyle(fsBold);
end;

procedure TEditorAyudaForm.ArbolEstructuraFrame1TreeViewEdited(Sender: TObject;
  Node: TTreeNode; var S: string);
begin
  Edit1.Text := S;
  ArbolEstructuraFrame1.TreeViewEdited(Sender, Node, S);
end;

procedure TEditorAyudaForm.ASubrayadoExecute(Sender: TObject);
begin
  cambiarEstiloTexto(fsUnderline);
end;

procedure TEditorAyudaForm.ASubrayadoUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Checked := IsFontStyle(fsUnderline);
end;

procedure TEditorAyudaForm.cambiarEstiloTexto(cual: TFontStyle);
var
  atts:TTextAttributes;
begin
  if ContenidoAyudaFrame1.RichEdit.SelLength > 0 then
    atts := ContenidoAyudaFrame1.RichEdit.SelAttributes
  else
    atts := ContenidoAyudaFrame1.RichEdit.DefAttributes;
  if cual in atts.Style then
    atts.Style := atts.Style - [cual]
  else
    atts.Style := atts.Style + [cual];
end;

procedure TEditorAyudaForm.ColorBox1Change(Sender: TObject);
begin
  try
    if ContenidoAyudaFrame1.RichEdit.GetTextLen>0 then
      ContenidoAyudaFrame1.RichEdit.SelAttributes.Color := ColorBox1.Selected
    else
      ContenidoAyudaFrame1.RichEdit.DefAttributes.Color := ColorBox1.Selected;
  except
  end;
end;

procedure TEditorAyudaForm.ComboBox1Change(Sender: TObject);
begin
  if ContenidoAyudaFrame1.RichEdit.GetTextLen>0 then
    ContenidoAyudaFrame1.RichEdit.SelAttributes.Name:=ComboBox1.Items[ComboBox1.itemIndex]
  else
    ContenidoAyudaFrame1.RichEdit.DefAttributes.Name:=ComboBox1.Items[ComboBox1.itemIndex];
end;

procedure TEditorAyudaForm.ComboBox2Change(Sender: TObject);
begin
  try
    if ContenidoAyudaFrame1.RichEdit.GetTextLen>0 then
      ContenidoAyudaFrame1.RichEdit.SelAttributes.Size:=StrToInt(ComboBox2.Text)
    else
      ContenidoAyudaFrame1.RichEdit.DefAttributes.Size:=StrToInt(ComboBox2.Text);
  except
  end;
end;

procedure TEditorAyudaForm.ContenidoAyudaFrame1RichEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  showpoint:TPoint;
begin
  inherited;
  if (Key = VK_F5) and (Shift = [ssCtrl]) and Assigned(TRichEdit(Sender).PopUpMenu) then begin
    showpoint := ClientToScreen(Point(TRichEdit(Sender).Left,TRichEdit(Sender).Top));
    TRichEdit(Sender).PopUpMenu.Popup(showpoint.x,showpoint.y);
  end;
end;

procedure TEditorAyudaForm.ContenidoAyudaFrame1RichEditSelectionChange(
  Sender: TObject);
begin
  SetComboFont;
  SetComboSize;
  SetComboColor;
end;

procedure TEditorAyudaForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and Assigned(ArbolEstructuraFrame1.NodoActual) then
    ArbolEstructuraFrame1.Modificar(ArbolEstructuraFrame1.numeroActual,ArbolEstructuraFrame1.padreActual,0,Edit1.Text);
end;

procedure TEditorAyudaForm.FormCreate(Sender: TObject);
begin
  ArbolEstructuraFrame1.Load('',True);
  ArbolEstructuraFrame1.OnBorrar := nodoABorrar;
  ContenidoAyudaFrame1.Load('',True);
  ComboBox1.Items:=Screen.Fonts;
  ComboBox2.Items.Clear;
  ComboBox2.Items.Add('8');
  ComboBox2.Items.Add('9');
  ComboBox2.Items.Add('10');
  ComboBox2.Items.Add('11');
  ComboBox2.Items.Add('12');
  ComboBox2.Items.Add('13');
  ComboBox2.Items.Add('14');
  ComboBox2.Items.Add('16');
  ComboBox2.Items.Add('18');
  ComboBox2.Items.Add('20');
  ComboBox2.Items.Add('22');
  ComboBox2.Items.Add('24');
  ComboBox2.Items.Add('28');
  ComboBox2.Items.Add('32');
end;

function TEditorAyudaForm.IsFontStyle(Style: TFontStyle): boolean;
begin
  with ContenidoAyudaFrame1.RichEdit do begin
    if GetTextLen>0 then
      result := Style in SelAttributes.Style
    else
      result := Style in DefAttributes.Style;
  end;
end;

procedure TEditorAyudaForm.nodoABorrar(DataSet: TDataSet);
begin
  // borrar el contenido relacionado
  ContenidoAyudaFrame1.Borrar(DataSet.FieldByName('contenido').AsInteger);
end;

procedure TEditorAyudaForm.SetComboColor;
begin
  if ContenidoAyudaFrame1.RichEdit.GetTextLen>0 then
    ColorBox1.Selected := ContenidoAyudaFrame1.RichEdit.SelAttributes.Color
  else
    ColorBox1.Selected := ContenidoAyudaFrame1.RichEdit.DefAttributes.Color;
end;

procedure TEditorAyudaForm.SetComboFont;
begin
  if ContenidoAyudaFrame1.RichEdit.GetTextLen>0 then
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ContenidoAyudaFrame1.RichEdit.SelAttributes.Name)
  else
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ContenidoAyudaFrame1.RichEdit.DefAttributes.Name);
end;

procedure TEditorAyudaForm.SetComboSize;
begin
  if ContenidoAyudaFrame1.RichEdit.GetTextLen>0 then
    ComboBox2.Text := IntToStr(ContenidoAyudaFrame1.RichEdit.SelAttributes.Size)
  else
    ComboBox2.Text := IntToStr(ContenidoAyudaFrame1.RichEdit.DefAttributes.Size);
end;

procedure TEditorAyudaForm.ToolButton5Click(Sender: TObject);
var
  ap:string;
begin
  ap := ExtractFilePath(application.ExeName) + 'previsualizar' + PathDelim;
  ForceDirectories(ap);
  ContenidoAyudaFrame1.Guardar(ap);
  ArbolEstructuraFrame1.Guardar(ap);
  with TAyudaForm.Create(application) do try
    Caption := 'Previsualización';
    usarArchivos := True;
    nombreAyuda := ap;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TEditorAyudaForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Assigned(Node) then begin
    Edit1.Text := Node.Text;    
    if ArbolEstructuraFrame1.CDSEstructura.Locate('numero',integer(Node.Data),[]) then begin
      ContenidoAyudaFrame1.Mostrar(ArbolEstructuraFrame1.CDSEstructura.FieldByName('contenido').AsInteger);
    end else
      ContenidoAyudaFrame1.Mostrar(0);
  end else begin
    Edit1.Clear;
    ContenidoAyudaFrame1.Mostrar(0);
  end;
  SetComboFont;
  SetComboSize;
  SetCombocolor;
end;

end.
