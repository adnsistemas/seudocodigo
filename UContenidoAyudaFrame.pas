unit UContenidoAyudaFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.OleCtnrs;

type
  TContenidoAyudaFrame = class(TFrame)
    RichEdit: TRichEdit;
    CDSContenidos: TClientDataSet;
    CDSContenidosnumero: TIntegerField;
    CDSContenidoscontenido: TMemoField;
    CDSImagenes: TClientDataSet;
    CDSImagenescontenido: TIntegerField;
    CDSImagenesnumero: TIntegerField;
    CDSImagenesimagen: TBlobField;
    OleContainer1: TOleContainer;
  private
    { Private declarations }
    FMaxContenido,FMaxImagen:integer;
    FTempFile:array[0..MAX_PATH] of Char;
    procedure newTempFile;
  public
    { Public declarations }
    procedure Load(rutaOrecurso:string = '';desdeArchivo:boolean = false);
    procedure Mostrar(numero:integer;conImagenes:boolean = false);
    function Agregar(contenido:string = ''):integer;
    procedure Modificar;
    procedure Borrar(numero:integer);
    procedure Guardar(ruta:string='');
    procedure InsertarImagen(contenido:integer;bmp: TBitmap);
  end;

implementation

uses RichOle, System.Win.ComObj, ActiveX;

const RTF_IMG_MKD = '{@image@%d}';

{$R *.dfm}

procedure agregarImagen(RichEdit:TRichEdit;FileName:string);
var
  RichEditOle: IRichEditOle;
  LockBytes: ILockBytes;
  ClientSite: IOleClientSite;
  Storage: IStorage;
  Image: IOleObject;
  Obj: REOBJECT;
  Fmt: FORMATETC;
begin
  if RichEdit_GetOleInterface(RichEdit.Handle, RichEditOle) then
  begin
    ZeroMemory(@Fmt, SizeOf(Fmt));
    Fmt.cfFormat := 0;
    Fmt.ptd := nil;
    Fmt.dwAspect := DVASPECT_CONTENT;
    Fmt.lindex := -1;
    Fmt.tymed := TYMED_NULL;

    OleCheck(CreateILockBytesOnHGlobal(0, True, LockBytes));
    OleCheck(StgCreateDocfileOnILockBytes(LockBytes, STGM_SHARE_EXCLUSIVE or STGM_CREATE or STGM_READWRITE, 0, Storage));
    OleCheck(RichEditOle.GetClientSite(ClientSite));
    OleCheck(OleCreateFromFile(PGUID(nil)^, PChar(FileName), IOleObject, OLERENDER_DRAW, @Fmt, ClientSite, Storage, Image));
    OleSetContainedObject(Image, True);

    ZeroMemory(@Obj, sizeof(Obj));
    Obj.cbStruct := SizeOf(Obj);
    Obj.cp := REO_CP_SELECTION;
    OleCheck(Image.GetUserClassID(Obj.clsid));
    Obj.oleobj := Image;
    Obj.stg := Storage;
    Obj.olesite := ClientSite;
    Obj.sizel.cx := 0;
    Obj.sizel.cx := 0;
    Obj.dvaspect := DVASPECT_CONTENT;
    Obj.dwFlags := 0;
    Obj.dwUser := 0;

    OleCheck(RichEditOle.InsertObject(Obj));
  end;
end;

{ TContenidoAyudaFrame }

function TContenidoAyudaFrame.Agregar(contenido: string): integer;
begin
  Inc(FMaxContenido);
  result := FMaxContenido;
  CDSContenidos.Insert;
  CDSContenidos.FieldByName('numero').AsInteger := FMaxContenido;
  CDSContenidos.FieldByName('contenido').AsString := contenido;
  CDSContenidos.Post;
end;

procedure TContenidoAyudaFrame.Borrar(numero: integer);
begin
  if CDSContenidos.Locate('numero',numero,[]) then begin
    CDSImagenes.Filter := 'contenido=' + IntToStr(numero);
    CDSImagenes.Filtered := True;
    try
      while not CDSImagenes.Eof do begin
        CDSImagenes.Delete;
      end;
      CDSContenidos.Delete;
    finally
      CDSImagenes.Filtered := False;
    end;
  end;
end;

procedure TContenidoAyudaFrame.Guardar(ruta:string);
  function archivoCDS(nombre:string):string;
  begin
    result := ruta;
    if result = '' then
      result := ExtractFilePath(application.ExeName);
    if result[Length(result)] <> PathDelim then
      result := result + PathDelim;
    result := result + nombre;
  end;
begin
  CDSContenidos.SaveToFile(archivoCDS(CDSContenidos.FileName));
  CDSImagenes.SaveToFile(archivoCDS(CDSImagenes.FileName));
end;

procedure TContenidoAyudaFrame.InsertarImagen(contenido:integer;bmp: TBitmap);
var
  bs:TStream;
begin
  Inc(FMaxImagen);
  CDSImagenes.Insert;
  CDSImagenes.FieldByName('numero').AsInteger := FMaxImagen;
  CDSImagenes.FieldByName('contenido').AsInteger := contenido;
  bs := CDSImagenes.CreateBlobStream(CDSImagenes.FieldByName('imagen'),bmWrite);
  try
    bmp.SaveToStream(bs);
  finally
    bs.Free;
  end;
  CDSImagenes.Post;
  RichEdit.SetSelText(Format(RTF_IMG_MKD,[FMaxImagen]));
