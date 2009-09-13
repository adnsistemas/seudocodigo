{ Compiletime Classes support }
unit uPSC_classes;

{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;

{
  Will register files from:
    Classes (exception TPersistent and TComponent)
 
  Register STD first

}

procedure SIRegister_Classes_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTStrings(cl: TPSPascalCompiler; Streams: Boolean);
procedure SIRegisterTStringList(cl: TPSPascalCompiler);
procedure SIRegisterTList(cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
procedure SIRegisterTBITS(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTSTREAM(Cl: TPSPascalCompiler);
procedure SIRegisterTHANDLESTREAM(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
procedure SIRegisterTMEMORYSTREAM(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTFILESTREAM(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
procedure SIRegisterTCUSTOMMEMORYSTREAM(Cl: TPSPascalCompiler);
procedure SIRegisterTRESOURCESTREAM(Cl: TPSPascalCompiler);
procedure SIRegisterTPARSER(Cl: TPSPascalCompiler);
procedure SIRegisterTCOLLECTIONITEM(CL: TPSPascalCompiler);
procedure SIRegisterTCOLLECTION(CL: TPSPascalCompiler);
{$IFDEF DELPHI3UP}
procedure SIRegisterTOWNEDCOLLECTION(CL: TPSPascalCompiler);
{$ENDIF}
{$ENDIF}

procedure SIRegister_Classes(Cl: TPSPascalCompiler; Streams: Boolean{$IFDEF D4PLUS}=True{$ENDIF});

implementation

uses langdef;

procedure SIRegisterTStrings(cl: TPSPascalCompiler; Streams: Boolean); // requires TPersistent
begin
  with Cl.AddClassN(cl.FindClass(CS_TPersistent), CS_TSTRINGS) do
  begin
    IsAbstract := True;
    RegisterMethod(CS_function + ' ' + CS_Add + '(S: ' + CS_String + '): ' + CS_Integer);
    RegisterMethod(CS_procedure + ' ' + CS_Append + '(S: ' + CS_String + ')');
    RegisterMethod(CS_procedure + ' ' + CS_AddStrings + '(String: ' + CS_TStrings + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Clear);
    RegisterMethod(CS_procedure + ' ' + CS_Delete + '(Index: ' + CS_Integer + ')');
    RegisterMethod(CS_function + ' ' + CS_IndexOf + '(' + CS_const + ' S: ' + CS_String + '): ' + CS_Integer);
    RegisterMethod(CS_procedure + ' ' + CS_Insert + '(Index: ' + CS_Integer + '; S: '+ CS_String + ')');
    RegisterProperty(CS_Count, CS_Integer, iptR);
    RegisterProperty(CS_Text, CS_String, iptrw);
    RegisterProperty(CS_CommaText, CS_String, iptrw);
    if Streams then
    begin
      RegisterMethod(CS_procedure + ' ' + CS_LoadFromFile + '(FileName: ' + CS_String + ')');
      RegisterMethod(CS_procedure + ' ' + CS_SaveToFile + '(FileName: ' + CS_String + ')');
    end;
    RegisterProperty(CS_Strings, CS_String + ' ' + CS_Integer, iptRW);
    SetDefaultPropery(CS_Strings);
    RegisterProperty(CS_Objects, CS_TObject + ' ' + CS_Integer, iptRW);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_BeginUpdate);
    RegisterMethod(CS_procedure + ' ' + CS_EndUpdate);
    RegisterMethod(CS_function + ' ' + CS_Equals + '(Strings: ' + CS_TStrings + '): ' + CS_Boolean);
    RegisterMethod(CS_procedure + ' ' + CS_Exchange + '(Index1, Index2: ' + CS_Integer+ ')');
    RegisterMethod(CS_function + ' ' + CS_IndexOfName + '(Name: ' + CS_String + '): ' +CS_Integer);
    if Streams then
      RegisterMethod(CS_procedure + ' ' + CS_LoadFromStream + '(Stream: ' + CS_TStream + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Move + '(CurIndex, NewIndex: ' + CS_Integer + ')');
    if Streams then
      RegisterMethod(CS_procedure + ' ' + CS_SaveToStream + '(Stream: ' + CS_TStream + ')');
    RegisterMethod(CS_procedure + ' ' + CS_SetText + '(Text: ' + CS_PChar + ')');
    RegisterProperty(CS_Names, CS_String  + ' ' + CS_Integer, iptr);
    RegisterProperty(CS_Values, CS_String + ' ' + CS_String, iptRW);
    RegisterMethod(CS_function + ' ' + CS_ADDOBJECT + '(S:' + CS_String + ';AOBJECT:' + CS_TOBJECT + '):' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_GETTEXT + ' :' +CS_PCHAR);
    RegisterMethod(CS_function + ' ' + CS_INDEXOFOBJECT + '(AOBJECT:' + CS_TOBJECT + '):' + CS_INTEGER);
    RegisterMethod(CS_procedure + ' ' + CS_INSERTOBJECT + '(INDEX:' + CS_INTEGER + ';S:' + CS_String + ';AOBJECT:' + CS_TOBJECT + ')');
    {$ENDIF}
  end;
end;

{--frm-utn Lista}
procedure SIRegisterTList(cl: TPSPascalCompiler); // requires TObject
begin
  with Cl.AddClassN(cl.FindClass(CS_TObject), CS_TList) do
  begin
    RegisterMethod(CS_function + ' ' + CS_Add + '(P: ___Pointer): ' + CS_Integer);
    RegisterMethod(CS_procedure + ' ' + CS_Clear);
    RegisterMethod(CS_procedure + ' ' + CS_Delete + '(Index: ' + CS_Integer + ')');
    RegisterMethod(CS_function + ' ' + CS_IndexOf + '(' + CS_const + ' P: ___Pointer): ' + CS_Integer);
    RegisterMethod(CS_procedure + ' ' + CS_Insert + '(Index: ' + CS_Integer + '; P: ___Pointer )');
    RegisterProperty(CS_Count, CS_Integer, iptR);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_Move + '(CurIndex, NewIndex: ' + CS_Integer + ')');
    {$ENDIF}
  end;
end;

procedure SIRegisterTSTRINGLIST(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TSTRINGS), CS_TSTRINGLIST) do
  begin
    RegisterMethod(CS_function + ' ' + CS_FIND + '(S:' + CS_STRING + '; ' + CS_var + ' INDEX:' + CS_INTEGER + '):' + CS_BOOLEAN);
    RegisterMethod(CS_procedure + ' ' + CS_SORT);
    RegisterProperty(CS_DUPLICATES, CS_TDUPLICATES, iptrw);
    RegisterProperty(CS_SORTED, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_ONCHANGE, CS_TNOTIFYEVENT, iptrw);
    RegisterProperty(CS_ONCHANGING, CS_TNOTIFYEVENT, iptrw);
  end;
end;

{$IFNDEF PS_MINIVCL}
procedure SIRegisterTBITS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TObject), CS_TBITS) do
  begin
    RegisterMethod(CS_function + ' ' + CS_OPENBIT + ':' + CS_INTEGER);
    RegisterProperty(CS_BITS, CS_BOOLEAN + ' ' + CS_INTEGER, iptrw);
    RegisterProperty(CS_SIZE, CS_INTEGER, iptrw);
  end;
end;
{$ENDIF}

procedure SIRegisterTSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TOBJECT), CS_TSTREAM) do
  begin
    IsAbstract := True;
    RegisterMethod(CS_function + ' ' + CS_READ + '(BUFFER:' + CS_STRING + ';COUNT: ' +CS_LONGINT + '):' + CS_LONGINT);
    RegisterMethod(CS_function + ' ' + CS_WRITE + '(BUFFER:' + CS_STRING + ';COUNT:' + CS_LONGINT + '):' + CS_LONGINT);
    RegisterMethod(CS_function + ' ' + CS_SEEK + '(OFFSET:' + CS_LONGINT + ';ORIGIN:' + CS_WORD + '):' + CS_LONGINT);
    RegisterMethod(CS_procedure + ' ' + CS_READBUFFER + '(BUFFER:' + CS_STRING + ' ;COUNT:' + CS_LONGINT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_WRITEBUFFER + '(BUFFER:' + CS_STRING + ';COUNT:' + CS_LONGINT + ')');
    {$IFDEF DELPHI4UP}
    RegisterMethod(CS_function + ' ' + CS_COPYFROM + '(SOURCE:' + CS_TSTREAM + ';COUNT:' + CS_INT64 + '):' + CS_LONGINT);
    {$ELSE}
    RegisterMethod(CS_function + ' ' + CS_COPYFROM + '(SOURCE:' + CS_TSTREAM + ';COUNT:' + CS_Integer + '):' + CS_LONGINT);
    {$ENDIF}
    RegisterProperty(CS_POSITION, CS_LONGINT, iptrw);
    RegisterProperty(CS_SIZE, CS_LONGINT, iptrw);
  end;
