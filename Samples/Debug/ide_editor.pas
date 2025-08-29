unit ide_editor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, SynEdit, SynEditHighlighter, SynHighlighterPas,
  Menus, uPSCompiler, uPSRuntime, uPSDisassembly, uPSUtils, ExtCtrls,
  StdCtrls, ComCtrls, uPSComponent_COM, uPSComponent_StdCtrls,
  uPSComponent_Forms, uPSComponent_Default, uPSComponent_Controls, uPSComponent,
  uPSDebugger, uPSComponent_DB, StdActns, ActnList,
  ImgList, SynHighlighterSeudoc, SynEditMiscClasses, SynEditSearch,
  SynCompletionProposal, langdef, UseHTMLHelp, System.Actions,
  SynEditCodeFolding, SynHighlighterNuevo;

resourcestring
  CS_SinNombre = 'Sin nombre';
  RS_CANT_FIND_HELP = 'No se puede encontrar el archivo de ayuda %s';
  RS_EXECUTING = 'Ejecutando..';
  RS_EXEC_SUCCESS = 'Ejecución existosa';
  RS_EXEC_ERROR = 'Error de ejecución: %1s en [%2d:%3d]';
  RS_STEP_INTO = 'Ejecutando línea';
  RS_STEP_OVER = 'Ejecutando instrucción';
  RS_STOPPING = 'Deteniendo..';
  RS_COMPILE_SUCCESS = 'Compilación exitosa';
  RS_CONFIRM_SAVE = 'No ha guardado el archivo "%s", ¿guardar ahora?';
  RS_DATE_FORMAT = 'dd/mm/yyyy';
  RS_UNAVAILABLE = 'No disponibles';
  RS_EXAMPLE_CODE = CS_Program + ' ' + CS_Example + CS_iend + #13#10 + CS_begin + #13#10 + CS_Program_end ;

