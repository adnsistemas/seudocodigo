unit id_config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TFormConfiguracion = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    OrdenBusquedaMemo: TMemo;
    TabSheet2: TTabSheet;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GuardarConfiguracion;
    procedure LeerConfiguracion;
    function GetOM: boolean;
  public
    { Public declarations }
    procedure SaveConfig(groupName,itemName:AnsiString;Items:TStrings);
    procedure LoadConfig(groupName,itemName:AnsiString;Items:TStrings);
    property OcultarMonitor:boolean read GetOM;
  end;

var
  FormConfiguracion: TFormConfiguracion;

implementation

{$R *.DFM}

procedure TFormConfiguracion.Button1Click(Sender: TObject);
begin
  GuardarConfiguracion;
end;

procedure TFormConfiguracion.GuardarConfiguracion;
var
  dums:TStrings;
begin
  SaveConfig('busqueda','directorio',OrdenBusquedaMemo.Lines);
  dums := TSTringList.Create;
  try
    dums.Clear;
    if CheckBox1.Checked then
      dums.Add('si')
    else
      dums.Add('no');
    SaveConfig('general','monitor',dums);
  finally
    dums.Free;
  end;
end;

procedure TFormConfiguracion.LeerConfiguracion;
var
  dums:TStrings;
begin
  OrdenBusquedaMemo.Clear;
  LoadConfig('busqueda','directorio',OrdenBusquedaMemo.Lines);
  dums:=TStringList.Create;
  try
    LoadConfig('general','monitor',dums);
    CheckBox1.Checked := (dums.Count > 0) and (dums[0] = 'si');
  finally
    dums.Free;
  end;
end;

procedure TFormConfiguracion.FormCreate(Sender: TObject);
begin
  LeerConfiguracion;
end;

const
  BuffSize = 4096;
  function FindOpening(Str:TStream;OpenTag:AnsiString;var data:AnsiString;ParentClose:AnsiString=''):boolean;
  var
    prevdata:AnsiString;
    buff:AnsiString;
    len,i,p:integer;
  begin
    result := False;
    len := Length(OpenTag);
    prevdata := data;
    repeat
      if ParentClose <> '' then
        p := Pos(ParentClose,prevdata)
      else
        p := -1;
      i := Pos(OpenTag,prevdata);
      if (i>0)and((p<0)or(i<p)) then begin //encontré una apertura, previa al cierre del padre
        data := Copy(prevdata,i,Length(prevdata));
        result:=True;
        break;
      end else if p>0 then begin //encontré el cierre del padre
        data := prevdata;
        break;
      end else
        Delete(prevdata,1,Length(prevdata)-len);
      SetLength(buff,BuffSize);
      SetLength(buff,Str.Read(Pointer(buff)^,BuffSize));
      prevdata := prevdata + buff;
    until Length(buff) = 0;
  end;
  function GetUntilClose(Str:TStream;CloseTag:AnsiString;var data:AnsiString):AnsiString;
  var
    prevdata:string;
    buff:string;
    len,i:integer;
  begin
    result := '';
    len := Length(CloseTag);
    prevdata := data;
    repeat
      i := Pos(CloseTag,prevdata);
      if i>0 then begin
        result := result + Copy(prevdata,1,i-1);
        data := Copy(prevdata,i,Length(prevdata));
        break;
      end else begin
        result := result + Copy(prevdata,1,Length(prevdata)-len);
        Delete(prevdata,1,Length(prevdata)-len);
      end;
      SetLength(buff,BuffSize);
      SetLength(buff,Str.Read(Pointer(buff)^,BuffSize));
      prevdata := prevdata + buff;
    until Length(buff) = 0;
  end;

procedure TFormConfiguracion.LoadConfig(groupName, itemName: AnsiString;
  Items: TStrings);
var
  fl:TFileStream;
  bus,mcl:AnsiString;
  len:integer;
  data,item:AnsiString;
begin
  try
    fl:=TFileStream.Create(ExtractFilePath(application.ExeName)+'config.xml',fmOpenRead);
    try
      data := '';
      if FindOpening(fl,'<' + groupName + '>',data,'</config>') then begin
        mcl := '</' + groupName + '>';
        bus := '<' + itemName + '><![CDATA[';
        len := Length(bus);
        while FindOpening(fl,bus,data,mcl) do begin
          item := GetUntilClose(fl,']]></' + itemName + '>',data);
          Delete(item,1,len);
          Items.Add(item);
        end;
      end;
    finally
      fl.Free;
    end;
  except
  end;
end;

procedure TFormConfiguracion.SaveConfig(groupName, itemName: AnsiString;
  Items: TStrings);
  procedure escribirGrupo(destino:TStream);
  var
    gopc,io,ic:AnsiString;
    i:integer;
  begin
    gopc := '<' + groupName + '>';
    destino.Write(Pointer(gopc)^,Length(gopc));
    io := '<' + itemName + '><![CDATA[';
    ic := ']]></' + itemName + '>';
    for i := 0 to Items.Count -1 do begin
      destino.Write(Pointer(io)^,Length(io));
      gopc := Items[i];
      destino.Write(Pointer(gopc)^,Length(gopc));
      destino.Write(Pointer(ic)^,Length(ic));
    end;
    gopc := '</' + groupName + '>';
    destino.Write(Pointer(gopc)^,Length(gopc));
  end;
var
  fs,fd:TFileStream;
  bus:AnsiString;
  len,prevpos:integer;
  data:AnsiString;
begin
  data := '';
  try
    fd:=TFileStream.Create(ExtractFilePath(application.ExeName)+'config.xmlt',fmOpenReadWrite or fmCreate);
    try
      fd.Size := 0;
      fs := nil;
      try
        fs:=TFileStream.Create(ExtractFilePath(application.ExeName)+'config.xml',fmOpenRead);
        fs.Seek(0,soFromBeginning);
      except
      end;
      if Assigned(fs) then try
        bus := '<' + groupName + '>';
        if FindOpening(fs,bus,data,'</config>') then begin
          len := fs.Position - Length(data);
          prevpos := fs.Position;
          fs.Position := 0;
          fd.CopyFrom(fs,len);
          fs.Position := prevpos;
          escribirGrupo(fd);
          bus := '</' + groupName + '>';
          FindOpening(fs,bus,data,'</config>');
          if Pos(bus,data) = 1 then
            Delete(data,1,Length(bus));
          fd.Write(Pointer(data)^,Length(data));
          if fs.Size > fs.Position then
            fd.CopyFrom(fs,fs.Size - fs.Position);
        end else begin
          bus := '<config>';
          fd.Write(Pointer(bus)^,Length(bus));
          escribirGrupo(fd);
          if fs.Size > 0 then begin
            fs.Position := Length('<config>');
            len := fs.Size - fs.Position;
            fd.CopyFrom(fs,len);
          end else begin
            bus := '</config>';
            fd.Write(Pointer(bus)^,Length(bus));
          end;
        end;
      finally
        fs.Free;
      end else begin
        bus := '<config>';
        fd.Write(Pointer(bus)^,Length(bus));
        escribirGrupo(fd);
        bus := '</config>';
        fd.Write(Pointer(bus)^,Length(bus));
      end;
    finally
      fd.Free;
    end;
    DeleteFile(ExtractFilePath(application.ExeName)+'config.xml');
    RenameFile(ExtractFilePath(application.ExeName)+'config.xmlt',ExtractFilePath(application.ExeName)+'config.xml');
  except
  end;
end;

function TFormConfiguracion.GetOM: boolean;
begin
  result := CheckBox1.Checked;
end;

end.