end;

procedure SIRegisterTHANDLESTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TSTREAM), CS_THANDLESTREAM) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE + '(AHANDLE:' + CS_INTEGER + ')');
    RegisterProperty(CS_HANDLE, CS_INTEGER, iptr);
  end;
end;

{$IFNDEF PS_MINIVCL}
procedure SIRegisterTMEMORYSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMMEMORYSTREAM), CS_TMEMORYSTREAM) do
  begin
    RegisterMethod(CS_procedure + ' ' + CS_CLEAR);
    RegisterMethod(CS_procedure + ' ' + CS_LOADFROMSTREAM + '(STREAM:' + CS_TSTREAM + ')');
    RegisterMethod(CS_procedure + ' ' + CS_LOADFROMFILE + '(FILENAME:' + CS_String + ')');
    RegisterMethod(CS_procedure + ' ' + CS_SETSIZE + '(NEWSIZE:' + CS_LONGINT + ')');
  end;
end;
{$ENDIF}

procedure SIRegisterTFILESTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_THANDLESTREAM), CS_TFILESTREAM) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE + '(FILENAME:' + CS_String + ';MODE:' + CS_WORD + ')');
  end;
end;

{$IFNDEF PS_MINIVCL}
procedure SIRegisterTCUSTOMMEMORYSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TSTREAM), CS_TCUSTOMMEMORYSTREAM) do
  begin
    IsAbstract := True;
    RegisterMethod(CS_procedure + ' ' + CS_SAVETOSTREAM + '(STREAM:' + CS_TSTREAM + ')');
    RegisterMethod(CS_procedure + ' ' + CS_SAVETOFILE + '(FILENAME:' + CS_String + ')');
  end;
