unit UArbolEstructuraFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Datasnap.DBClient, Vcl.ComCtrls;

type
  TArbolEstructuraFrame = class(TFrame)
    TreeView: TTreeView;
    CDSEstructura: TClientDataSet;
    CDSEstructuranumero: TIntegerField;
    CDSEstructuraorden: TIntegerField;
    CDSEstructurapadre: TIntegerField;
    CDSEstructuratitulo: TStringField;
    CDSEstructuracontenido: TIntegerField;
    procedure TreeViewEdited(Sender: TObject; Node: TTreeNode; var S: string);
  private
    { Private declarations }
    FMaxEstructura:integer;
    FOnBorrar: TDataSetNotifyEvent;
    function getSelected: TTreeNode;
    function getSelectedNum: integer;
    function getSelectedPadre: integer;
    function Agregar(texto:string;padre,contenido:integer):integer;
  public
    { Public declarations }
    procedure Load(rutaOrecurso:string = '';desdeArchivo:boolean = false);
    function AgregarHermano(texto:string;contenido:integer):integer;
    function AgregarHijo(texto:string;contenido:integer):integer;
    procedure Modificar(numero,padre,contenido:integer;texto:string);
    procedure BorrarActual;
    procedure Ordenar(nodo:TTreeNode);
    procedure Guardar(ruta:string = '');
    property NodoActual:TTreeNode read getSelected;
    property numeroActual:integer read getSelectedNum;
    property padreActual:integer read getSelectedPadre;
  published
    property OnBorrar:TDataSetNotifyEvent read FOnBorrar write FOnBorrar;
  end;

implementation

{$R *.dfm}

type
  REstructuraAyuda = record
    numero:integer;
    nodo:TTreeNode;
  end;

{ TFrame1 }

function TArbolEstructuraFrame.Agregar(texto: string;padre,contenido:integer): integer;
begin
  Inc(FMaxEstructura);
  result := FMaxEstructura;
  CDSEstructura.Insert;
  CDSEstructura.FieldByName('numero').AsInteger := FMaxEstructura;
  CDSEstructura.FieldByName('titulo').AsString := texto;
  CDSEstructura.FieldByName('padre').AsInteger := padre;
  CDSEstructura.FieldByName('contenido').AsInteger := contenido;
  CDSEstructura.FieldByName('orden').AsInteger := -1;
  CDSEstructura.Post;
end;

function TArbolEstructuraFrame.AgregarHermano(texto: string;
  contenido: integer): integer;
begin
  result := agregar(texto,padreActual,contenido);
  TreeView.Selected := TreeView.Items.AddObject(TreeView.Selected,texto,Pointer(result));
end;

function TArbolEstructuraFrame.AgregarHijo(texto: string;
  contenido: integer): integer;
begin
  result := agregar(texto,numeroActual,contenido);
  TreeView.Selected := TreeView.Items.AddChildObject(TreeView.Selected,texto,Pointer(result));
end;

procedure TArbolEstructuraFrame.BorrarActual;
  procedure eliminarNodo(cual:TTreeNode);
  var
    hijo:integer;
  begin
    if CDSEstructura.Locate('numero',integer(cual.Data),[]) then begin
      if Assigned(FOnBorrar) then
        FOnBorrar(CDSEstructura);
      CDSEstructura.Delete;
    end;
    for hijo := 0 to cual.Count - 1 do
      eliminarNodo(cual.Item[hijo]);
    cual.Delete;
  end;
begin
  eliminarNodo(TreeView.Selected);
end;

function TArbolEstructuraFrame.getSelected: TTreeNode;
begin
  result := TreeView.Selected;
end;

function TArbolEstructuraFrame.getSelectedNum: integer;
begin
  result := 0;
  if Assigned(TreeView.Selected) then
    result := integer(TreeView.Selected.Data);
end;

function TArbolEstructuraFrame.getSelectedPadre: integer;
begin
  result := 0;
  if Assigned(TreeView.Selected) and Assigned(TreeView.Selected.Parent) then
    result := integer(TreeView.Selected.Parent.Data);
end;

procedure TArbolEstructuraFrame.Guardar(ruta:string);
begin
  if ruta = '' then
    ruta := ExtractFilePath(application.ExeName);
  if ruta[Length(ruta)] <> PathDelim then
    ruta := ruta + PathDelim;
  CDSEstructura.SaveToFile(ruta + CDSEstructura.FileName);
end;

procedure TArbolEstructuraFrame.Load(rutaOrecurso:string = '';desdeArchivo:boolean = false);
  procedure armarNivel(padre:integer;nodo:TTreeNode = nil);
  var
    agregados:array of REstructuraAyuda;
    n: Integer;
  begin
    try
      CDSEstructura.Filter := 'padre=' + IntToStr(padre);
      CDSEstructura.Filtered := True;
      CDSEstructura.First;
      while not CDSEstructura.Eof do begin
        SetLength(agregados,High(agregados) + 2);
        agregados[High(agregados)].numero := CDSEstructura.FieldByName('numero').AsInteger;
        agregados[High(agregados)].nodo := TreeView.Items.AddChildObject(nodo,CDSEstructura.FieldByName('titulo').AsString,Pointer(CDSEstructura.FieldByName('numero').AsInteger));
        CDSEstructura.Next;
      end;
      for n := 0 to High(agregados) do
        armarNivel(agregados[n].numero,agregados[n].nodo);
    finally
      Finalize(agregados);
    end;
  end;