end;

procedure TContenidoAyudaFrame.Load(rutaOrecurso:string;desdeArchivo: boolean);
  function archivoCDS(nombre:string):string;
  begin
    result := rutaOrecurso;
    if result = '' then
      result := ExtractFilePath(application.ExeName);
    if result[Length(result)] <> PathDelim then
      result := result + PathDelim;
    result := result + nombre;
  end;
  function nombreRecurso(nombre:string):string;
  begin
    result := rutaOrecurso;
    if result = '' then
      result := 'CDS';
    result := result + Uppercase(nombre[1]);
  end;
var
  rs:TStream;
begin
  try
    if desdeArchivo then begin
      CDSContenidos.LoadFromFile(archivoCDS(CDSContenidos.FileName));
    end else begin
      rs := TResourceStream.Create(HInstance,nombreRecurso(CDSContenidos.FileName),RT_RCDATA);
      try
        CDSContenidos.LoadFromStream(rs);
      finally
        rs.Free;
      end;
    end;
    CDSContenidos.IndexFieldNames := 'numero';
    CDSContenidos.Last;
    FMaxContenido := CDSContenidos.FieldByName('numero').AsInteger;
  except
    CDSContenidos.CreateDataSet;
  end;
  try
    if desdeArchivo then begin
      CDSImagenes.LoadFromFile(archivoCDS(CDSImagenes.FileName))
    end else begin
      rs := TResourceStream.Create(HInstance,nombreRecurso(CDSImagenes.FileName),RT_RCDATA);
      try
        CDSImagenes.LoadFromStream(rs);
      finally
        rs.Free;
      end;
    end;
    CDSImagenes.IndexFieldNames := 'numero';
    CDSImagenes.Last;
    FMaxImagen := CDSImagenes.FieldByName('numero').AsInteger;
  except
    CDSImagenes.CreateDataSet;
  end;
end;

procedure TContenidoAyudaFrame.Modificar;
var
  st:TStream;
  rtftxt:string;
  sind:integer;
begin
  CDSContenidos.Edit;
  try
    st := CDSContenidos.CreateBlobStream(CDSContenidos.FieldByName('contenido'),bmWrite);
    try
      RichEdit.Lines.SaveToStream(st);
    finally
      st.Free;
    end;
    // eliminar imágenes que no pertenezcan ya al contenido
    CDSImagenes.Filter := 'contenido=' + CDSContenidos.FieldByName('numero').AsString;
    CDSImagenes.Filtered := True;
    try
      CDSImagenes.First;
      while not CDSImagenes.Eof do begin
        rtftxt := Format(RTF_IMG_MKD,[CDSImagenes.FieldByName('numero').AsInteger]);
        sind := RichEdit.FindText(rtftxt,0,RichEdit.GetTextLen,[]);
        if sind >= 0 then
          CDSImagenes.Next
        else
          CDSImagenes.Delete;
      end;
    finally
      CDSImagenes.Filtered := False;
    end;
  finally
    CDSContenidos.Post;
  end;
end;

procedure TContenidoAyudaFrame.Mostrar(numero: integer;conImagenes:boolean = false);
var
  st,fs:TStream;
  rtftxt:string;
  sind: integer;
begin
  if CDSContenidos.Locate('numero',numero,[]) then begin
    st := CDSContenidos.CreateBlobStream(CDSContenidos.FieldByName('contenido'),bmRead);
    try
      RichEdit.Lines.LoadFromStream(st);
    finally
      st.Free;
    end;
    if conImagenes then begin
      CDSImagenes.Filter := 'contenido=' + CDSContenidos.FieldByName('numero').AsString;
      CDSImagenes.Filtered := True;
      try
        CDSImagenes.First;
        while not CDSImagenes.Eof do begin
          rtftxt := Format(RTF_IMG_MKD,[CDSImagenes.FieldByName('numero').AsInteger]);
          sind := RichEdit.FindText(rtftxt,0,RichEdit.GetTextLen,[]);
          if sind >= 0 then begin
            RichEdit.SelStart := sind;
            RichEdit.SelLength := Length(rtftxt);
            newTempFile;
            fs := TFileStream.Create(FTempFile,fmCreate);
            try
              st := CDSImagenes.CreateBlobStream(CDSImagenes.FieldByName('imagen'),bmRead);
              try
                fs.CopyFrom(st,0);
              finally
                st.Free;
              end;
            finally
              fs.Free;
            end;
            agregarImagen(RichEdit,FTempFile);
            DeleteFile(FTempFile);
          end;
          CDSImagenes.Next
        end;
      finally
        CDSImagenes.Filtered := False;
      end;
    end;
  end else
    RichEdit.Clear;
end;

procedure TContenidoAyudaFrame.newTempFile;
var
  fl:string;
  c:integer;
begin
  GetTempPath(SizeOf(FTempFile), FTempFile);
  GetTempFileName(FTempFile, nil, 0, FTempFile);
  fl := ChangeFileExt(FTempFile,'.bmp');
  for c := 1 to Length(fl) do
    FTempFile[c-1] := fl[c];
  FTempFile[Length(fl)] := #0;
end;

end.