end;

procedure SIRegisterTRESOURCESTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMMEMORYSTREAM), CS_TRESOURCESTREAM) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE + '(INSTANCE:' + CS_THANDLE + ';RESNAME:' + CS_String + ' ;RESTYPE:' + CS_String + ')');
    RegisterMethod(CS_constructor + ' ' + CS_CREATEFROMID + '(INSTANCE:' + CS_THANDLE + ';RESID:' + CS_INTEGER + ';RESTYPE:' + CS_String + ')');
  end;
end;

procedure SIRegisterTPARSER(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TOBJECT), CS_TPARSER) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE + '(STREAM:' + CS_TSTREAM + ')');
    RegisterMethod(CS_procedure + ' ' + CS_CHECKTOKEN + '(T:' + CS_CHAR + ')');
    RegisterMethod(CS_procedure + ' ' + CS_CHECKTOKENSYMBOL + '(S:' + CS_String +')');
    RegisterMethod(CS_procedure + ' ' + CS_ERROR + '(IDENT:' + CS_INTEGER + ')');
    RegisterMethod(CS_procedure + ' ' + CS_ERRORSTR + '(MESSAGE:' + CS_String +')');
    RegisterMethod(CS_procedure + ' ' + CS_HEXTOBINARY+ '(STREAM:' + CS_TSTREAM + ')');
    RegisterMethod(CS_function + ' ' + CS_NEXTTOKEN + ':' + CS_CHAR);
    RegisterMethod(CS_function + ' ' + CS_SOURCEPOS + ':' + CS_LONGINT);
    RegisterMethod(CS_function + ' ' + CS_TOKENCOMPONENTIDENT + ':' + CS_String);
    RegisterMethod(CS_function + ' ' + CS_TOKENFLOAT + ':' + CS_EXTENDED);
    RegisterMethod(CS_function + ' ' + CS_TOKENINT + ':' + CS_LONGINT);
    RegisterMethod(CS_function + ' ' + CS_TOKENSTRING + ':' + CS_String);
    RegisterMethod(CS_function + ' ' + CS_TOKENSYMBOLIS + '(S:' + CS_String + '):' + CS_BOOLEAN);
    RegisterProperty(CS_SOURCELINE, CS_INTEGER, iptr);
    RegisterProperty(CS_TOKEN, CS_CHAR, iptr);
  end;