var
  rs:TStream;
begin
  try
    if desdeArchivo then begin
      if rutaOrecurso = '' then
        rutaOrecurso := ExtractFilePath(application.ExeName);
      if rutaOrecurso[Length(rutaOrecurso)] <> PathDelim then
        rutaOrecurso := rutaOrecurso + PathDelim;
      CDSEstructura.LoadFromFile(rutaOrecurso + CDSEstructura.FileName);
    end else begin
      if rutaOrecurso = '' then
        rutaOrecurso := 'CDS';
      rs := TResourceStream.Create(HInstance,rutaOrecurso + Uppercase(CDSEstructura.FileName[1]),RT_RCDATA);
      try
        CDSEstructura.LoadFromStream(rs);
      finally
        rs.Free;
      end;
    end;
    CDSEstructura.IndexFieldNames := 'numero';
    CDSEstructura.Last;
    FMaxEstructura := CDSEstructura.FieldByName('numero').AsInteger;
    CDSEstructura.IndexFieldNames := 'padre;orden';
    try
      armarNivel(0);
    finally
      CDSEstructura.Filtered := false;
    end;
  except
    //ignorar
    CDSEstructura.CreateDataSet;
  end;
end;

procedure TArbolEstructuraFrame.Modificar(numero,padre,contenido: integer; texto: string);
var
  nodo:integer;
begin
  CDSEstructura.Filtered := False;
  if CDSEstructura.Locate('numero',numero,[]) then begin
    CDSEstructura.Edit;
    CDSEstructura.FieldByName('titulo').AsString := texto;
    CDSEstructura.FieldByName('padre').AsInteger := padre;
    if contenido > 0 then
      CDSEstructura.FieldByName('contenido').AsInteger := contenido;
    CDSEstructura.FieldByName('orden').AsInteger := -1;
    CDSEstructura.Post;
    for nodo := 0 to TreeView.Items.Count - 1 do begin
      if integer(TreeView.Items[nodo].Data) = numero then begin
        TreeView.Items[nodo].Text := texto;
        break;
      end;
    end;
  end;
end;

procedure TArbolEstructuraFrame.Ordenar(nodo: TTreeNode);
var
  anterior:TTreeNode;
  numero,nuevoorden:integer;
  ordenados:array of integer;
begin
  CDSEstructura.Filtered := False;
  try
    nuevoorden := 1;
    // determino el orden que le corresponde, en base al orden del nodo anterior
    anterior := nodo.getPrevSibling;
    // si no tiene un hermano anterior, entonces es el 1
    if Assigned(anterior) then begin
      if CDSEstructura.Locate('numero',integer(anterior.Data),[]) then
        nuevoorden := CDSEstructura.FieldByName('orden').AsInteger + 1;
    end;
    if CDSEstructura.Locate('numero',integer(nodo.Data),[]) then begin
      // ordeno los números de identificación de los registros, para luego modificarlos
      try
        CDSEstructura.Filter := 'padre=' + CDSEstructura.FieldByName('padre').AsString;
        CDSEstructura.Filtered := true;
        CDSEstructura.First;
        while not CDSEstructura.Eof do begin
          numero := CDSEstructura.FieldByName('numero').AsInteger;
          if numero <> integer(nodo.Data) then begin
            SetLength(ordenados,High(ordenados) + 2);
            ordenados[High(ordenados)] := numero;
          end;
          CDSEstructura.Next;
        end;
        // agrego el registro en cuestión, en la posición que le corresponde
        SetLength(ordenados,High(ordenados) + 2);
        for numero := High(ordenados) downto nuevoorden do
          ordenados[numero] := ordenados[numero - 1];
        ordenados[nuevoorden - 1] := integer(nodo.Data);
        // corrijo los números de orden
        for numero := 0 to High(ordenados) do begin
          if CDSEstructura.Locate('numero',ordenados[numero],[]) then begin
            if CDSEstructura.FieldByName('orden').AsInteger <> numero + 1 then begin
              CDSEstructura.Edit;
              CDSEstructura.FieldByName('orden').AsInteger := numero + 1;
              CDSEstructura.Post;
            end;
          end;
        end;
      finally
        Finalize(ordenados);
      end;
    end;
  finally
    CDSEstructura.Filtered := False;
  end;
end;

procedure TArbolEstructuraFrame.TreeViewEdited(Sender: TObject; Node: TTreeNode;
  var S: string);
var
  numero:integer;
begin
  numero := integer(Node.Data);
  CDSEstructura.Filtered := False;
  if CDSEstructura.Locate('numero',numero,[]) then begin
    CDSEstructura.Edit;
    CDSEstructura.FieldByName('titulo').AsString := S;
    CDSEstructura.Post;
  end;
end;

end.
