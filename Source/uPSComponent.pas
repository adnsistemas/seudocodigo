unit uPSComponent;
{$I PascalScript.inc}
interface

uses
  SysUtils, Classes, uPSRuntime, uPSDebugger, uPSUtils,
  uPSCompiler, uPSC_dll, uPSR_dll, uPSPreProcessor;

const
  {alias to @link(ifps3.cdRegister)}
  cdRegister = uPSRuntime.cdRegister;
  {alias to @link(ifps3.cdPascal)}
  cdPascal = uPSRuntime.cdPascal;

  CdCdecl = uPSRuntime.CdCdecl;

  CdStdCall = uPSRuntime.CdStdCall;

{$IFDEF DELPHI3UP }
resourceString
{$ELSE }
const
{$ENDIF }

  RPS_UnableToReadVariant = 'Imposible leer variante';
  RPS_UnableToWriteVariant = 'Imposible escribir variante';
  RPS_ScripEngineAlreadyRunning = 'El int�rprete ya se encuentra funcionando';
  RPS_ScriptNotCompiled = 'El algoritmo no ha sido compilado';
  RPS_NotRunning = 'No se est� ejecutando';
  RPS_UnableToFindVariable = 'No se puede localizar la variable';
  RPS_UnknownIdentifier = 'Identificador desconocido';
  RPS_NoScript = 'Sin algoritmo';