end;

procedure SIRegisterTCOLLECTIONITEM(CL: TPSPascalCompiler);
Begin
  if cl.FindClass(CS_TCOLLECTION) = nil then cl.AddClassN(cl.FindClass(CS_TPERSISTENT), CS_TCOLLECTION);
  With cl.AddClassN(cl.FindClass(CS_TPERSISTENT),CS_TCOLLECTIONITEM) do
  begin
  RegisterMethod(CS_Constructor + ' ' + CS_CREATE + '( COLLECTION : ' + CS_TCOLLECTION + ')');
  RegisterProperty(CS_COLLECTION, CS_TCOLLECTION, iptrw);
{$IFDEF DELPHI3UP}  RegisterProperty(CS_ID, CS_INTEGER, iptr); {$ENDIF}
  RegisterProperty(CS_INDEX, CS_INTEGER, iptrw);
{$IFDEF DELPHI3UP}  RegisterProperty(CS_DISPLAYNAME, CS_String, iptrw); {$ENDIF}
  end;
end;

procedure SIRegisterTCOLLECTION(CL: TPSPascalCompiler);
var
  cr: TPSCompileTimeClass;
Begin
  cr := CL.FindClass(CS_TCOLLECTION);
  if cr = nil then cr := cl.AddClassN(cl.FindClass(CS_TPERSISTENT), CS_TCOLLECTION);
With cr do
  begin
//  RegisterMethod('Constructor CREATE( ITEMCLASS : TCOLLECTIONITEMCLASS)');
{$IFDEF DELPHI3UP}  RegisterMethod(CS_function + ' ' + CS_OWNER + ': ' + CS_TPERSISTENT); {$ENDIF}
  RegisterMethod(CS_function + ' ' + CS_ADD +' : ' + CS_TCOLLECTIONITEM);
  RegisterMethod(CS_procedure + ' ' + CS_BEGINUPDATE);
  RegisterMethod(CS_procedure + ' ' + CS_CLEAR);
{$IFDEF DELPHI5UP}  RegisterMethod(CS_procedure + ' ' + CS_DELETE + '( INDEX : ' + CS_INTEGER + ')'); {$ENDIF}
  RegisterMethod(CS_procedure + ' ' + CS_ENDUPDATE);
{$IFDEF DELPHI3UP}  RegisterMethod(CS_function + ' ' + CS_FINDITEMID + '( ID : ' + CS_INTEGER + ') : ' + CS_TCOLLECTIONITEM); {$ENDIF}
{$IFDEF DELPHI3UP}  RegisterMethod(CS_function + ' ' + CS_INSERT + '( INDEX : ' + CS_INTEGER + ') : ' + CS_TCOLLECTIONITEM); {$ENDIF}
  RegisterProperty(CS_COUNT, CS_INTEGER, iptr);
{$IFDEF DELPHI3UP}  RegisterProperty(CS_ITEMCLASS, CS_TCOLLECTIONITEMCLASS, iptr); {$ENDIF}
  RegisterProperty(CS_ITEMS, CS_TCOLLECTIONITEM + ' ' + CS_INTEGER, iptrw);
  end;
end;

{$IFDEF DELPHI3UP}
procedure SIRegisterTOWNEDCOLLECTION(CL: TPSPascalCompiler);
Begin
With Cl.AddClassN(cl.FindClass(CS_TCOLLECTION),CS_TOWNEDCOLLECTION) do
  begin
//  RegisterMethod('Constructor CREATE( AOWNER : TPERSISTENT; ITEMCLASS : TCOLLECTIONITEMCLASS)');
  end;
end;
{$ENDIF}
{$ENDIF}