type
  Teditor = class(TForm)
    ce: TPSScriptDebugger;
    IFPS3DllPlugin1: TPSDllPlugin;
    PopupMenu1: TPopupMenu;
    BreakPointMenu: TMenuItem;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Run1: TMenuItem;
    StepOver1: TMenuItem;
    StepInto1: TMenuItem;
    N1: TMenuItem;
    Reset1: TMenuItem;
    N2: TMenuItem;
    Run2: TMenuItem;
    Splitter1: TSplitter;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    N3: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    StatusBar1: TStatusBar;
    IFPS3CE_Controls1: TPSImport_Controls;
    IFPS3CE_DateUtils1: TPSImport_DateUtils;
    IFPS3CE_Std1: TPSImport_Classes;
    IFPS3CE_Forms1: TPSImport_Forms;
    IFPS3CE_StdCtrls1: TPSImport_StdCtrls;
    IFPS3CE_ComObj1: TPSImport_ComObj;
    Verificar1: TMenuItem;
    PSImport_DB1: TPSImport_DB;
    Salir1: TMenuItem;
    Splitter2: TSplitter;
    PopupMenu2: TPopupMenu;
    Quitar1: TMenuItem;
    Ayuda1: TMenuItem;
    Seudocdigo1: TMenuItem;
    N6: TMenuItem;
    Acercade1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    messages: TListBox;
    V1: TMenuItem;
    VariablesLocales1: TMenuItem;
    VariablesGlobales1: TMenuItem;
    SalidaDepuracin1: TMenuItem;
    ActionList1: TActionList;
    MLocales: TAction;
    MGlobales: TAction;
    N4: TMenuItem;
    Q1: TMenuItem;
    Configuracin1: TMenuItem;
    PageControl: TPageControl;
    PopupMenu3: TPopupMenu;
    Cerrar1: TMenuItem;
    CerrarTodas1: TMenuItem;
    Cerrar2: TMenuItem;
    MostrarOcultarnmerosdelnea1: TMenuItem;
    SynEditSearch1: TSynEditSearch;
    N5: TMenuItem;
    Localizar1: TMenuItem;
    Cortarlneaslargas1: TMenuItem;
    AWordWrap: TAction;
    AETodo: TAction;
    AELinea: TAction;
    AEInstruccion: TAction;
    AReiniciar: TAction;
    ASalida: TAction;
    ed: TSynEdit;
    Panel1: TPanel;
    WatchPanel: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    MemoLocales: TMemo;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    MemoGlobales: TMemo;
    Panel3: TPanel;
    CheckBox2: TCheckBox;
    PopupMenu4: TPopupMenu;
    Limpiar1: TMenuItem;
    ALimpiarMensajes: TAction;
    ABuscar: TAction;
    ADetener: TAction;
    Detener1: TMenuItem;
    N7: TMenuItem;
    Evaluador1: TMenuItem;
    EVP: TAction;
    SynSeudoSyn1: TSynSeudoSyn;
    procedure edSpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
    procedure BreakPointMenuClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ceIdle(Sender: TObject);
    procedure ceExecute(Sender: TPSScript);
    procedure ceAfterExecute(Sender: TPSScript);
    procedure ceCompile(Sender: TPSScript);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure edStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure Verificar1Click(Sender: TObject);
    procedure AWordWrapExecute(Sender: TObject);
    procedure edGutterClick(Sender: TObject; Button: TMouseButton; X, Y,
      Line: Integer; Mark: TSynEditMark);
    procedure Salir1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Quitar1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure MemoLocalesDblClick(Sender: TObject);
    procedure MemoGlobalesDblClick(Sender: TObject);
    procedure messagesDblClick(Sender: TObject);
    procedure messagesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StatusBar1Resize(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MGlobalesExecute(Sender: TObject);
    procedure MLocalesExecute(Sender: TObject);
    procedure Informacin1Click(Sender: TObject);
    procedure Q1Click(Sender: TObject);
    procedure Configuracin1Click(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
    procedure CerrarTodas1Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure MostrarOcultarnmerosdelnea1Click(Sender: TObject);
    procedure edKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Seudocdigo1Click(Sender: TObject);
    procedure AWordWrapUpdate(Sender: TObject);
    function ceBooleanRead(Sender: TObject): Boolean;
    function ceCharRead(Sender: TObject): Char;
    function ceCurrencyRead(Sender: TObject): Currency;
    function ceIntegerRead(Sender: TObject; limit: Integer): Integer;
    function ceRealRead(Sender: TObject; size: Integer): Real;
    function ceStringRead(Sender: TObject): String;
    procedure ceCharShow(Sender: TObject; const data: Char);
    procedure ceCurrencyShow(Sender: TObject; const data: Currency);
    procedure ceIntegerShow(Sender: TObject; const data: Integer);
    procedure ceRealShow(Sender: TObject; const data: Real);
    procedure ceBooleanShow(Sender: TObject; const data: Boolean);
    procedure ceStringShow(Sender: TObject; const data: String);
    procedure ceReadShow(Sender: TObject; const data: String);
    procedure AETodoUpdate(Sender: TObject);
    procedure AETodoExecute(Sender: TObject);
    procedure AELineaExecute(Sender: TObject);
    procedure AReiniciarUpdate(Sender: TObject);
    procedure AReiniciarExecute(Sender: TObject);
    procedure ceListShow(Sender: TObject; const data: Integer);
    procedure ASalidaUpdate(Sender: TObject);
    procedure ASalidaExecute(Sender: TObject);
    procedure WatchPanelResize(Sender: TObject);
    procedure ALimpiarMensajesUpdate(Sender: TObject);
    procedure ALimpiarMensajesExecute(Sender: TObject);
    procedure ABuscarExecute(Sender: TObject);
    procedure ADetenerExecute(Sender: TObject);
    procedure EVPUpdate(Sender: TObject);
    procedure EVPExecute(Sender: TObject);
    procedure ceBreakpoint(Sender: TObject; const FileName: AnsiString;
      Position, Row, Col: Cardinal);
    function ceFindUnknownFile(Sender: TObject; const OrginFileName: AnsiString;
      var FileName, Output: AnsiString): Boolean;
    procedure ceLineInfo(Sender: TObject; const FileName: AnsiString; Position,
      Row, Col: Cardinal);
    function ceNeedFile(Sender: TObject; const OrginFileName: AnsiString;
      var FileName, Output: AnsiString): Boolean;
    function ceInt64Read(Sender: TObject; limit: Integer): Int64;
  private
    function getSPCount: integer;
    function GetCurrentEd: TSynEdit;
    function SinNombre:string;
    function GetScriptActiveFile: string;
  private
    FMessageLine: Longint;
    FActiveLine: Longint;
    FResume,FFirstShow: Boolean;
    FActiveFile: string;
    FFiles:TStrings;
    FWatches:TStrings;
    FNextReadText:string;
    FListShow:TList;
    FRandomized:boolean;
    function Compile: Boolean;
    function Execute: Boolean;

    function caracterACodigo(const c:char):integer;
    function codigoACaracter(const c:integer):char;
    function Aleatorio(const e:integer = 0):real;
    procedure WriteStr(const s: string);
    procedure ReadStr(var s:string);
    procedure ReadInt(var i:integer);
    procedure ReadReal(var r:real);
    procedure ReadDT(var dt:TDateTime);
    procedure ReadChar(var c:char);
    procedure ReadBool(var b:boolean);
    function CRLF:string;
    procedure Esperar(const mensaje:string);
    procedure BorrarPant;
    procedure WReadStr(const que:string;var s: string);
    procedure WReadInt(const que:string;var i:integer);
    procedure WReadReal(const que:string;var r:real);
    procedure WReadDT(const que:string;var dt:TDateTime);
    procedure WReadChar(const que:string;var c:char);
    procedure WReadBool(const que:string;var b:boolean);
    function BoolToStr(const bl:boolean):string;
    function TextEqual(const t1,t2:string):boolean;

    procedure SetActiveFile(const Value: string);
    procedure UpdateWatches;
    procedure UpdateLocales;
    procedure UpdateGlobales;
    function GetInspectData(pv:PIfVariant):string;
    procedure SetToMessage;
    procedure CreateTab(FileName:string);
    procedure DestroyTab(PageIndex:integer;SavedChecked:boolean=False);
    procedure SaveFile(page:TTabSheet);
    procedure SaveFileAs(page:TTabSheet);
    procedure SetActivePage(FileName:string);

    function SetToSearchPath(cual:integer;original:string):string;
    procedure ShowFileName;
    procedure DeleteWatch(ind:integer);
    property aFile: string read FActiveFile write SetActiveFile;
    property sFile: string read GetScriptActiveFile;
    property SearchPathCount:integer read getSPCount;

    procedure LimpiarUso;
    procedure UsarArchivo(pageIndex:integer);
    procedure PreListItem(predata:string='');
    procedure PosListItem(posdata:string='');
    procedure ShowDockedMonitor(Sender:TObject);
  public
    function SaveCheck(page:TTabSheet): Boolean;
    procedure AddWatch(varname:string);
    procedure UpdateAll;
    property CurrentEd:TSynEdit read GetCurrentEd;
  end;

var
  editor: Teditor;

implementation

uses ide_evaluador, SynEditTypes, ide_about,
  id_config, ide_search, ide_monitor;

type
  TWatchRecord = class
  private
    FVariable,
    FTipo : string;
    FGIndex,FPIndex,FLIndex:integer;
    function GetNombre: string;
  public
    property Nombre:string read FVariable;
    property NombreCompleto:string read GetNombre;
  end;

  TFileRecord = class
  private
    FFullName,
    FRealName,
    FScriptName:string;
    FUsing:boolean;
    procedure SetNombre(const Value: string);
  public
    property NombreReal:string read FRealName;
    property NombreUtiliza:string read FScriptName;
    property NombreEnDisco:string read FFullName write SetNombre;
    property EnUso:boolean read FUsing;
  end;

{$R *.dfm}

procedure Teditor.edSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
var
  msg:TPSPascalCompilerMessage;
begin
  try
    if FMessageLine >= 0 then begin
      msg := ce.CompilerMessages[FMessageLine];
      if Assigned(msg) and
      (((msg.ModuleName <> '') and (CompareText(msg.ModuleName,sFile)=0)) or ((msg.ModuleName = '') and (CompareText(ce.MainFileName,sFile) = 0) ))
      and (Line = msg.Row) then begin
        Special := True;
        BG := clGreen;
        FG := clWhite;
        exit;
      end;
    end;
    if ce.HasBreakPoint(sFile, Line) then begin
      Special := True;
      if Line = FActiveLine then begin
        BG := clBlue;
        FG := clRed;
      end else begin
        FG := clWhite;
        BG := clRed;
      end;
    end else if Line = FActiveLine then begin
      Special := True;
      FG := clWhite;
      bg := clBlue;
      application.ProcessMessages;
    end else
      Special := False;
  except
    Special := False;
  end;
end;

procedure Teditor.BreakPointMenuClick(Sender: TObject);
var
  Line: Longint;
begin
  if not Assigned(CurrentEd) then
    exit;
  Line := CurrentEd.CaretY;
  if ce.HasBreakPoint(sFile, Line) then
    ce.ClearBreakPoint(sFile, Line)
  else
    ce.SetBreakPoint(sFile, Line);
  CurrentEd.Refresh;
end;

procedure Teditor.Exit1Click(Sender: TObject);
begin
  Close;
end;

function Teditor.Compile: Boolean;
var
  i: Longint;
begin
  LimpiarUso;
  if not Assigned(CurrentEd) then
    exit;
  UsarArchivo(PageControl.ActivePageIndex);
  ce.MainFileName := sFile;
  ce.Script.Assign(Currented.Lines);
  Result := ce.Compile;
  messages.Clear;
  for i := 0 to ce.CompilerMessageCount -1 do
  begin
    Messages.Items.Add(ce.CompilerMessages[i].MessageToString);
  end;
  if Result then
    Messages.Items.Add(RS_COMPILE_SUCCESS);
end;

procedure Teditor.ceIdle(Sender: TObject);
begin
  Application.HandleMessage;
  if FResume then
  begin
    FResume := False;
    ce.Resume;
    FActiveLine := 0;
    if Assigned(CurrentEd) then
      Currented.Refresh;
  end;
end;

procedure Teditor.ceExecute(Sender: TPSScript);
begin
  VMonitorForm.Clear;
  VMonitorForm.BeforeInput := ShowDockedMonitor;
  ce.SetVarToInstance(CS_SELF, Self);
  ce.SetVarToInstance(CS_APPLICATION, Application);
  StatusBar1.Panels[1].Text := RS_EXECUTING;
end;

function Teditor.ceFindUnknownFile(Sender: TObject;
  const OrginFileName: AnsiString; var FileName, Output: AnsiString): Boolean;
var
  path:string;
  i:integer;
  foundpos:integer;
  fl:TFileStream;
  fd:TFileRecord;
begin
  try
    foundpos := -1;
    FileName := FileName + '.sdc';
    fd := TFileRecord(FFiles.Objects[PageControl.ActivePageIndex]);
    path := ExtractFilePath(fd.NombreEnDisco);
    try
      //busco en los archivos abiertos
      for i:=0 to PageControl.PageCount -1 do begin
        fd := TFileRecord(FFiles.Objects[i]);
        if CompareText(fd.NombreReal,FileName) = 0 then begin
          Output := TSynEdit(PageControl.Pages[i].Controls[0]).Text;
          fd.FScriptName := OrginFileName;
          foundpos:=i;
          Result := True;
          exit;
        end;
      end;
      //busco en el mismo directorio y luego en los especificados como directorios de búsqueda
      result := FileExists(path + FileName);
      if not result then begin
        for i:=0 to SearchPathCount - 1 do begin
          path := SetToSearchPath(i,path);
          result := FileExists(path + FileName);
          if result then
            break;
        end;
      end;
      if result then try
        fl := TFileStream.Create(path + FileName,fmOpenRead);
        try
          SetLength(Output,fl.Size);
          fl.Read(Pointer(Output)^,fl.Size);
        finally
          fl.Free;
        end;
        CreateTab(path + FileName);
        foundpos := PageControl.ActivePageIndex;
        fd := TFileRecord(FFiles.Objects[foundpos]);
        fd.FScriptName := OrginFileName;
      except
        result := False;
      end;
    finally
      UsarArchivo(foundpos);
    end;
  except
    result := False;
  end;
end;

procedure Teditor.ceAfterExecute(Sender: TPSScript);
begin
  WatchPanel.Enabled := False;
  UpdateLocales;
  UpdateGlobales;
  UpdateWatches;
  StatusBar1.Panels[1].Text := '';
  FActiveLine := 0;
  if Assigned(CurrentEd) then
    Currented.Refresh;
end;

function Teditor.Execute: Boolean;
begin
  VMonitorForm.Clear;
  VMonitorForm.BeforeInput := ShowDockedMonitor;
  if CE.Execute then
  begin
    Messages.Items.Add(RS_EXEC_SUCCESS);
    if VMonitorForm.Visible then begin
      if FormConfiguracion.OcultarMonitor then begin
        if not Assigned(VMonitorForm.HostDockSite) then
          VMonitorForm.Hide
        else
          PageControl1.ActivePageIndex := 0;
      end;
    end;
    Result := True;
  end else
  begin
    messages.Items.Add(Format(RS_EXEC_ERROR,[ce.ExecErrorToString,ce.ExecErrorRow,ce.ExecErrorCol]));//bytecode pos:'+inttostr(ce.ExecErrorProcNo)+':'+inttostr(ce.ExecErrorByteCodePosition));
    Result := False;
  end;
end;

procedure Teditor.WriteStr(const s: string);
begin
  VMonitorForm.Output(s);
end;

procedure Teditor.ceCompile(Sender: TPSScript);
begin
  Sender.AddMethod(Self, @TEditor.CRLF, CS_function + ' ' + CS_crlf + ':' + CS_string);
  Sender.AddMethod(Self, @TEditor.TextEqual, CS_function + ' ' + CS_SameText + '('+ CS_const + 'uno,dos:' + CS_string + '):' + CS_boolean);
  Sender.AddMethod(Self, @TEditor.Esperar, CS_procedure + ' ' + CS_Wait + '(' + CS_const + ' mensaje:' + CS_string + ')');
  Sender.AddMethod(Self, @TEditor.BorrarPant, CS_procedure + ' ' + CS_ClearScreen);
  Sender.AddMethod(Self, @TEditor.ReadDT, CS_procedure + ' ' + CS_ReadDateTime + '(' + CS_var + ' s: ' + CS_TDateTime + ')');
  Sender.AddMethod(Self, @TEditor.Aleatorio, CS_function + ' ' + CS_Random + '(' + CS_const + ' e: ' + CS_integer + '):' + CS_real);
  Sender.AddMethod(Self, @TEditor.codigoACaracter, CS_function + ' ' + CS_intToChar + '(' + CS_const + ' c: ' + CS_integer + '):' + CS_char);
  Sender.AddMethod(Self, @TEditor.caracterACodigo, CS_function + ' ' + CS_charToInt + '(' + CS_const + ' c: ' + CS_char + '):' + CS_integer);
end;

procedure Teditor.WReadStr(const que:string;var s: string);
var
  toshow:string;
begin
  toShow := que;
  if toShow = '' then
    toShow := FNextReadText;
  VMonitorForm.Output(toShow);
  s:=VMonitorForm.Input;
  FNextReadText := '';
end;

procedure Teditor.New1Click(Sender: TObject);
begin
  CreateTab('');
end;

procedure Teditor.Open1Click(Sender: TObject);
var
  i:integer;
begin
  if OpenDialog1.Execute then begin
    for i:=0 to OpenDialog1.Files.Count -1 do
      CreateTab(OpenDialog1.Files[i]);
  end;
end;

procedure Teditor.Save1Click(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    SaveFile(PageControl.ActivePage);
end;

procedure Teditor.Saveas1Click(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    SaveFileAs(PageControl.ActivePage);
end;

function Teditor.SaveCheck(page:TTabSheet): Boolean;
var
  fd:TFileRecord;
begin
  if TSynEdit(page.Controls[0]).Modified then
  begin
    fd := TFileRecord(FFiles.Objects[page.TabIndex]);
    case MessageDlg(Format(RS_CONFIRM_SAVE,[fd.NombreReal]), mtConfirmation, mbYesNoCancel, 0) of
      idYes:
        begin
          SaveFile(page);
          Result := ExtractFilePath(fd.NombreEnDisco) <> '';
        end;
      IDNO: Result := True;
      else
        Result := False;
    end;
  end else Result := True;
end;

procedure Teditor.edStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  if Assigned(CurrentEd) then
    StatusBar1.Panels[0].Text := IntToStr(Currented.CaretY)+':'+IntToStr(Currented.CaretX)
end;

procedure Teditor.SetActiveFile(const Value: string);
begin
  FActiveFile := ExtractFileName(Value);
end;

procedure Teditor.Verificar1Click(Sender: TObject);
begin
  Compile;
end;

procedure Teditor.AWordWrapExecute(Sender: TObject);
begin
  with Sender as TAction do begin
    Checked := not Checked;
    if Assigned(CurrentEd) then
      Currented.WordWrap := Checked;
  end;
end;

procedure Teditor.edGutterClick(Sender: TObject; Button: TMouseButton; X,
  Y, Line: Integer; Mark: TSynEditMark);
begin
  if ce.HasBreakPoint(sFile, Line) then
    ce.ClearBreakPoint(sFile, Line)
  else
    ce.SetBreakPoint(sFile, Line);
  if Assigned(CurrentEd) then
    Currented.Refresh;
  if Assigned(Mark) then
    Mark.Visible := ce.HasBreakPoint(sFile, Line);
end;

procedure Teditor.Salir1Click(Sender: TObject);
begin
  if ce.Running then
    ce.Stop;
  VMonitorForm.Stop;
  Close;
end;

procedure Teditor.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    AddWatch(Edit1.Text);
    Edit1.Clear;
  end;
end;

procedure Teditor.FormCreate(Sender: TObject);
begin
  FFirstShow := True;
  if FormatSettings.ShortDateFormat <> RS_DATE_FORMAT then
    FormatSettings.ShortDateFormat := RS_DATE_FORMAT;
  FWatches := TStringlist.Create;
  FFiles := TStringList.Create;
  with FWatches as TStringList do begin
    sorted := True;
    duplicates := dupError;
  end;
  ce.Comp.ForcedEnd := True;
  FMessageLine := -1;
end;

procedure Teditor.FormDestroy(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to FWatches.Count - 1 do with TWatchRecord(FWatches.Objects[i]) do
    Free;
  FWatches.Free;
  for i:=0 to FFiles.Count -1 do with TFileRecord(FFiles.Objects[i]) do
    Free;
  FFiles.Free;
end;

procedure Teditor.AddWatch(varname: string);
  function tipoVar(tipo:integer):string;
  begin
    if tipo = 1 then
      result := CS_boolean
    else if (tipo >1) and (tipo<7) then
      result := CS_integer
    else if (tipo >= 7) and (tipo<10) then
      result := CS_real
    else if tipo = 10 then
      result := CS_string
    else if tipo = 11 then
      result := CS_record
    else if (tipo = 12)or(tipo=22) then
      result := CS_array
    else if tipo = 13 then
      result := CS_pointer
    else if tipo = 16 then
      result := CS_variant
    else if tipo = 18 then
      result := CS_char
    else if tipo = 24 then
      result := CS_currency
    else if tipo = 23 then
      result := CS_set
    else if tipo = 25 then
      result := CS_list
    else
      result := '?';
  end;
var
  i:integer;
  upvar:string;
  wr:TWatchRecord;
begin
  if FWatches.IndexOf(varname) >= 0 then
    exit;
  upvar := Uppercase(varname);
  wr := TWatchRecord.Create;
  wr.FGIndex := -1;
  wr.FPIndex := -1;
  wr.FLIndex := -1;
  wr.FVariable := varname;
  for i:=0 to ce.Exec.GlobalVarNames.Count - 1 do begin
    if Uppercase(ce.Exec.GlobalVarNames[i]) = upvar then begin
      wr.FTipo := tipoVar(ce.Exec.GetGlobalVar(i)^.FType.BaseType);
      wr.FGIndex := i;
      break;
    end;
  end;
  if wr.FTipo = '' then begin
    for i:=0 to ce.Exec.CurrentProcVars.Count - 1 do begin
      if Uppercase(ce.Exec.CurrentProcVars[i]) = upvar then begin
        wr.FTipo := tipoVar(ce.Exec.GetProcVar(i)^.FType.BaseType);
        wr.FLIndex := i;
        break;
      end;
    end;
    if wr.FTipo = '' then begin
      for i:=0 to ce.Exec.CurrentProcParams.Count - 1 do begin
        if Uppercase(ce.Exec.CurrentProcParams[i]) = upvar then begin
          wr.FTipo := tipoVar(ce.Exec.GetProcParam(i)^.FType.BaseType);
          wr.FPIndex := i;
          break;
        end;
      end;
    end;
  end;
  FWatches.AddObject(varname,wr);
  UpdateWatches;
end;

procedure Teditor.UpdateWatches;
var
  i:integer;
  wr:TWatchRecord;
begin
  ListBox1.Clear;
  if not(WatchPanel.Enabled and (ce.Exec.Status > isLoaded ))then
    exit;
  for i:=0 to FWatches.Count - 1 do begin
    wr := TWatchRecord(FWatches.Objects[i]);
    if wr.FGIndex >= 0 then
      ListBox1.Items.Add(wr.NombreCompleto + ': ' + GetInspectData(ce.Exec.GetGlobalVar(wr.FGIndex)))
    else if wr.FLIndex >= 0 then
      ListBox1.Items.Add(wr.NombreCompleto + ': ' + GetInspectData(ce.Exec.GetProcVar(wr.FLIndex)))
    else
      ListBox1.Items.Add(wr.NombreCompleto + ': ' + GetInspectData(ce.Exec.GetProcParam(wr.FPIndex)));
  end;
end;

procedure Teditor.Quitar1Click(Sender: TObject);
begin
  DeleteWatch(ListBox1.ItemIndex);
end;

procedure Teditor.UpdateLocales;
var
  pv:TifStringList;
  i:integer;
begin
  MemoLocales.Clear;
  if MLocales.Checked and (ce.Exec.Status > isLoaded )then begin
    pv := ce.Exec.CurrentProcVars;
    for i:=0 to pv.Count - 1 do
      MemoLocales.Lines.Add(pv[i] + ': ' + GetInspectData(ce.Exec.GetProcVar(i)));
  end;
  if MemoLocales.Lines.Count = 0 then
    MemoLocales.Lines.Add(RS_UNAVAILABLE);
end;

function Teditor.GetInspectData(pv:PIfVariant):string;
var
  t:string;
begin
  if pv = nil then begin
    Result := RPS_UnknownIdentifier;
    exit;
  end;
  Result := PSVariantToString(NewTPSVariantIFC(pv, False), t);
  case pv^.FType.BaseType of
    btString: result := CS_quote + Copy(result,2,Length(result)-2) + CS_quote;
    btChar: result := CS_charQuote + Copy(result,2,1) + CS_charQuote;
    btU8: begin
      if result = '1' then
        result := CS_True
      else
        result := CS_False;
      end;
    btClass: begin //lista
        with NewTPSVariantIFC(pv,false) do begin
          if not Assigned(TList(Dta^)) then
            result := '0'
          else
            result := IntToStr(TList(Dta^).Count);
        end;
      end;
  end;
end;

procedure Teditor.UpdateGlobales;
var
  pv:TifStringList;
  i:integer;
begin
  MemoGlobales.Clear;
  if MGlobales.Checked and (ce.Exec.Status > isLoaded )then begin
    pv := ce.Exec.GlobalVarNames;
    for i:=0 to pv.Count - 1 do
      MemoGlobales.Lines.Add(pv[i] + ': ' + GetInspectData(ce.Exec.GetGlobalVar(i)));
  end;
  if MemoGlobales.Lines.Count = 0 then
    MemoGlobales.Lines.Add(RS_UNAVAILABLE);
end;

procedure Teditor.ListBox1DblClick(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
    evaluator.ShowVariable(FWatches[ListBox1.ItemIndex]);
end;

procedure Teditor.MemoLocalesDblClick(Sender: TObject);
begin
  evaluator.showVariable(ce.Exec.CurrentProcVars[MemoLocales.CaretPos.y]);
end;

procedure Teditor.MemoGlobalesDblClick(Sender: TObject);
begin
  evaluator.showVariable(ce.Exec.GlobalVarNames[MemoGlobales.CaretPos.y]);
end;

procedure Teditor.messagesDblClick(Sender: TObject);
begin
  SetToMessage;
end;

procedure Teditor.messagesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    SetToMessage;
end;

{ resalta la línea del editor, correspondiente a la línea en donde se ha encontrado
un error, advertencia o consejo }
procedure Teditor.SetToMessage;
var
  i: Longint;
  msg:TPSPascalCompilerMessage;
  bp:TBufferCoord;
  oldml,lpos:integer;
begin
  if not Assigned(CurrentEd) then
    exit;
  oldml := FMessageLine;
  if (FMessageLine >= 0) and (FMessageLine < ce.CompilerMessageCount)then begin
    msg := ce.CompilerMessages[FMessageLine];
    if msg.ModuleName <> '' then
      SetActivePage(msg.ModuleName)
    else
      SetActivePage(ce.MainFileName);
    lpos := msg.Row;
    Currented.InvalidateLine(lpos);
  end;
  i := Messages.ItemIndex;
  if (i = FMessageLine) and (FMessageLine >= 0) then begin
    Currented.SetFocus;
    i := -1;
  end else if(i>=0)and(i< ce.CompilerMessageCount) then begin
    FMessageLine := i;
    msg := ce.CompilerMessages[i];
    if msg.ModuleName <> '' then
      SetActivePage(msg.ModuleName)
    else
      SetActivePage(ce.MainFileName);
    lpos := msg.Row;
    if oldml = lpos then begin
      Currented.SetFocus;
    end else begin
      Currented.GotoLineAndCenter(lpos);
      bp := BufferCoord(msg.Col,msg.Row);
      Currented.SetCaretAndSelection(bp,bp,BufferCoord(bp.Char + 1,bp.Line));
      Currented.InvalidateLine(lpos);
    end;
  end;
  FMessageLine := i;
end;

procedure Teditor.edEnter(Sender: TObject);
var
  msg:TPSPascalCompilerMessage;
begin
  if (FMessageLine >= 0) and (FMessageLine < ce.CompilerMessageCount) then begin
    msg := ce.CompilerMessages[FMessageLine];
    if Assigned(msg) and Assigned(CurrentEd) then
      Currented.InvalidateLine(msg.Row);
  end;
  FMessageLine := -1;
end;

procedure Teditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  function MakeRelative(path:string):string;
  var
    apppath:string;
    dir:string;
    i:integer;
  begin
    result := '';
    apppath := ExtractFilePath(application.ExeName);
    repeat
      i := Pos('\',apppath);
      if i>0 then begin
        dir := Copy(apppath,1,i);
        if Pos(dir,path) = 1 then begin
          Delete(apppath,1,i);
          Delete(path,1,i);
        end else if path[2] <> ':' then begin //no es un path absoluto
          repeat
            i := Pos('\',apppath);
            if i>0 then begin
              Delete(apppath,1,i);
              result := result + '..\';
            end;
          until i=0;
          result := result + path;
        end else begin
          result:=path;
          break;
        end;
      end;
    until i=0;
    if result = '' then
      result := path;
  end;
var
  i:integer;
  fd:TFileRecord;
begin
  if ce.Exec.Status > isLoaded then begin
    ce.Stop;
    VMonitorForm.Stop;
  end;
  for i:=0 to PageControl.PageCount - 1 do begin
    CanClose := SaveCheck(PageControl.Pages[i]);
    if not CanClose then
      break;
  end;
  {guardar los archivos abiertos en la configuración, para abrirlos de nuevo la próxima vez.
  Los almaceno como rutas relativas, de forma que no haya conflicto si se mueve todo de lugar.}
  for i:=0 to FFiles.Count - 1 do begin
    fd := TFileRecord(FFiles.Objects[i]);
    if Pos(CS_SinNombre,FFiles[i]) = 1 then
      FFiles[i] := ''
    else
      FFiles[i] := MakeRelative(fd.NombreEnDisco);
  end;
  //eliminar los que no tienen nombre
  repeat
    i := FFiles.IndexOf('');
    if i >= 0 then
      DestroyTab(i,True);
  until i < 0;
  FormConfiguracion.SaveConfig('edicion','archivo',FFiles);
end;

procedure Teditor.StatusBar1Resize(Sender: TObject);
begin
  with StatusBar1 do begin
    Panels[2].Width := ClientWidth div 3;
    Panels[1].Width := ClientWidth - Panels[2].Width - Panels[0].Width;
  end;
end;

procedure Teditor.Acercade1Click(Sender: TObject);
begin
  AcercaForm.ShowModal;
end;

procedure Teditor.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) and (ListBox1.ItemIndex >= 0) then
    evaluator.ShowVariable(FWatches[ListBox1.ItemIndex])
  else if (Key = VK_DELETE) and (ListBox1.ItemIndex >= 0) then
    DeleteWatch(ListBox1.ItemIndex);
end;

procedure Teditor.MGlobalesExecute(Sender: TObject);
begin
  with Sender as TAction do
    Checked := not Checked;
  UpdateGlobales;
end;

procedure Teditor.MLocalesExecute(Sender: TObject);
begin
  with Sender as TAction do
    Checked := not Checked;
  UpdateLocales;
end;

procedure Teditor.Informacin1Click(Sender: TObject);
begin
  with Sender as TMenuItem do begin
    Checked := not Checked;
    TabSheet1.Visible := Checked;
  end;
end;

procedure Teditor.ShowFileName;
begin
  if PageControl.ActivePageIndex < 0 then begin
    aFile := '';
    StatusBar1.Panels[2].Text := '';
  end else begin
    aFile := FFiles[PageControl.ActivePageIndex];
    StatusBar1.Panels[2].Text := FFiles[PageControl.ActivePageIndex];
  end;
end;

procedure Teditor.DeleteWatch(ind: integer);
begin
  TWatchRecord(FWatches.Objects[ind]).Free;
  FWatches.Delete(ind);
  UpdateWatches;
end;

{ TWatchRecord }

function TWatchRecord.GetNombre: string;
begin
  result := FVariable + ' (' + FTipo + ')';
end;

procedure Teditor.Q1Click(Sender: TObject);
begin
  while ListBox1.Items.Count > 0 do
    DeleteWatch(0);
end;

procedure Teditor.WReadBool(const que:string;var b: boolean);
var
  s:string;
  toshow:string;
begin
  toShow := que;
  if toShow = '' then
    toShow := FNextReadText;
  VMonitorForm.Output(toShow);
  repeat
    s:=VMonitorForm.Input;
  until (CompareText(s,CS_false) = 0) or (CompareText(s,CS_true)=0) or VMonitorForm.Stopped;
  b := CompareText(s,CS_True) = 0;
  FNextReadText := '';
end;

procedure Teditor.WReadChar(const que:string;var c: char);
var
  s:string;
  toshow:string;
begin
  toShow := que;
  if toShow = '' then
    toShow := FNextReadText;
  VMonitorForm.Output(toShow);
  repeat
    s:=VMonitorForm.Input;
  until (Length(s) = 1) or VMonitorForm.Stopped;
  if Length(s) > 0 then
    c := s[1];
  FNextReadText:='';
end;

procedure Teditor.WReadDT(const que:string;var dt: TDateTime);
var
  s:string;
  toshow:string;
begin
  toShow := que;
  if toShow = '' then
    toShow := FNextReadText;
  VMonitorForm.Output(toShow);
  repeat
    s:=VMonitorForm.Input;
    try
      dt := StrToDateTime(s);
      break;
    except
    end;
  until VMonitorForm.Stopped;
  FNextReadText := '';
end;

procedure Teditor.WReadInt(const que:string;var i: integer);
var
  s:string;
  toshow:string;
begin
  toShow := que;
  if toShow = '' then
    toShow := FNextReadText;
  VMonitorForm.Output(toShow);
  repeat
    s:=VMonitorForm.Input;
    try
      i := StrToInt64(s);
      break;
    except
    end;
  until VMonitorForm.Stopped;
  FNextReadText := '';
end;

procedure Teditor.ReadReal(var r: real);
begin
  WReadReal('',r);
end;

procedure Teditor.ReadStr(var s: string);
begin
  WReadStr('',s);
end;

procedure Teditor.ReadBool(var b: boolean);
begin
  WReadBool('',b);
end;

procedure Teditor.ReadChar(var c: char);
begin
  WReadChar('',c);
end;

procedure Teditor.ReadDT(var dt: TDateTime);
begin
  WReadDT('',dt);
end;

procedure Teditor.ReadInt(var i: integer);
begin
  WReadInt('',i);
end;

procedure Teditor.WReadReal(const que: string; var r: real);
var
  s:string;
  toshow:string;
begin
  toShow := que;
  if toShow = '' then
    toShow := FNextReadText;
  FNextReadText := '';
  VMonitorForm.Output(toShow);
  repeat
    s:=VMonitorForm.Input;
    try
      r := StrToFloat(s);
      break;
    except
    end;
  until VMonitorForm.Stopped;
end;

function Teditor.getSPCount: integer;
begin
  result:= Formconfiguracion.OrdenBusquedaMemo.Lines.Count;
end;

function Teditor.SetToSearchPath(cual: integer; original: string): string;
var
  buscar:string;
  dd,len,bd:integer;
begin
  buscar := FormConfiguracion.OrdenBusquedaMemo.Lines[cual];
  if buscar[1] in ['\','/'] then
    result := buscar
  else begin
    repeat
      dd := Pos('..',buscar);
      if dd = 1 then begin
        Delete(buscar,1,3);
        len := Length(original);
        bd := len;
        while (bd > 0) and not (original[bd] in ['/','\']) do
          Dec(bd);
        if bd > 0 then
          Delete(original,bd,len)
        else
          original := '\';
      end;
    until dd <> 1;
  end;
end;

procedure Teditor.Configuracin1Click(Sender: TObject);
begin
  FormConfiguracion.ShowModal;
end;

procedure Teditor.CreateTab(FileName:string);
var
  page:TTabSheet;
  edit:TSynEdit;
  fd:TFileRecord;
begin
  page := TTabSheet.Create(PageControl);
  try
    page.PageControl := PageControl;
    edit := TSynEdit.Create(page);
    edit.PopupMenu := ed.PopupMenu;
    edit.Parent := page;
    edit.SearchEngine := ed.SearchEngine;
    edit.TabWidth := ed.TabWidth;
    edit.Align := alClient;
    edit.Highlighter := ed.Highlighter;
    edit.Options := ed.Options;
    edit.OnEnter := ed.OnEnter;
    edit.OnGutterClick := ed.OnGutterClick;
    edit.OnSpecialLineColors := ed.OnSpecialLineColors;
    edit.OnStatusChange := ed.OnStatusChange;
    edit.OnKeyDown := ed.OnKeyDown;
    edit.Gutter.Assign(ed.Gutter);
    edit.WantReturns := ed.WantReturns;
    edit.WantTabs := ed.WantTabs;
    if FileName = '' then begin
      FileName := SinNombre;
      edit.Lines.Text := RS_EXAMPLE_CODE;
      edit.Modified := False;
    end else begin
      edit.Lines.LoadFromFile(FileName);
      edit.Modified := False;
    end;
    page.Caption := ExtractFileName(FileName);
    fd := TFileRecord.Create;
    fd.NombreEnDisco := FileName;
    FFiles.AddObject(fd.NombreReal,fd);
    PageControl.ActivePage := page;
    ShowFileName;
    edit.SetFocus;
  except // si algo sale mal, eliminar la página
    page.Free;
  end;
end;

procedure Teditor.DestroyTab(PageIndex:integer;SavedChecked:boolean=False);
var
  page:TTabSheet;
begin
  try
    page := PageControl.Pages[PageIndex];
    if SavedChecked or SaveCheck(page) then try //no verificar si ya se hizo
      page.PageControl := nil;
      TFileRecord(FFiles.Objects[PageIndex]).Free;
      FFiles.Delete(PageIndex);
    finally
      page.Free;
    end;
  except
  end;
end;

procedure Teditor.SaveFile(page: TTabSheet);
var
  fd:TFileRecord;
  editor:TSynEdit;
begin
  fd := TFileRecord(FFiles.Objects[page.TabIndex]);
  if ExtractFilePath(fd.NombreEnDisco) <> '' then
  begin
    editor := TSynEdit(page.Controls[0]);
    editor.Lines.SaveToFile(fd.NombreEnDisco);
    editor.Modified := False;
  end else
    SaveFileAs(page);
  ShowFileName;
end;

procedure Teditor.SaveFileAs(page: TTabSheet);
var
  fd:TFileRecord;
begin
  if SaveDialog1.Execute then begin
    fd := TFileRecord(FFiles.Objects[page.TabIndex]);
    fd.NombreEnDisco := SaveDialog1.FileName;
    FFiles[page.TabIndex] := fd.NombreReal;
    page.Caption := FFiles[page.TabIndex];
    SaveFile(page);
  end;
end;

procedure Teditor.Cerrar1Click(Sender: TObject);
begin
  if PageControl.ActivePageIndex >= 0 then
    DestroyTab(PageControl.ActivePageIndex);
  ShowFileName;
end;

procedure Teditor.CerrarTodas1Click(Sender: TObject);
begin
  while PageControl.PageCount > 0 do
    DestroyTab(PageControl.ActivePageIndex);
end;

function Teditor.GetCurrentEd: TSynEdit;
begin
  if Assigned(PageControl.ActivePage) then
    result := TSynEdit(PageControl.ActivePage.Controls[0])
  else
    result := nil;
end;

procedure Teditor.SetActivePage(FileName: string);
var
  i:integer;
  fd:TFileRecord;
begin
  for i:=0 to FFiles.Count - 1 do begin
    fd := TFileRecord(FFiles.Objects[i]);
    if fd.EnUso and (CompareText(fd.NombreUtiliza,FileName) = 0) then begin
      PageControl.ActivePageIndex := i;
      ShowFileName;
      break;
    end;
  end;
end;

procedure Teditor.PageControlChange(Sender: TObject);
begin
  ShowFileName;
end;

function Teditor.CRLF: string;
begin
  result := chr(13)+chr(10);
end;

procedure Teditor.MostrarOcultarnmerosdelnea1Click(Sender: TObject);
begin
  if Assigned(CurrentEd) then
    CurrentEd.Gutter.Visible :=  not CurrentEd.Gutter.Visible;
end;

procedure Teditor.edKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) and(ssCtrl in Shift) then begin
    if ssShift in Shift then begin
      if PageControl.ActivePageIndex > 0 then
        PageControl.ActivePageIndex := PageControl.ActivePageIndex - 1
      else
        PageControl.ActivePageIndex := PageControl.PageCount - 1;
    end else begin
      if PageControl.ActivePageIndex < PageControl.PageCount - 1 then
        PageControl.ActivePageIndex := PageControl.ActivePageIndex + 1
      else
        PageControl.ActivePageIndex := 0;
    end;
  end;
end;

function Teditor.SinNombre: string;
var
  i:integer;
  cual:string;
begin
  i := 0;
  cual := '';
  result := CS_SinNombre;
  while FFiles.IndexOf(result+cual) >= 0 do begin
    Inc(i);
    cual := IntToStr(i);
  end;
end;

{ TFileRecord }

procedure TFileRecord.SetNombre(const Value: string);
begin
  FFullName := Value;
  FRealName := ExtractFileName(Value);
end;

function Teditor.GetScriptActiveFile: string;
var
  fd:TFileRecord;
  nombre:string;
  i,s:integer;
begin
  try
    fd := TFileRecord(FFiles.Objects[PageControl.ActivePageIndex]);
    if fd.NombreUtiliza = '' then begin
      i:=0;
      while nombre = '' do begin
        nombre := TSynEdit(PageControl.ActivePage.Controls[0]).Lines[i];
        Inc(i);
      end;
      i := Pos(CS_program,nombre);
      s := Pos(CS_unit,nombre);
      if (i>0)and(s>0)and(i>s)then
        i := s;
      Delete(nombre,1,i+1);
      i := Pos(' ',nombre);
      Delete(nombre,1,i);
      nombre := Trim(nombre);
      i := Pos(' ',nombre);
      if i = 0 then begin
        i := Pos('//',nombre);
        if i=0 then
          i:= Pos('{',nombre);
        if i=0 then
          i := Pos('(*',nombre);
      end;
      if i> 0 then
        Delete(nombre,i,length(nombre));
      fd.FScriptName := Trim(nombre);
    end;
    result := fd.NombreUtiliza;
  except
  end;
end;

procedure Teditor.FormShow(Sender: TObject);
var
  i:integer;
  arcs:TStringList;
  app:string;
begin
  if FFirstShow then begin
    FFirstShow := False;
    app := ExtractFilepath(application.ExeName);
    arcs:=TStringList.Create;
    try
      FormConfiguracion.LoadConfig('edicion','archivo',arcs);
      if (arcs.Count > 0)or(ParamCount > 1) then while PageControl.PageCount > 0 do
        DestroyTab(0);
      for i:=0 to arcs.Count - 1 do begin
        if FileExists(app + arcs[i]) then
          CreateTab(app + arcs[i]);
      end;
    finally
      arcs.Free;
    end;
    if ParamCount > 0 then begin
      for i:=1 to ParamCount do
        CreateTab(ParamStr(i));
    end;
  end;
end;

function Teditor.BoolToStr(const bl: boolean): string;
begin
  if bl then
    result := CS_true
  else
    result := CS_false;
end;

function Teditor.TextEqual(const t1, t2: string): boolean;
begin
  result := CompareText(t1,t2) = 0;
end;

procedure Teditor.Seudocdigo1Click(Sender: TObject);
begin
  AyudaForm.ShowModal;
end;

procedure Teditor.AWordWrapUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Checked := Assigned(CurrentEd) and CurrentEd.WordWrap;
end;

function Teditor.ceBooleanRead(Sender: TObject): Boolean;
begin
  ReadBool(result);
end;

function Teditor.ceCharRead(Sender: TObject): Char;
begin
  ReadChar(result);
end;

function Teditor.ceCurrencyRead(Sender: TObject): Currency;
var
  r:real;
begin
  ReadReal(r);
  result := r;
end;

function Teditor.ceInt64Read(Sender: TObject; limit: Integer): Int64;
var
  entero:integer;
begin
  repeat
    ReadInt(entero);
  until (entero <= limit)and(entero > -limit);
  result := entero;
end;

function Teditor.ceIntegerRead(Sender: TObject; limit: Integer): Integer;
begin
  repeat
    ReadInt(result);
  until (result <= limit)and(result > -limit);
end;

function Teditor.ceRealRead(Sender: TObject; size: Integer): Real;
begin
  ReadReal(result);
end;

function Teditor.ceStringRead(Sender: TObject): String;
begin
  ReadStr(result);
end;

procedure Teditor.LimpiarUso;
var
  i:integer;
  fd:TFileRecord;
begin
  for i:=0 to PageControl.PageCount - 1 do begin
    fd := TFileRecord(FFiles.Objects[i]);
    fd.Fusing := false;
  end;
end;

procedure Teditor.UsarArchivo(pageIndex: integer);
var
  fd:TFileRecord;
begin
  if (pageIndex < 0) or (pageIndex >= FFiles.Count) then
    exit;
  fd := TFileRecord(FFiles.Objects[pageIndex]);
  fd.Fusing := true;
end;

procedure Teditor.ceCharShow(Sender: TObject; const data: Char);
begin
  PreListItem(CS_charQuote);
  WriteStr(data);
  PosListItem(CS_charQuote);
end;

procedure Teditor.ceCurrencyShow(Sender: TObject; const data: Currency);
begin
  PreListItem;
  WriteStr(FloatToStrF(data,ffCurrency,8,2));
  PosListItem;
end;

procedure Teditor.ceIntegerShow(Sender: TObject; const data: Integer);
begin
  PreListItem;
  WriteStr(IntToStr(data));
  PosListItem;
end;

procedure Teditor.ceRealShow(Sender: TObject; const data: Real);
begin
  PreListItem;
  WriteStr(FloatToStr(data));
  PosListItem;
end;

procedure Teditor.ceBooleanShow(Sender: TObject; const data: Boolean);
begin
  PreListItem;
  WriteStr(BoolToStr(data));
  PosListItem;
end;

procedure Teditor.ceBreakpoint(Sender: TObject; const FileName: AnsiString;
  Position, Row, Col: Cardinal);
begin
  SetActivePage(FileName);
  FActiveLine := Row;
  if not Assigned(CurrentEd) then
    exit;
  if (FActiveLine < Currented.TopLine +2) or (FActiveLine > CurrentEd.TopLine + CurrentEd.LinesInWindow -2) then
    CurrentEd.TopLine := FActiveLine - (CurrentEd.LinesInWindow div 2);
  Currented.CaretY := FActiveLine;
  Currented.CaretX := 1;
  WatchPanel.Enabled := True;
  Currented.Refresh;
end;

procedure Teditor.ceStringShow(Sender: TObject; const data: String);
begin
  PreListItem(CS_quote);
  WriteStr(data);
  PosListItem(CS_quote);
end;

procedure Teditor.ceReadShow(Sender: TObject; const data: String);
begin
  FNextReadText := data;
end;

procedure Teditor.AETodoUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := PageControl.PageCount > 0;
end;

procedure Teditor.AETodoExecute(Sender: TObject);
begin
  if CE.Running then
    FResume := True
  else if Compile then
    Execute;
  StatusBar1.Panels[1].Text := RS_EXECUTING;
end;

procedure Teditor.AELineaExecute(Sender: TObject);
begin
  with Sender as TAction do begin
    if Tag = 0 then
      StatusBar1.Panels[1].Text := RS_STEP_INTO
    else
      StatusBar1.Panels[1].Text := RS_STEP_OVER;
    if ce.Exec.Status = isRunning then begin
      if Tag = 0 then
        ce.StepOver
      else
        ce.StepInto;
    end else if Compile then begin
      WatchPanel.Enabled := True;
      ce.StepInto;
      editor.Execute;
    end;
  end;
end;

procedure Teditor.AReiniciarUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := ce.Exec.Status = isRunning;
end;

procedure Teditor.AReiniciarExecute(Sender: TObject);
begin
  ce.Stop;
  VMonitorForm.Stop;
end;

procedure Teditor.ceLineInfo(Sender: TObject; const FileName: AnsiString;
  Position, Row, Col: Cardinal);
begin
  if (ce.Exec.DebugMode <> dmRun)and Assigned(CurrentEd) then
  begin
    SetActivePage(FileName);
    FActiveLine := Row;
    if (FActiveLine < CurrentEd.TopLine +2) or (FActiveLine > CurrentEd.TopLine + CurrentEd.LinesInWindow -2) then
      CurrentEd.TopLine := FActiveLine - (CurrentEd.LinesInWindow div 2);
    Currented.CaretY := FActiveLine;
    Currented.CaretX := 1;

    Currented.Refresh;
    UpdateWatches;
    UpdateLocales;
    UpdateGlobales;
    StatusBar1.Panels[1].Text := 'Detenido';
  end;
end;

procedure Teditor.ceListShow(Sender: TObject; const data: Integer);
begin
  PreListItem;
  WriteStr('(');
  if data > 0 then begin
    if not Assigned(FListShow) then
      FListShow := TList.Create;
    FListShow.Add(Pointer(data));
  end else begin
    WriteStr(')');
    PosListItem;
  end;
end;

function Teditor.ceNeedFile(Sender: TObject; const OrginFileName: AnsiString;
  var FileName, Output: AnsiString): Boolean;
var
  path: string;
  f: TFileStream;
  i:integer;
  fd:TFileRecord;
begin
  try
    FileName := FileName + '.sdc';
    for i:=0 to PageControl.PageCount - 1 do begin
      if CompareText(PageControl.Pages[i].Caption,FileName)=0 then begin
        Output := TSynEdit(PageControl.Pages[i].Controls[0]).Text;
        Result := True;
        exit;
      end;
    end;
    fd := TFileRecord(FFiles.Objects[PageControl.ActivePageIndex]);
    if aFile <> '' then
      Path := ExtractFilePath(fd.NombreEnDisco)
    else
      Path := ExtractFilePath(ParamStr(0));
    Path := Path + FileName;
    try
      F := TFileStream.Create(Path, fmOpenRead or fmShareDenyWrite);
    except
      Result := false;
      exit;
    end;
    try
      SetLength(Output, f.Size);
      f.Read(Output[1], Length(Output));
    finally
      f.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure Teditor.PreListItem(predata:string='');
begin
  if Assigned(FListShow) then begin
    if predata <> '' then
      WriteStr(predata);
    FListShow[FListShow.Count-1] := Pointer(integer(FListShow.Last)-1);
  end;
end;

procedure Teditor.PosListItem(posdata:string='');
begin
  if Assigned(FListShow) then begin
    if posdata <> '' then
      WriteStr(posdata);
    if integer(FListShow.Last) <= 0 then begin
      WriteStr(')');
      FListShow.Delete(FListShow.Count - 1);
      if FListShow.Count = 0 then begin
        FListShow.Free;
        FListShow:=nil;
      end else
        PosListItem;
    end else
      WriteStr(',');
  end;
end;

procedure Teditor.ASalidaUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Checked := VMonitorForm.Visible;
end;

procedure Teditor.ASalidaExecute(Sender: TObject);
begin
  with Sender as TAction do begin
    Checked := not Checked;
    VMonitorForm.Visible := Checked;
  end;
end;

procedure Teditor.Esperar(const mensaje: string);
begin
  VMonitorForm.Output(mensaje);
  VMonitorForm.Esperar;
end;

procedure Teditor.BorrarPant;
begin
  VMonitorForm.Clear;
end;

procedure Teditor.ShowDockedMonitor(Sender: TObject);
begin
  with Sender as TVMonitorForm do begin
    if Assigned(HostDockSite) then
      PageControl1.ActivePageIndex := 1;
  end;
end;

function Teditor.Aleatorio(const e: integer): real;
begin
  if not FRandomized then
    Randomize;
  result := Random(e);
end;

function Teditor.caracterACodigo(const c: char): integer;
begin
  result := byte(c);
end;

function Teditor.codigoACaracter(const c: integer): char;
begin
  result := char(c);
end;

procedure Teditor.WatchPanelResize(Sender: TObject);
begin
  Edit1.Width := GroupBox1.ClientWidth - Edit1.Left * 2;
end;

procedure Teditor.ALimpiarMensajesUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := messages.Items.Count > 0;
end;

procedure Teditor.ALimpiarMensajesExecute(Sender: TObject);
begin
  messages.Clear;
end;

procedure Teditor.ABuscarExecute(Sender: TObject);
begin
  LocalizarForm.Show;
end;

procedure Teditor.ADetenerExecute(Sender: TObject);
begin
  ce.Pause;
  ce.StepOver;
  StatusBar1.Panels[1].Text := RS_STOPPING;
end;

procedure Teditor.UpdateAll;
begin
  UpdateWatches;
  UpdateGlobales;
  UpdateLocales;
end;

procedure Teditor.EVPUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := ce.Running;
end;

procedure Teditor.EVPExecute(Sender: TObject);
begin
  evaluator.ShowVariable('');
end;

end.