type
  TPSScript = class;
  
  TDelphiCallingConvention = uPSRuntime.TPSCallingConvention;
  {Alias to @link(ifps3.TPSRuntimeClassImporter)}
  TPSRuntimeClassImporter = uPSRuntime.TPSRuntimeClassImporter;
  
  TPSPlugin = class(TComponent)
  protected
    
    procedure CompOnUses(CompExec: TPSScript); virtual;
    
    procedure ExecOnUses(CompExec: TPSScript); virtual;
    
    procedure CompileImport1(CompExec: TPSScript); virtual;
    
    procedure CompileImport2(CompExec: TPSScript); virtual;
    
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); virtual;
    
    procedure ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); virtual;
  public
  end;
  
  TIFPS3Plugin = class(TPSPlugin);
  
  TPSDllPlugin = class(TPSPlugin)
  protected
    procedure CompOnUses(CompExec: TPSScript); override;
    procedure ExecOnUses(CompExec: TPSScript); override;
  end;
  
  TIFPS3DllPlugin = class(TPSDllPlugin);


  TPSPluginItem = class(TCollectionItem)
  private
    FPlugin: TPSPlugin;
    procedure SetPlugin(const Value: TPSPlugin);
  protected
    function GetDisplayName: string; override;
  public
    procedure Assign(Source: TPersistent); override; //Birb
  published
    property Plugin: TPSPlugin read FPlugin write SetPlugin;
  end;

  
  TIFPS3CEPluginItem = class(TPSPluginItem);

  
  TPSPlugins = class(TCollection)
  private
    FCompExec: TPSScript;
  protected
    
    function GetOwner: TPersistent; override;
  public
    
    constructor Create(CE: TPSScript);
  end;

 TIFPS3CEPlugins = class(TPSPlugins);


  TPSOnGetNotVariant = function (Sender: TPSScript; const Name: tbtstring): Variant of object;
  TPSOnSetNotVariant = procedure (Sender: TPSScript; const Name: tbtstring; V: Variant) of object;
  TPSCompOptions = set of (icAllowNoBegin, icAllowUnit, icAllowNoEnd, icBooleanShortCircuit);

  TPSVerifyProc = procedure (Sender: TPSScript; Proc: TPSInternalProcedure; const Decl: tbtstring; var Error: Boolean) of object;

  TPSEvent = procedure (Sender: TPSScript) of object;

  TPSOnCompImport = procedure (Sender: TObject; x: TPSPascalCompiler) of object;

  TPSOnExecImport = procedure (Sender: TObject; se: TPSExec; x: TPSRuntimeClassImporter) of object;
  {Script engine event function}
  TPSOnNeedFile = function (Sender: TObject; const OrginFileName: tbtstring; var FileName, Output: tbtstring): Boolean of object;

  TPSOnProcessDirective = procedure (
                            Sender: TPSPreProcessor;
                            Parser: TPSPascalPreProcessorParser;
                            const Active: Boolean;
                            const DirectiveName, DirectiveParam: tbtstring;
                            Var Continue: Boolean) of Object;  // jgv

  TIntegerReadEvent = function (Sender:TObject;limit:integer):integer of object;
  TRealReadEvent = function (Sender:TObject;size:integer):real of object;
  TStringReadEvent = function (Sender:TObject):string of object;
  TCharReadEvent = function (Sender:TObject):char of object;
  TBooleanReadEvent = function (Sender:TObject):boolean of object;
  TCurrencyReadEvent = function (Sender:TObject):currency of object;
  TUnknownReadEvent = function (Sender:TObject):string of object;
  TBooleanShowEvent = procedure (Sender:TObject;const data:boolean)of object;
  TIntegerShowEvent = procedure (Sender:TObject;const data:integer)of object;
  TRealShowEvent = procedure (Sender:TObject;const data:real)of object;
  TStringShowEvent = procedure (Sender:TObject;const data:string)of object;
  TCharShowEvent = procedure (Sender:TObject;const data:char)of object;
  TCurrencyShowEvent = procedure (Sender:TObject;const data:currency)of object;
  TReadShowEvent = procedure (Sender:TObject;const data:string)of object;

  TPSScript = class(TComponent)
  private
    FOnGetNotificationVariant: TPSOnGetNotVariant;
    FOnSetNotificationVariant: TPSOnSetNotVariant;
    FCanAdd: Boolean;
    FComp: TPSPascalCompiler;
    FCompOptions: TPSCompOptions;
    FExec: TPSDebugExec;
    FSuppressLoadData: Boolean;
    FScript: TStrings;
    FOnLine: TNotifyEvent;
    FUseDebugInfo: Boolean;
    FOnAfterExecute, FOnCompile, FOnExecute: TPSEvent;
    FOnCompImport: TPSOnCompImport;
    FOnExecImport: TPSOnExecImport;
    RI: TPSRuntimeClassImporter;
    FPlugins: TPSPlugins;
    FPP: TPSPreProcessor;
    FMainFileName: tbtstring;
    FOnNeedFile: TPSOnNeedFile;
    FUsePreProcessor: Boolean;
    FDefines: TStrings;
    FOnVerifyProc: TPSVerifyProc;
    FOnProcessDirective: TPSOnProcessDirective;
    FOnProcessUnknowDirective: TPSOnProcessDirective;
    FOnFindUnknownFile: TPSOnNeedFile;
    FOnBoolRead: TBooleanReadEvent;
    FOnCharRead: TCharReadEvent;
    FOnIntRead: TIntegerReadEvent;
    FOnRealRead: TRealReadEvent;
    FOnStringRead: TStringReadEvent;
    FOnCurrencyRead: TCurrencyReadEvent;
    FOnUnknownRead: TUnknownReadEvent;
    FOnBoolShow: TBooleanShowEvent;
    FOnCharShow: TCharShowEvent;
    FOnListShow: TIntegerShowEvent;
    FOnCurrencyShow: TCurrencyShowEvent;
    FOnIntShow: TIntegerShowEvent;
    FOnRealShow: TRealShowEvent;
    FOnUnknownShow: TStringShowEvent;
    FOnStringShow: TStringShowEvent;
    FOnReadShow: TReadShowEvent;
    function GetRunning: Boolean;
    procedure SetScript(const Value: TStrings);
    function GetCompMsg(i: Integer): TPSPascalCompilerMessage;
    function GetCompMsgCount: Longint;
    function GetAbout: tbtstring;
    function ScriptUses(Sender: TPSPascalCompiler; const OriginalName,Name: tbtstring): Boolean;
    function GetExecErrorByteCodePosition: Cardinal;
    function GetExecErrorCode: TIFError;
    function GetExecErrorParam: tbtstring;
    function GetExecErrorProcNo: Cardinal;
    function GetExecErrorString: tbtstring;
    function GetExecErrorPosition: Cardinal;
    function GetExecErrorCol: Cardinal;
    function GetExecErrorRow: Cardinal;
    function GetExecErrorFileName: tbtstring;
    procedure SetDefines(const Value: TStrings);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

  protected
    //jgv move where private before - not very usefull
    procedure OnLineEvent; virtual;
    procedure SetMainFileName(const Value: tbtstring); virtual;

    //--jgv new
    function  DoOnNeedFile (Sender: TObject; const OrginFileName: tbtstring; var FileName, Output: tbtstring): Boolean; virtual;
    function  DoOnUnknowUses (Sender: TPSPascalCompiler; const OriginalName,Name: tbtstring): Boolean; virtual; // return true if processed
    procedure DoOnCompImport; virtual;
    procedure DoOnCompile; virtual;
    function  DoVerifyProc (Sender: TPSScript; Proc: TPSInternalProcedure; const Decl: tbtstring): Boolean; virtual;

    procedure DoOnExecImport (RunTimeImporter: TPSRuntimeClassImporter); virtual;
    procedure DoOnExecute (RunTimeImporter: TPSRuntimeClassImporter); virtual;
    procedure DoAfterExecute; virtual;
    function  DoOnGetNotificationVariant (const Name: tbtstring): Variant; virtual;
    procedure DoOnSetNotificationVariant (const Name: tbtstring; V: Variant); virtual;

    procedure DoOnProcessDirective (Sender: TPSPreProcessor;
                Parser: TPSPascalPreProcessorParser;
                const Active: Boolean;
                const DirectiveName, DirectiveParam: tbtstring;
                Var Continue: Boolean); virtual;
    procedure DoOnProcessUnknowDirective (Sender: TPSPreProcessor;
                Parser: TPSPascalPreProcessorParser;
                const Active: Boolean;
                const DirectiveName, DirectiveParam: tbtstring;
                Var Continue: Boolean); virtual;
  public

    function FindNamedType(const Name: tbtstring): TPSTypeRec;

    function FindBaseType(Bt: TPSBaseType): TPSTypeRec;

    property SuppressLoadData: Boolean read FSuppressLoadData write FSuppressLoadData;

    function LoadExec: Boolean;

    procedure Stop; virtual;

    constructor Create(AOwner: TComponent); override;

    destructor Destroy; override;

    function Compile: Boolean; virtual;

    function Execute: Boolean; virtual;

    property Running: Boolean read GetRunning;

    procedure GetCompiled(var data: tbtstring);

    procedure SetCompiled(const Data: tbtstring);

    property Comp: TPSPascalCompiler read FComp;

    property Exec: TPSDebugExec read FExec;

    property CompilerMessageCount: Longint read GetCompMsgCount;

    property CompilerMessages[i: Longint]: TPSPascalCompilerMessage read GetCompMsg;

    function CompilerErrorToStr(I: Longint): tbtstring;

    property ExecErrorCode: TIFError read GetExecErrorCode;

    property ExecErrorParam: tbtstring read GetExecErrorParam;

    property ExecErrorToString: tbtstring read GetExecErrorString;

    property ExecErrorProcNo: Cardinal read GetExecErrorProcNo;

    property ExecErrorByteCodePosition: Cardinal read GetExecErrorByteCodePosition;

    property ExecErrorPosition: Cardinal read GetExecErrorPosition;

    property ExecErrorRow: Cardinal read GetExecErrorRow;

    property ExecErrorCol: Cardinal read GetExecErrorCol;

    property ExecErrorFileName: tbtstring read GetExecErrorFileName;

    function AddFunctionEx(Ptr: Pointer; const Decl: tbtstring; CallingConv: TDelphiCallingConvention): Boolean;

    function AddFunction(Ptr: Pointer; const Decl: tbtstring): Boolean;


    function AddMethodEx(Slf, Ptr: Pointer; const Decl: tbtstring; CallingConv: TDelphiCallingConvention): Boolean;

    function AddMethod(Slf, Ptr: Pointer; const Decl: tbtstring): Boolean;

    function AddRegisteredVariable(const VarName, VarType: tbtstring): Boolean;
    function AddNotificationVariant(const VarName: tbtstring): Boolean;

    function AddRegisteredPTRVariable(const VarName, VarType: tbtstring): Boolean;

    function GetVariable(const Name: tbtstring): PIFVariant;

    function SetVarToInstance(const VarName: tbtstring; cl: TObject): Boolean;

    procedure SetPointerToData(const VarName: tbtstring; Data: Pointer; aType: TIFTypeRec);

    function TranslatePositionPos(Proc, Position: Cardinal; var Pos: Cardinal; var fn: tbtstring): Boolean;

    function TranslatePositionRC(Proc, Position: Cardinal; var Row, Col: Cardinal; var fn: tbtstring): Boolean;

    function GetProcMethod(const ProcName: tbtstring): TMethod;

    function ExecuteFunction(const Params: array of Variant; const ProcName: tbtstring): Variant;
  published

    property About: tbtstring read GetAbout stored false;

    property Script: TStrings read FScript write SetScript;

    property CompilerOptions: TPSCompOptions read FCompOptions write FCompOptions;

    property OnLine: TNotifyEvent read FOnLine write FOnLine;

    property OnCompile: TPSEvent read FOnCompile write FOnCompile;

    property OnExecute: TPSEvent read FOnExecute write FOnExecute;
    
    property OnAfterExecute: TPSEvent read FOnAfterExecute write FOnAfterExecute;
    
    property OnCompImport: TPSOnCompImport read FOnCompImport write FOnCompImport;

    property OnExecImport: TPSOnExecImport read FOnExecImport write FOnExecImport;

    property UseDebugInfo: Boolean read FUseDebugInfo write FUseDebugInfo default True;

    property Plugins: TPSPlugins read FPlugins write FPlugins;

    property MainFileName: tbtstring read FMainFileName write SetMainFileName;

    property UsePreProcessor: Boolean read FUsePreProcessor write FUsePreProcessor;

    property OnNeedFile: TPSOnNeedFile read FOnNeedFile write FOnNeedFile;

    property Defines: TStrings read FDefines write SetDefines;

    property OnVerifyProc: TPSVerifyProc read FOnVerifyProc write FOnVerifyProc;
    property OnGetNotificationVariant: TPSOnGetNotVariant read FOnGetNotificationVariant write FOnGetNotificationVariant;
    property OnSetNotificationVariant: TPSOnSetNotVariant read FOnSetNotificationVariant write FOnSetNotificationVariant;
    property OnFindUnknownFile: TPSOnNeedFile read FOnFindUnknownFile write FOnFindUnknownFile;

  published
    //-- jgv
    property OnProcessDirective: TPSOnProcessDirective read FOnProcessDirective write FOnProcessDirective;
    property OnProcessUnknowDirective: TPSOnProcessDirective read FOnProcessUnknowDirective write FOnProcessUnknowDirective;
  published
    //-- utn-frm
    property OnIntegerRead:TIntegerReadEvent read FOnIntRead write FOnIntRead;
    property OnRealRead:TRealReadEvent read FOnRealRead write FOnRealRead;
    property OnStringRead:TStringReadEvent read FOnStringRead write FOnStringRead;
    property OnCharRead:TCharReadEvent read FOnCharRead write FOnCharRead;
    property OnBooleanRead:TBooleanReadEvent read FOnBoolRead write FOnBoolRead;
    property OnCurrencyRead:TCurrencyReadEvent read FOnCurrencyRead write FOnCurrencyRead;
    property OnUnknownRead:TUnknownReadEvent read FOnUnknownRead write FOnUnknownRead;
    property OnIntegerShow:TIntegerShowEvent read FOnIntShow write FOnIntShow;
    property OnRealShow:TRealShowEvent read FOnRealShow write FOnRealShow;
    property OnStringShow:TStringShowEvent read FOnStringShow write FOnStringShow;
    property OnCharShow:TCharShowEvent read FOnCharShow write FOnCharShow;
    property OnListShow:TIntegerShowEvent read FOnListShow write FOnListShow;
    property OnBooleanShow:TBooleanShowEvent read FOnBoolShow write FOnBoolShow;
    property OnCurrencyShow:TCurrencyShowEvent read FOnCurrencyShow write FOnCurrencyShow;
    property OnUnknownShow:TStringShowEvent read FOnUnknownShow write FOnUnknownShow;
    property OnReadShow:TReadShowEvent read FOnReadShow write FOnREadShow;
  end;

  TIFPS3CompExec = class(TPSScript);

  
  TPSBreakPointInfo = class
  private
    FLine: Longint;
    FFileNameHash: Longint;
    FFileName: tbtstring;
    procedure SetFileName(const Value: tbtstring);
  public

    property FileName: tbtstring read FFileName write SetFileName;
    
    property FileNameHash: Longint read FFileNameHash;
    
    property Line: Longint read FLine write FLine;
  end;
  
  TPSOnLineInfo = procedure (Sender: TObject; const FileName: tbtstring; Position, Row, Col: Cardinal) of object;
  
  TPSScriptDebugger = class(TPSScript)
  private
    FOnIdle: TNotifyEvent;
    FBreakPoints: TIFList;
    FOnLineInfo: TPSOnLineInfo;
    FLastRow: Cardinal;
    FOnBreakpoint: TPSOnLineInfo;
    function GetBreakPoint(I: Integer): TPSBreakPointInfo;
    function GetBreakPointCount: Longint;
  protected
    procedure SetMainFileName(const Value: tbtstring); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    
    procedure Pause; virtual;

    procedure Resume; virtual;

    
    procedure StepInto; virtual;

    procedure StepOver; virtual;
    
    procedure SetBreakPoint(const Fn: tbtstring; Line: Longint);

    procedure ClearBreakPoint(const Fn: tbtstring; Line: Longint);

    property BreakPointCount: Longint read GetBreakPointCount;

    property BreakPoint[I: Longint]: TPSBreakPointInfo read GetBreakPoint;

    function HasBreakPoint(const Fn: tbtstring; Line: Longint): Boolean;

    procedure ClearBreakPoints;

    function GetVarContents(const Name: tbtstring): tbtstring;
    //establecer el valor de una variable
    function SetVarContents(const Name: tbtstring;content:tbtstring): boolean;
  published

    property OnIdle: TNotifyEvent read FOnIdle write FOnIdle;

    property OnLineInfo: TPSOnLineInfo read FOnLineInfo write FOnLineInfo;

    property OnBreakpoint: TPSOnLineInfo read FOnBreakpoint write FOnBreakpoint;
  end;
  
  TIFPS3DebugCompExec = class(TPSScriptDebugger);
  
  TPSCustumPlugin = class(TPSPlugin)
  private
    FOnCompileImport2: TPSEvent;
    FOnExecOnUses: TPSEvent;
    FOnCompOnUses: TPSEvent;
    FOnCompileImport1: TPSEvent;
    FOnExecImport1: TPSOnExecImport;
    FOnExecImport2: TPSOnExecImport;
  protected
    procedure CompOnUses(CompExec: TPSScript); override;
    procedure ExecOnUses(CompExec: TPSScript); override;
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure CompileImport2(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;

    procedure ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  public
  published
    property OnCompOnUses : TPSEvent read FOnCompOnUses write FOnCompOnUses;
    property OnExecOnUses: TPSEvent read FOnExecOnUses write FOnExecOnUses;
    property OnCompileImport1: TPSEvent read FOnCompileImport1 write FOnCompileImport1; 
    property OnCompileImport2: TPSEvent read FOnCompileImport2 write FOnCompileImport2;
    property OnExecImport1: TPSOnExecImport read FOnExecImport1 write FOnExecImport1;
    property OnExecImport2: TPSOnExecImport read FOnExecImport2 write FOnExecImport2;
  end;  

implementation

uses langdef;

function MyGetVariant(Sender: TPSExec; const Name: tbtstring): Variant;
begin
  Result := TPSScript (Sender.Id).DoOnGetNotificationVariant(Name);
end;

procedure MySetVariant(Sender: TPSExec; const Name: tbtstring; V: Variant);
begin
  TPSScript (Sender.Id).DoOnSetNotificationVariant(Name, V);
end;

function CompScriptUses(Sender: TPSPascalCompiler; const OriginalName:tbtString;const Name: tbtstring): Boolean;
begin
  Result := TPSScript(Sender.ID).ScriptUses(Sender, OriginalName,Name);
end;

procedure ExecOnRead(Sender:TPSExec;t:tpsBaseType;var Data);
var
  scp:TPSScript;
  limit:longword;
begin
  scp := TPSScript(Sender.ID);
  case t of
    btU8: begin //logico
      Integer(Data) := 0;
      if Assigned(scp.FOnBoolRead) and scp.FOnBoolRead(scp) then
        Integer(Data) := 1;
    end;
    btS8,btU16,btS16,btU32,btS32: begin
      Integer(Data) := 0;
      case t of
        btS8:limit := High(shortint); //entero_m�nimo
        btU16:limit := High(word); //ordinal_peque�o
        btS16:limit := High(smallint);//entero_peque�o
        btU32:limit := High(longword);//ordinal
        else//entero
          limit := High(integer);
      end;
      if Assigned(scp.FOnIntRead) then
        Integer(Data) := scp.FOnIntRead(scp,limit);
    end;
    btString: begin //cadena
      string(Pointer(data)) := '';
      if Assigned(scp.FOnStringRead) then
        string(Pointer(data)) := scp.FOnStringRead(scp);
    end;
    btSingle,btDouble,btExtended:begin
      real(data) := 0;
      limit := 0;
      case t of
        btSingle: limit := 1; //real_peque�o
        btDouble: limit := 2;//real
        btExtended: limit := 4;//real_largo
      end;
      if Assigned(scp.FOnRealRead) then
        real(data) := scp.FOnRealRead(scp,limit);
    end;
    btCurrency: begin //moneda
      currency(data) := 0;
      if Assigned(scp.FOnCurrencyRead) then
        currency(data) := scp.FOnCurrencyRead(scp);
    end;
    btChar: begin //caracter
      char(data) := #0;
      if Assigned(scp.FOnCharRead) then
        char(data) := scp.FOnCharRead(scp);
    end;
    else begin //?
      if Assigned(scp.FOnUnknownRead) then
        string(Pointer(Data)) := scp.FOnUnknownRead(scp);
    end;
  end;
end;

procedure ExecOnShow(Sender:TPSExec;t:tpsBaseType;const Data);
var
  scp:TPSScript;
begin
  scp := TPSScript(Sender.ID);
  case t of
    btU8: begin //logico
      if Assigned(scp.FOnBoolShow) then
        scp.FOnBoolShow(scp,boolean(Data));
    end;
    btS8,btU16,btS16,btU32,btS32: begin
      if Assigned(scp.FOnIntShow) then
        scp.FOnIntShow(scp,integer(data));
    end;
    btString: begin //cadena
      if Assigned(scp.FOnStringShow) then
        scp.FOnStringShow(scp,string(PChar(data)));
    end;
    btSingle,btDouble,btExtended:begin
      if Assigned(scp.FOnRealShow) then
        scp.FOnRealShow(scp,real(data));
    end;
    btCurrency: begin //moneda
      if Assigned(scp.FOnCurrencyShow) then
        scp.FOnCurrencyShow(scp,currency(data));
    end;
    btChar: begin //caracter
      if Assigned(scp.FOnCharShow) then
        scp.FOnCharShow(scp,char(data));
    end;
    btClass:begin //lista
      if Assigned(scp.FOnListShow) then
        scp.FOnListShow(scp,integer(data));
    end;
    else begin //?
      if Assigned(scp.FOnUnknownShow) then
        scp.FOnUnknownShow(scp,string(PChar(data)));
    end;
  end;
end;

procedure ExecOnReadShow(Sender:TPSExec;const Data:string);
var
  scp:TPSScript;
begin
  scp := TPSScript(Sender.ID);
  if Assigned(scp.FOnReadShow) then
    scp.FOnReadShow(scp,data)
  else
    ExecOnShow(Sender,btString,data);
end;

procedure ExecOnLine(Sender: TPSExec);
begin
  if assigned(TPSScript(Sender.ID).FOnLine) then
  begin
    TPSScript(Sender.ID).OnLineEvent;
  end;
end;

function CompExportCheck(Sender: TPSPascalCompiler; Proc: TPSInternalProcedure; const ProcDecl: tbtstring): Boolean;
begin
  Result := TPSScript(Sender.ID).DoVerifyProc (Sender.ID, Proc, ProcDecl);
end;


procedure callObjectOnProcessDirective (
  Sender: TPSPreProcessor;
  Parser: TPSPascalPreProcessorParser;
  const Active: Boolean;
  const DirectiveName, DirectiveParam: tbtstring;
  Var Continue: Boolean);
begin
  TPSScript (Sender.ID).DoOnProcessUnknowDirective(Sender, Parser, Active, DirectiveName, DirectiveParam, Continue);
end;

procedure callObjectOnProcessUnknowDirective (
  Sender: TPSPreProcessor;
  Parser: TPSPascalPreProcessorParser;
  const Active: Boolean;
  const DirectiveName, DirectiveParam: tbtstring;
  Var Continue: Boolean);
begin
  TPSScript (Sender.ID).DoOnProcessDirective(Sender, Parser, Active, DirectiveName, DirectiveParam, Continue);
end;


{ TPSPlugin }
procedure TPSPlugin.CompileImport1(CompExec: TPSScript);
begin
  // do nothing
end;

procedure TPSPlugin.CompileImport2(CompExec: TPSScript);
begin
  // do nothing
end;

procedure TPSPlugin.CompOnUses(CompExec: TPSScript);
begin
 // do nothing
end;

procedure TPSPlugin.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  // do nothing
end;

procedure TPSPlugin.ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  // do nothing
end;

procedure TPSPlugin.ExecOnUses(CompExec: TPSScript);
begin
 // do nothing
end;


{ TPSScript }

function TPSScript.AddFunction(Ptr: Pointer;
  const Decl: tbtstring): Boolean;
begin
  Result := AddFunctionEx(Ptr, Decl, cdRegister);
end;

function TPSScript.AddFunctionEx(Ptr: Pointer; const Decl: tbtstring;
  CallingConv: TDelphiCallingConvention): Boolean;
var
  P: TPSRegProc;
begin
  if not FCanAdd then begin Result := False; exit; end;
  p := Comp.AddDelphiFunction(Decl);
  if p <> nil then
  begin
    Exec.RegisterDelphiFunction(Ptr, p.Name, CallingConv);
    Result := True;
  end else Result := False;
end;

function TPSScript.AddRegisteredVariable(const VarName,
  VarType: tbtstring): Boolean;
var
  FVar: TPSVar;
begin
  if not FCanAdd then begin Result := False; exit; end;
  FVar := FComp.AddUsedVariableN(varname, vartype);
  if fvar = nil then
    result := False
  else begin
    fvar.exportname := fvar.Name;
    Result := True;
  end;
end;

function CENeedFile(Sender: TPSPreProcessor; const callingfilename: tbtstring; var FileName, Output: tbtstring): Boolean;
begin
  Result := TPSScript (Sender.ID).DoOnNeedFile(Sender.ID, CallingFileName, FileName, Output);
end;

procedure CompTranslateLineInfo(Sender: TPSPascalCompiler; var Pos, Row, Col: Cardinal; var Name: tbtstring);
var
  res: TPSLineInfoResults;
begin
  if TPSScript(Sender.ID).FPP.CurrentLineInfo.GetLineInfo(Name, Pos, Res) then
  begin
    Pos := Res.Pos;
    Row := Res.Row;
    Col := Res.Col;
    Name := Res.Name;
  end;
end;

function TPSScript.Compile: Boolean;
var
  i: Longint;
  dta: tbtstring;
begin
  FExec.Clear;
  FExec.CMD_Err(erNoError);
  FExec.ClearspecialProcImports;
  FExec.ClearFunctionList;
  if ri <> nil then
  begin
    RI.Free;
    RI := nil;
  end;
  RI := TPSRuntimeClassImporter.Create;
  for i := 0 to FPlugins.Count -1 do
  begin
    if (TPSPluginItem(FPlugins.Items[i]) <> nil) and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
      TPSPluginItem(FPlugins.Items[i]).Plugin.ExecImport1(Self, ri);
  end;

  DoOnExecImport (RI);
  
  for i := 0 to FPlugins.Count -1 do
  begin
    if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
      TPSPluginItem(FPlugins.Items[i]).Plugin.ExecImport2(Self, ri);
  end;
  RegisterClassLibraryRuntime(Exec, RI);
  for i := 0 to FPlugins.Count -1 do
  begin
    if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
      TPSPluginItem(FPlugins.Items[i]).Plugin.ExecOnUses(Self);
  end;
  FCanAdd := True;
  FComp.BooleanShortCircuit := icBooleanShortCircuit in FCompOptions;
  FComp.AllowNoBegin := icAllowNoBegin in FCompOptions;
  FComp.AllowUnit := icAllowUnit in FCompOptions;
  FComp.AllowNoEnd := icAllowNoEnd in FCompOptions;
  if FUsePreProcessor then
  begin
    FPP.Clear;
    FPP.Defines.Assign(FDefines);
    FComp.OnTranslateLineInfo := CompTranslateLineInfo;
    Fpp.OnProcessDirective := callObjectOnProcessDirective;
    Fpp.OnProcessUnknowDirective := callObjectOnProcessUnknowDirective;
    Fpp.MainFile := FScript.Text;
    Fpp.MainFileName := FMainFileName;
    Fpp.PreProcess(FMainFileName, dta);
    if FComp.Compile(dta) then
    begin
      FCanAdd := False;
      if (not SuppressLoadData) and (not LoadExec) then
      begin
        Result := False;
      end else
        Result := True;
    end else Result := False;
    Fpp.AdjustMessages(Comp);
  end else
  begin
    FComp.OnTranslateLineInfo := nil;
    if FComp.Compile(FScript.Text) then
    begin
      FCanAdd := False;
      if not LoadExec then
      begin
        Result := False;
      end else
        Result := True;
    end else Result := False;
  end;
end;

function TPSScript.CompilerErrorToStr(I: Integer): tbtstring;
begin
  Result := CompilerMessages[i].MessageToString;
end;

constructor TPSScript.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FComp := TPSPascalCompiler.Create;
  FExec := TPSDebugExec.Create;
  FScript := TStringList.Create;
  FPlugins := TPSPlugins.Create(self);

  FComp.ID := Self;
  FComp.OnUses := CompScriptUses;
  FComp.OnExportCheck := CompExportCheck;
  FExec.Id := Self;
  FExec.OnRunLine:= ExecOnLine;
  FExec.OnRead := ExecOnRead;
  FExec.OnShow := ExecOnShow;
  FExec.OnShowForRead := ExecOnReadShow;
  FExec.OnGetNVariant := MyGetVariant;
  FExec.OnSetNVariant := MySetVariant;

  FUseDebugInfo := True;

  FPP := TPSPreProcessor.Create;
  FPP.Id := Self;
  FPP.OnNeedFile := CENeedFile;

  FDefines := TStringList.Create;
end;

destructor TPSScript.Destroy;
begin
  FDefines.Free;

  FPP.Free;
  RI.Free;
  FPlugins.Free;
  FPlugins := nil;
  FScript.Free;
  FExec.Free;
  FComp.Free;
  inherited Destroy;
end;

function TPSScript.Execute: Boolean;
begin
  if Running then raise Exception.Create(RPS_ScripEngineAlreadyRunning);
  if SuppressLoadData then
    LoadExec;

  DoOnExecute (RI);

  FExec.DebugEnabled := FUseDebugInfo;
  Result := FExec.RunScript and (FExec.ExceptionCode = erNoError) ;

  DoAfterExecute;
end;

function TPSScript.GetAbout: tbtstring;
begin
  Result := TPSExec.About;
end;

procedure TPSScript.GetCompiled(var data: tbtstring);
begin
  if not FComp.GetOutput(Data) then
    raise Exception.Create(RPS_ScriptNotCompiled);
end;

function TPSScript.GetCompMsg(i: Integer): TPSPascalCompilerMessage;
begin
  Result := FComp.Msg[i];
end;

function TPSScript.GetCompMsgCount: Longint;
begin
  Result := FComp.MsgCount;
end;

function TPSScript.GetExecErrorByteCodePosition: Cardinal;
begin
  Result := Exec.ExceptionPos;
end;

function TPSScript.GetExecErrorCode: TIFError;
begin
  Result := Exec.ExceptionCode;
end;

function TPSScript.GetExecErrorParam: tbtstring;
begin
  Result := Exec.ExceptionString;
end;

function TPSScript.GetExecErrorPosition: Cardinal;
begin
  Result := FExec.TranslatePosition(Exec.ExceptionProcNo, Exec.ExceptionPos);
end;

function TPSScript.GetExecErrorProcNo: Cardinal;
begin
  Result := Exec.ExceptionProcNo;
end;

function TPSScript.GetExecErrorString: tbtstring;
begin
  Result := TIFErrorToString(Exec.ExceptionCode, Exec.ExceptionString);
end;

function TPSScript.GetVariable(const Name: tbtstring): PIFVariant;
begin
  Result := FExec.GetVar2(name);
end;

function TPSScript.LoadExec: Boolean;
var
  s: tbtstring;
begin
  if (not FComp.GetOutput(s)) or (not FExec.LoadData(s)) then
  begin
    Result := False;
    exit;
  end;
  if FUseDebugInfo then
  begin
    FComp.GetDebugOutput(s);
    FExec.LoadDebugData(s);
  end;
  Result := True;
end;

function TPSScript.ScriptUses(Sender: TPSPascalCompiler;
  const OriginalName,Name: tbtstring): Boolean;
var
  i: Longint;
begin
  if Name = Uppercase(CS_SYSTEM) then
  begin
    for i := 0 to FPlugins.Count -1 do
    begin
      if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
        TPSPluginItem(FPlugins.Items[i]).Plugin.CompOnUses(Self);
    end;
    for i := 0 to FPlugins.Count -1 do
    begin
      if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
        TPSPluginItem(FPlugins.Items[i]).Plugin.CompileImport1(self);
    end;

    DoOnCompImport;

    for i := 0 to FPlugins.Count -1 do
    begin
      if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
        TPSPluginItem(FPlugins.Items[i]).Plugin.CompileImport2(Self);
    end;

    DoOnCompile;

    Result := True;
  end
  else begin
    Result := DoOnUnknowUses (Sender, OriginalName,Name);
{    If Not Result then
      Sender.MakeError('', ecUnknownIdentifier, Name);}
  end;
end;

procedure TPSScript.SetCompiled(const Data: tbtstring);
var
  i: Integer;
begin
  FExec.Clear;
  FExec.ClearspecialProcImports;
  FExec.ClearFunctionList;
  if ri <> nil then
  begin
    RI.Free;
    RI := nil;
  end;
  RI := TPSRuntimeClassImporter.Create;
  for i := 0 to FPlugins.Count -1 do
  begin
    if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
        TPSPluginItem(FPlugins.Items[i]).Plugin.ExecImport1(Self, ri);
  end;

  DoOnExecImport(RI);

  for i := 0 to FPlugins.Count -1 do
  begin
    if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
      TPSPluginItem(FPlugins.Items[i]).Plugin.ExecImport2(Self, ri);
  end;
  RegisterClassLibraryRuntime(Exec, RI);
  for i := 0 to FPlugins.Count -1 do
  begin
    if (TPSPluginItem(FPlugins.Items[i]) <> nil)and (TPSPluginItem(FPlugins.Items[i]).Plugin <> nil) then
      TPSPluginItem(FPlugins.Items[i]).Plugin.ExecOnUses(Self);
  end;
  if not FExec.LoadData(Data) then
    raise Exception.Create(GetExecErrorString);
end;

function TPSScript.SetVarToInstance(const VarName: tbtstring; cl: TObject): Boolean;
var
  p: PIFVariant;
begin
  p := GetVariable(VarName);
  if p <> nil then
  begin
    SetVariantToClass(p, cl);
    result := true;
  end else result := false;
end;

procedure TPSScript.SetScript(const Value: TStrings);
begin
  FScript.Assign(Value);
end;


function TPSScript.AddMethod(Slf, Ptr: Pointer;
  const Decl: tbtstring): Boolean;
begin
  Result := AddMethodEx(Slf, Ptr, Decl, cdRegister);
end;

function TPSScript.AddMethodEx(Slf, Ptr: Pointer; const Decl: tbtstring;
  CallingConv: TDelphiCallingConvention): Boolean;
var
  P: TPSRegProc;
begin
  if not FCanAdd then begin Result := False; exit; end;
  p := Comp.AddDelphiFunction(Decl);
  if p <> nil then
  begin
    Exec.RegisterDelphiMethod(Slf, Ptr, p.Name, CallingConv);
    Result := True;
  end else Result := False;
end;

procedure TPSScript.OnLineEvent;
begin
  if @FOnLine <> nil then FOnLine(Self);
end;

function TPSScript.GetRunning: Boolean;
begin
  Result := FExec.Status = isRunning;
end;

function TPSScript.GetExecErrorCol: Cardinal;
var
  s: tbtstring;
  D1: Cardinal;
begin
  if not TranslatePositionRC(Exec.ExceptionProcNo, Exec.ExceptionPos, D1, Result, s) then
    Result := 0;
end;

function TPSScript.TranslatePositionPos(Proc, Position: Cardinal;
  var Pos: Cardinal; var fn: tbtstring): Boolean;
var
  D1, D2: Cardinal;
begin
  Result := Exec.TranslatePositionEx(Exec.ExceptionProcNo, Exec.ExceptionPos, Pos, D1, D2, fn);
end;

function TPSScript.TranslatePositionRC(Proc, Position: Cardinal;
  var Row, Col: Cardinal; var fn: tbtstring): Boolean;
var
  d1: Cardinal;
begin
  Result := Exec.TranslatePositionEx(Proc, Position, d1, Row, Col, fn);
end;


function TPSScript.GetExecErrorRow: Cardinal;
var
  D1: Cardinal;
  s: tbtstring;
begin
  if not TranslatePositionRC(Exec.ExceptionProcNo, Exec.ExceptionPos, Result, D1, s) then
    Result := 0;
end;

procedure TPSScript.Stop;
begin
  if (FExec.Status = isRunning) or (Fexec.Status = isPaused) then
    FExec.Stop
  else
    raise Exception.Create(RPS_NotRunning);
end;

function TPSScript.GetProcMethod(const ProcName: tbtstring): TMethod;
begin
  Result := FExec.GetProcAsMethodN(ProcName)
end;

procedure TPSScript.SetMainFileName(const Value: tbtstring);
begin
  FMainFileName := Value;
end;

function TPSScript.GetExecErrorFileName: tbtstring;
var
  D1, D2: Cardinal;
begin
  if not TranslatePositionRC(Exec.ExceptionProcNo, Exec.ExceptionPos, D1, D2, Result) then
    Result := '';
end;

procedure TPSScript.SetPointerToData(const VarName: tbtstring;
  Data: Pointer; aType: TIFTypeRec);
var
  v: PIFVariant;
  t: TPSVariantIFC;
begin
  v := GetVariable(VarName);
  if (Atype = nil) or (v = nil) then raise Exception.Create(RPS_UnableToFindVariable);
  t.Dta := @PPSVariantData(v).Data;
  t.aType := v.FType;
  t.VarParam := false;
  VNSetPointerTo(t, Data, aType);
end;

function TPSScript.AddRegisteredPTRVariable(const VarName,
  VarType: tbtstring): Boolean;
var
  FVar: TPSVar;
begin
  if not FCanAdd then begin Result := False; exit; end;
  FVar := FComp.AddUsedVariableN(varname, vartype);
  if fvar = nil then
    result := False
  else begin
    fvar.exportname := fvar.Name;
    fvar.SaveAsPointer := true;
    Result := True;
  end;
end;

procedure TPSScript.SetDefines(const Value: TStrings);
begin
  FDefines.Assign(Value);
end;

function TPSScript.ExecuteFunction(const Params: array of Variant;
  const ProcName: tbtstring): Variant;
begin
  if SuppressLoadData then
    LoadExec;

  DoOnExecute (RI);

  FExec.DebugEnabled := FUseDebugInfo;

  Result := Exec.RunProcPN(Params, ProcName);

  DoAfterExecute;
end;

function TPSScript.FindBaseType(Bt: TPSBaseType): TPSTypeRec;
begin
  Result := Exec.FindType2(Bt);
end;

function TPSScript.FindNamedType(const Name: tbtstring): TPSTypeRec;
begin
  Result := Exec.GetTypeNo(Exec.GetType(Name));
end;

procedure TPSScript.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: Longint;
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (aComponent is TPSPlugin) then
  begin
    for i := Plugins.Count -1 downto 0 do
    begin
      if (Plugins.Items[i] as TPSPluginItem).Plugin = aComponent then
        {$IFDEF FPC_COL_NODELETE}
        TCollectionItem(Plugins.Items[i]).Free;
        {$ELSE}
        Plugins.Delete(i);
        {$ENDIF}
    end;
  end;
end;

function TPSScript.AddNotificationVariant(const VarName: tbtstring): Boolean;
begin
  Result := AddRegisteredVariable(VarName, '!NOTIFICATIONVARIANT');
end;

procedure TPSScript.DoOnProcessDirective(Sender: TPSPreProcessor;
  Parser: TPSPascalPreProcessorParser; const Active: Boolean;
  const DirectiveName, DirectiveParam: tbtstring; var Continue: Boolean);
begin
  If Assigned (OnProcessDirective) then
    OnProcessDirective (Sender, Parser, Active, DirectiveName, DirectiveParam, Continue);
end;

procedure TPSScript.DoOnProcessUnknowDirective(Sender: TPSPreProcessor;
  Parser: TPSPascalPreProcessorParser; const Active: Boolean;
  const DirectiveName, DirectiveParam: tbtstring; var Continue: Boolean);
begin
  If Assigned (OnProcessUnknowDirective) then
    OnProcessUnknowDirective (Sender, Parser, Active, DirectiveName, DirectiveParam, Continue);
end;

function TPSScript.DoOnNeedFile(Sender: TObject;
  const OrginFileName: tbtstring; var FileName, Output: tbtstring): Boolean;
begin
  If Assigned (OnNeedFile) then
    Result := OnNeedFile(Sender, OrginFileName, FileName, Output)
  else
    Result := False;
end;

function TPSScript.DoOnUnknowUses(Sender: TPSPascalCompiler;
  const OriginalName,Name: tbtstring): Boolean;
var
  lPrevAllowUnit: Boolean;
  lData, lName: tbtstring;
begin
  if assigned(FOnFindUnknownFile) then begin
    lName := Name;
    if FOnFindUnknownFile(self, OriginalName, lName, lData) then begin
      lPrevAllowUnit := FComp.AllowUnit;
      FComp.AllowUnit := true;
      if FUsePreProcessor then
      begin
        FPP.Defines.Assign(FDefines);
        Fpp.MainFile := lData;
        Fpp.MainFileName := lName;
        Fpp.PreProcess(lName, lData);
        Result := FComp.Compile(lData);
        Fpp.AdjustMessages(FComp);
      end else
      begin
        FComp.OnTranslateLineInfo := nil;
        Result := FComp.Compile(lData);
      end;
      FComp.AllowUnit := lPrevAllowUnit;
    end else begin
      FComp.MakeError(FComp.UnitName, ecUnknownIdentifier, OriginalName);
      Result := false;
    end;
  end else begin
    FComp.MakeError(FComp.UnitName, ecUnknownIdentifier, OriginalName);
    result := false;
  end;
end;

procedure TPSScript.DoOnCompImport;
begin
  if assigned(OnCompImport) then
    OnCompImport(Self, Comp);
end;

procedure TPSScript.DoOnCompile;
begin
  if assigned(OnCompile) then
    OnCompile(Self);
end;

procedure TPSScript.DoOnExecute;
begin
  If Assigned (OnExecute) then
    OnExecute (Self);
end;

procedure TPSScript.DoAfterExecute;
begin
  if Assigned (OnAfterExecute) then
    OnAfterExecute(Self);
end;

function TPSScript.DoVerifyProc(Sender: TPSScript;
  Proc: TPSInternalProcedure; const Decl: tbtstring): Boolean;
begin
  if Assigned(OnVerifyProc) then begin
    Result := false;
    OnVerifyProc(Sender, Proc, Decl, Result);
    Result := not Result;
  end
  else
    Result := True;
end;

procedure TPSScript.DoOnExecImport(
  RunTimeImporter: TPSRuntimeClassImporter);
begin
  if assigned(OnExecImport) then
    OnExecImport(Self, FExec, RunTimeImporter);
end;

function TPSScript.DoOnGetNotificationVariant(const Name: tbtstring): Variant;
begin
  if Not Assigned (OnGetNotificationVariant) then
    raise Exception.Create(RPS_UnableToReadVariant);
  Result := OnGetNotificationVariant(Self, Name);
end;

procedure TPSScript.DoOnSetNotificationVariant(const Name: tbtstring;
  V: Variant);
begin
  if Not Assigned (OnSetNotificationVariant) then
    raise Exception.Create(RPS_UnableToWriteVariant);
  OnSetNotificationVariant(Self, Name, v);
end;

{ TPSDllPlugin }

procedure TPSDllPlugin.CompOnUses;
begin
  CompExec.Comp.OnExternalProc := DllExternalProc;
end;

procedure TPSDllPlugin.ExecOnUses;
begin
  RegisterDLLRuntime(CompExec.Exec);
end;



{ TPS3DebugCompExec }

procedure LineInfo(Sender: TPSDebugExec; const FileName: tbtstring; Position, Row, Col: Cardinal);
var
  Dc: TPSScriptDebugger;
  h, i: Longint;
  bi: TPSBreakPointInfo;
  lFileName: tbtstring;
begin
  Dc := Sender.Id;
  if FileName = '' then
    lFileName := dc.MainFileName
  else
    lFileName := FileName;

  if @dc.FOnLineInfo <> nil then dc.FOnLineInfo(dc, lFileName, Position, Row, Col);
  if row = dc.FLastRow then exit;
  dc.FLastRow := row;
  h := MakeHash(lFileName);
  bi := nil;
  for i := DC.FBreakPoints.Count -1 downto 0 do
  begin
    bi := Dc.FBreakpoints[i];
    if (h = bi.FileNameHash) and (lFileName = bi.FileName) and (Cardinal(bi.Line) = Row) then
    begin
      Break;
    end;
    Bi := nil;
  end;
  if bi <> nil then
  begin
    if @dc.FOnBreakpoint <> nil then dc.FOnBreakpoint(dc, lFileName, Position, Row, Col);
    dc.Pause;
  end;
end;

procedure IdleCall(Sender: TPSDebugExec);
var
  Dc: TPSScriptDebugger;
begin
  Dc := Sender.Id;
  if @dc.FOnIdle <> nil then
    dc.FOnIdle(DC)
  else
    dc.Exec.Run;
end;

procedure TPSScriptDebugger.ClearBreakPoint(const Fn: tbtstring; Line: Integer);
var
  h, i: Longint;
  bi: TPSBreakPointInfo;
begin
  h := MakeHash(Fn);
  for i := FBreakPoints.Count -1 downto 0 do
  begin
    bi := FBreakpoints[i];
    if (h = bi.FileNameHash) and (Fn = bi.FileName) and (bi.Line = Line) then
    begin
      FBreakPoints.Delete(i);
      bi.Free;
      Break;
    end;
  end;
end;

procedure TPSScriptDebugger.ClearBreakPoints;
var
  i: Longint;
begin
  for i := FBreakPoints.Count -1 downto 0 do
    TPSBreakPointInfo(FBreakPoints[i]).Free;
  FBreakPoints.Clear;;
end;

constructor TPSScriptDebugger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBreakPoints := TIFList.Create;
  FExec.OnSourceLine := LineInfo;
  FExec.OnIdleCall := IdleCall;
end;

destructor TPSScriptDebugger.Destroy;
var
  i: Longint;
begin
  for i := FBreakPoints.Count -1 downto 0 do
  begin
    TPSBreakPointInfo(FBreakPoints[i]).Free;
  end;
  FBreakPoints.Free;
  inherited Destroy;
end;

function TPSScriptDebugger.GetBreakPoint(I: Integer): TPSBreakPointInfo;
begin
  Result := FBreakPoints[i];
end;

function TPSScriptDebugger.GetBreakPointCount: Longint;
begin
  Result := FBreakPoints.Count;
end;

function TPSScriptDebugger.GetVarContents(const Name: tbtstring): tbtstring;
var
  i: Longint;
  pv: PIFVariant;
  s1, s: tbtstring;
begin
  s := Uppercase(Name);
  if pos('.', s) > 0 then
  begin
    s1 := copy(s,1,pos('.', s) -1);
    delete(s,1,pos('.', Name));
  end else begin
    s1 := s;
    s := '';
  end;
  pv := nil;
  for i := 0 to Exec.CurrentProcVars.Count -1 do
  begin
    if Uppercase(Exec.CurrentProcVars[i]) =  s1 then
    begin
      pv := Exec.GetProcVar(i);
      break;
    end;
  end;
  if pv = nil then
  begin
    for i := 0 to Exec.CurrentProcParams.Count -1 do
    begin
      if Uppercase(Exec.CurrentProcParams[i]) =  s1 then
      begin
        pv := Exec.GetProcParam(i);
        break;
      end;
    end;
  end;
  if pv = nil then
  begin
    for i := 0 to Exec.GlobalVarNames.Count -1 do
    begin
      if Uppercase(Exec.GlobalVarNames[i]) =  s1 then
      begin
        pv := Exec.GetGlobalVar(i);
        break;
      end;
    end;
  end;
  if pv = nil then
    Result := RPS_UnknownIdentifier
  else
    Result := PSVariantToString(NewTPSVariantIFC(pv, False), s);
end;

function TPSScriptDebugger.HasBreakPoint(const Fn: tbtstring; Line: Integer): Boolean;
var
  h, i: Longint;
  bi: TPSBreakPointInfo;
begin
  h := MakeHash(Fn);
  for i := FBreakPoints.Count -1 downto 0 do
  begin
    bi := FBreakpoints[i];
    if (h = bi.FileNameHash) and (Fn = bi.FileName) and (bi.Line = Line) then
    begin
      Result := true;
      exit;
    end;
  end;
  Result := False;
end;

procedure TPSScriptDebugger.Pause;
begin
  if FExec.Status = isRunning then
    FExec.Pause
  else
    raise Exception.Create(RPS_NotRunning);
end;

procedure TPSScriptDebugger.Resume;
begin
  if FExec.Status = isRunning then
    FExec.Run
  else
    raise Exception.Create(RPS_NotRunning);
end;

procedure TPSScriptDebugger.SetBreakPoint(const fn: tbtstring; Line: Integer);
var
  i, h: Longint;
  BI: TPSBreakPointInfo;
begin
  h := MakeHash(fn);
  for i := FBreakPoints.Count -1 downto 0 do
  begin
    bi := FBreakpoints[i];
    if (h = bi.FileNameHash) and (fn = bi.FileName) and (bi.Line = Line) then
      exit;
  end;
  bi := TPSBreakPointInfo.Create;
  FBreakPoints.Add(bi);
  bi.FileName := fn;
  bi.Line := Line;
end;

procedure TPSScriptDebugger.SetMainFileName(const Value: tbtstring);
var
  OldFn: tbtstring;
  h1, h2,i: Longint;
  bi: TPSBreakPointInfo;
begin
  OldFn := FMainFileName;
  inherited SetMainFileName(Value);
  h1 := MakeHash(OldFn);
  h2 := MakeHash(Value);
  if OldFn <> Value then
  begin
    for i := FBreakPoints.Count -1 downto 0 do
    begin
      bi := FBreakPoints[i];
      if (bi.FileNameHash = h1) and (bi.FileName = OldFn) then
      begin
        bi.FFileNameHash := h2;
        bi.FFileName := Value;
      end else if (bi.FileNameHash = h2) and (bi.FileName = Value) then
      begin
        // It's already the new filename, that can't be right, so remove all the breakpoints there
        FBreakPoints.Delete(i);
        bi.Free;
      end;
    end;
  end;
end;

function TPSScriptDebugger.SetVarContents(const Name: tbtstring;
  content:tbtString): boolean;
var
  i: Longint;
  pv: PIFVariant;
  s1, s: tbtstring;
  varp: TPSVariantIFC;
begin
  result := False;
  s := Uppercase(Name);
  if pos('.', s) > 0 then
  begin
    s1 := copy(s,1,pos('.', s) -1);
    delete(s,1,pos('.', Name));
  end else begin
    s1 := s;
    s := '';
  end;
  pv := nil;
  for i := 0 to Exec.CurrentProcVars.Count -1 do
  begin
    if Uppercase(Exec.CurrentProcVars[i]) =  s1 then
    begin
      pv := Exec.GetProcVar(i);
      break;
    end;
  end;
  if pv = nil then
  begin
    for i := 0 to Exec.CurrentProcParams.Count -1 do
    begin
      if Uppercase(Exec.CurrentProcParams[i]) =  s1 then
      begin
        pv := Exec.GetProcParam(i);
        break;
      end;
    end;
  end;
  if pv = nil then
  begin
    for i := 0 to Exec.GlobalVarNames.Count -1 do
    begin
      if Uppercase(Exec.GlobalVarNames[i]) =  s1 then
      begin
        pv := Exec.GetGlobalVar(i);
        break;
      end;
    end;
  end;
  if pv = nil then
    exit;
  result := True;
  varp := NewTPSVariantIFC(pv, False);
  try
    case varp.aType.BaseType of
      btChar, bts8, btU8: tbtu8(varp.Dta^) := tbtu8(strtoint(content));
      {$IFNDEF PS_NOWIDESTRING}btWideChar, {$ENDIF}bts16, btU16: tbtu16(varp.Dta^) := tbtu16(strtoint(content));
      btSingle: tbtSingle(varp.Dta^) := strtofloat(content);
      bts32, btU32,btClass: tbtu32(varp.Dta^) := tbtu32(strtoint(content));
      btPChar, btString: begin
        SetLength(tbtString(varp.Dta^),length(content));
        tbtString(varp.Dta^) := tbtString(content);
      end;
      btCurrency: tbtCurrency(varp.Dta^) := tbtCurrency(strtocurr(content));
      btDouble: tbtdouble(varp.Dta^) := strtofloat(content);
      {$IFNDEF PS_NOINT64}bts64: tbtS64(varp.Dta^) := strtoint64(content);{$ENDIF}
      btExtended: tbtExtended(varp.Dta^) := tbtExtended(strtofloat(content));
      btVariant: Variant(varp.Dta^) := content;
      else
        result := False;
    end;
  except
    result := False;
  end;
end;

procedure TPSScriptDebugger.StepInto;
begin
  if (FExec.Status = isRunning) or (FExec.Status = isLoaded) then
    FExec.StepInto
  else
    raise Exception.Create(RPS_NoScript);
end;

procedure TPSScriptDebugger.StepOver;
begin
  if (FExec.Status = isRunning) or (FExec.Status = isLoaded) then
    FExec.StepOver
  else
    raise Exception.Create(RPS_NoScript);
end;



{ TPSPluginItem }

procedure TPSPluginItem.Assign(Source: TPersistent); //Birb
begin
  if Source is TPSPluginItem then
   plugin:=((source as TPSPluginItem).plugin)
  else
   inherited;
end;

function TPSPluginItem.GetDisplayName: string;
begin
  if FPlugin <> nil then
    Result := string(FPlugin.Name)
  else
    Result := '<' + CS_nil + '>';
end;

procedure TPSPluginItem.SetPlugin(const Value: TPSPlugin);
begin
  FPlugin := Value;
  If Value <> nil then
    Value.FreeNotification(TPSPlugins(Collection).FCompExec);
  Changed(False);
end;

{ TPSPlugins }

constructor TPSPlugins.Create(CE: TPSScript);
begin
  inherited Create(TPSPluginItem);
  FCompExec := CE;
end;

function TPSPlugins.GetOwner: TPersistent;
begin
  Result := FCompExec;
end;

{ TPSBreakPointInfo }

procedure TPSBreakPointInfo.SetFileName(const Value: tbtstring);
begin
  FFileName := Value;
  FFileNameHash := MakeHash(Value);
end;

{ TPSCustomPlugin }
procedure TPSCustumPlugin.CompileImport1(CompExec: TPSScript);
begin
  IF @FOnCompileImport1 <> nil then
    FOnCompileImport1(CompExec)
  else
    inherited;
end;

procedure TPSCustumPlugin.CompileImport2(CompExec: TPSScript);
begin
  IF @FOnCompileImport2 <> nil then
    FOnCompileImport2(CompExec)
  else
    inherited;
end;

procedure TPSCustumPlugin.CompOnUses(CompExec: TPSScript);
begin
  IF @FOnCompOnUses <> nil then
    FOnCompOnUses(CompExec)
  else
    inherited;
end;

procedure TPSCustumPlugin.ExecImport1(CompExec: TPSScript;
  const ri: TPSRuntimeClassImporter);
begin
  IF @FOnExecImport1 <> nil then
    FOnExecImport1(CompExec, compExec.Exec, ri)
  else
    inherited;
end;

procedure TPSCustumPlugin.ExecImport2(CompExec: TPSScript;
  const ri: TPSRuntimeClassImporter);
begin
  IF @FOnExecImport2 <> nil then
    FOnExecImport1(CompExec, compExec.Exec, ri)
  else
    inherited;
end;

procedure TPSCustumPlugin.ExecOnUses(CompExec: TPSScript);
begin
  IF @FOnExecOnUses <> nil then
    FOnExecOnUses(CompExec)
  else
    inherited;
end;

end.