procedure SIRegister_Classes_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  cl.AddConstantN(CS_soFromBeginning, CS_Longint).Value.ts32 := 0;
  cl.AddConstantN(CS_soFromCurrent, CS_Longint).Value.ts32 := 1;
  cl.AddConstantN(CS_soFromEnd, CS_Longint).Value.ts32 := 2;
  cl.AddConstantN(CS_toEOF, CS_Char).Value.tchar := #0;
  cl.AddConstantN(CS_toSymbol, CS_Char).Value.tchar := #1;
  cl.AddConstantN(CS_toString, CS_Char).Value.tchar := #2;
  cl.AddConstantN(CS_toInteger, CS_Char).Value.tchar := #3;
  cl.AddConstantN(CS_toFloat, CS_Char).Value.tchar := #4;
  cl.AddConstantN(CS_fmCreate, CS_Longint).Value.ts32 := $FFFF;
  cl.AddConstantN(CS_fmOpenRead, CS_Longint).Value.ts32 := 0;
  cl.AddConstantN(CS_fmOpenWrite, CS_Longint).Value.ts32 := 1;
  cl.AddConstantN(CS_fmOpenReadWrite, CS_Longint).Value.ts32 := 2;
  cl.AddConstantN(CS_fmShareCompat, CS_Longint).Value.ts32 := 0;
  cl.AddConstantN(CS_fmShareExclusive, CS_Longint).Value.ts32 := $10;
  cl.AddConstantN(CS_fmShareDenyWrite, CS_Longint).Value.ts32 := $20;
  cl.AddConstantN(CS_fmShareDenyRead, CS_Longint).Value.ts32 := $30;
  cl.AddConstantN(CS_fmShareDenyNone, CS_Longint).Value.ts32 := $40;
  cl.AddConstantN(CS_SecsPerDay, CS_Longint).Value.ts32 := 86400;
  cl.AddConstantN(CS_MSecPerDay, CS_Longint).Value.ts32 := 86400000;
  cl.AddConstantN(CS_DateDelta, CS_Longint).Value.ts32 := 693594;
  cl.AddTypeS(CS_TAlignment, '(' + CS_taLeftJustify + ', ' + CS_taRightJustify + ', ' + CS_taCenter + ')');
  cl.AddTypeS(CS_THelpEvent, CS_function + '(Command: ' + CS_Word + '; Data: ' + CS_Longint + '; ' + CS_var + ' CallHelp: ' + CS_Boolean + '): ' + CS_Boolean);
  cl.AddTypeS(CS_TGetStrProc, CS_procedure + '(' + CS_const + ' S: ' + CS_String + ')');
  cl.AddTypeS(CS_TDuplicates, '(' + CS_dupIgnore + ', ' + CS_dupAccept + ', ' + CS_dupError + ')');
  cl.AddTypeS(CS_TOperation, '(' + CS_opInsert + ', ' + CS_opRemove + ')');
  cl.AddTypeS(CS_THANDLE, CS_Longint);

  cl.AddTypeS(CS_TNotifyEvent, CS_procedure + '(Sender: ' + CS_TObject + ')');
end;

procedure SIRegister_Classes(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  SIRegister_Classes_TypesAndConsts(Cl);
  SIRegisterTList(Cl);
  if Streams then
    SIRegisterTSTREAM(Cl);
  SIRegisterTStrings(cl, Streams);
  SIRegisterTStringList(cl);
  {$IFNDEF PS_MINIVCL}
  SIRegisterTBITS(cl);
  {$ENDIF}
  if Streams then
  begin
    SIRegisterTHANDLESTREAM(Cl);
    SIRegisterTFILESTREAM(Cl);
    {$IFNDEF PS_MINIVCL}
    SIRegisterTCUSTOMMEMORYSTREAM(Cl);
    SIRegisterTMEMORYSTREAM(Cl);
    SIRegisterTRESOURCESTREAM(Cl);
    {$ENDIF}
  end;
  {$IFNDEF PS_MINIVCL}
  SIRegisterTPARSER(Cl);
  SIRegisterTCOLLECTIONITEM(Cl);
  SIRegisterTCOLLECTION(Cl);
  {$IFDEF DELPHI3UP}
  SIRegisterTOWNEDCOLLECTION(Cl);
  {$ENDIF}
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.
