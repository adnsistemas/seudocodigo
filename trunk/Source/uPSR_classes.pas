
unit uPSR_classes;

{$I PascalScript.inc}
interface
uses
  langdef,uPSRuntime, uPSUtils;


procedure RIRegisterTList(cl: TPSRuntimeClassImporter);
procedure RIRegisterTStrings(cl: TPSRuntimeClassImporter; Streams: Boolean);
procedure RIRegisterTStringList(cl: TPSRuntimeClassImporter);
{$IFNDEF PS_MINIVCL}
procedure RIRegisterTBITS(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTSTREAM(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTHANDLESTREAM(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTFILESTREAM(Cl: TPSRuntimeClassImporter);
{$IFNDEF PS_MINIVCL}
procedure RIRegisterTCUSTOMMEMORYSTREAM(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTMEMORYSTREAM(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTRESOURCESTREAM(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPARSER(Cl: TPSRuntimeClassImporter);
{$IFDEF DELPHI3UP}
procedure RIRegisterTOWNEDCOLLECTION(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTCOLLECTION(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCOLLECTIONITEM(Cl: TPSRuntimeClassImporter);
{$ENDIF}

procedure RIRegister_Classes(Cl: TPSRuntimeClassImporter; Streams: Boolean{$IFDEF D4PLUS}=True{$ENDIF});

implementation
uses
  Classes;

procedure TListCountR(Self: TList; var T: Longint); begin T := Self.Count; end;

procedure TStringsCountR(Self: TStrings; var T: Longint); begin T := Self.Count; end;

procedure TStringsTextR(Self: TStrings; var T: string); begin T := Self.Text; end;
procedure TStringsTextW(Self: TStrings; T: string); begin Self.Text:= T; end;

procedure TStringsCommaTextR(Self: TStrings; var T: string); begin T := Self.CommaText; end;
procedure TStringsCommaTextW(Self: TStrings; T: string); begin Self.CommaText:= T; end;

procedure TStringsObjectsR(Self: TStrings; var T: TObject; I: Longint);
begin
T := Self.Objects[I];
end;
procedure TStringsObjectsW(Self: TStrings; const T: TObject; I: Longint);
begin
  Self.Objects[I]:= T;
end;

procedure TStringsStringsR(Self: TStrings; var T: string; I: Longint);
begin
T := Self.Strings[I];
end;
procedure TStringsStringsW(Self: TStrings; const T: string; I: Longint);
begin
  Self.Strings[I]:= T;
end;

procedure TStringsNamesR(Self: TStrings; var T: string; I: Longint);
begin
T := Self.Names[I];
end;
procedure TStringsValuesR(Self: TStrings; var T: string; const I: string);
begin
T := Self.Values[I];
end;
procedure TStringsValuesW(Self: TStrings; Const T, I: String);
begin
  Self.Values[I]:= T;
end;

procedure RIRegisterTStrings(cl: TPSRuntimeClassImporter; Streams: Boolean); // requires TPersistent
begin
  with Cl.Add(TStrings) do
  begin
    RegisterVirtualMethod(@TStrings.Add, CS_ADD);
    RegisterMethod(@TStrings.Append, CS_APPEND);
    RegisterVirtualMethod(@TStrings.AddStrings, CS_ADDSTRINGS);
    RegisterVirtualAbstractMethod(TStringList, @TStringList.Clear, CS_CLEAR);
    RegisterVirtualAbstractMethod(TStringList, @TStringList.Delete, CS_DELETE);
    RegisterVirtualMethod(@TStrings.IndexOf, CS_INDEXOF);
    RegisterVirtualAbstractMethod(TStringList, @TStringList.Insert, CS_INSERT);
    RegisterPropertyHelper(@TStringsCountR, nil, CS_COUNT);
    RegisterPropertyHelper(@TStringsTextR, @TStringsTextW, CS_TEXT);
    RegisterPropertyHelper(@TStringsCommaTextR, @TStringsCommatextW, CS_COMMATEXT);
    if Streams then
    begin
      RegisterVirtualMethod(@TStrings.LoadFromFile, CS_LOADFROMFILE);
      RegisterVirtualMethod(@TStrings.SaveToFile, CS_SAVETOFILE);
    end;
    RegisterPropertyHelper(@TStringsStringsR, @TStringsStringsW, CS_STRINGS);
    RegisterPropertyHelper(@TStringsObjectsR, @TStringsObjectsW, CS_OBJECTS);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TStrings.BeginUpdate, CS_BEGINUPDATE);
    RegisterMethod(@TStrings.EndUpdate, CS_ENDUPDATE);
    RegisterMethod(@TStrings.Equals,  CS_EQUALS);
    RegisterVirtualMethod(@TStrings.Exchange, CS_EXCHANGE);
    RegisterMethod(@TStrings.IndexOfName, CS_INDEXOFNAME);
    if Streams then
      RegisterVirtualMethod(@TStrings.LoadFromStream, CS_LOADFROMSTREAM);
    RegisterVirtualMethod(@TStrings.Move, CS_MOVE);
    if Streams then
      RegisterVirtualMethod(@TStrings.SaveToStream, CS_SAVETOSTREAM);
    RegisterVirtualMethod(@TStrings.SetText, CS_SETTEXT);
    RegisterPropertyHelper(@TStringsNamesR, nil, CS_NAMES);
    RegisterPropertyHelper(@TStringsValuesR, @TStringsValuesW, CS_VALUES);
    RegisterVirtualMethod(@TSTRINGS.ADDOBJECT, CS_ADDOBJECT);
    RegisterVirtualMethod(@TSTRINGS.GETTEXT, CS_GETTEXT);
    RegisterMethod(@TSTRINGS.INDEXOFOBJECT, CS_INDEXOFOBJECT);
    RegisterMethod(@TSTRINGS.INSERTOBJECT, CS_INSERTOBJECT);
    {$ENDIF}
  end;
end;

procedure RIRegisterTList(cl: TPSRuntimeClassImporter); // requires TPersistent
begin
  with Cl.Add(TList) do
  begin
    RegisterMethod(@TList.Add, CS_ADD);
    RegisterMethod(@TList.Clear, CS_CLEAR);
    RegisterMethod(@TList.Delete, CS_DELETE);
    RegisterMethod(@TList.IndexOf, CS_INDEXOF);
    RegisterMethod(@TList.Insert, CS_INSERT);
    RegisterPropertyHelper(@TListCountR, nil, CS_COUNT);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TList.Move, CS_MOVE);
    {$ENDIF}
  end;
end;

procedure TSTRINGLISTDUPLICATES_R(Self: TSTRINGLIST; var T: TDUPLICATES); begin T := Self.DUPLICATES; end;
procedure TSTRINGLISTDUPLICATES_W(Self: TSTRINGLIST; const T: TDUPLICATES); begin Self.DUPLICATES := T; end;
procedure TSTRINGLISTSORTED_R(Self: TSTRINGLIST; var T: BOOLEAN); begin T := Self.SORTED; end;
procedure TSTRINGLISTSORTED_W(Self: TSTRINGLIST; const T: BOOLEAN); begin Self.SORTED := T; end;
procedure TSTRINGLISTONCHANGE_R(Self: TSTRINGLIST; var T: TNOTIFYEVENT);
begin
T := Self.ONCHANGE; end;
procedure TSTRINGLISTONCHANGE_W(Self: TSTRINGLIST; const T: TNOTIFYEVENT);
begin
Self.ONCHANGE := T; end;
procedure TSTRINGLISTONCHANGING_R(Self: TSTRINGLIST; var T: TNOTIFYEVENT); begin T := Self.ONCHANGING; end;
procedure TSTRINGLISTONCHANGING_W(Self: TSTRINGLIST; const T: TNOTIFYEVENT); begin Self.ONCHANGING := T; end;
procedure RIRegisterTSTRINGLIST(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSTRINGLIST) do
  begin
    RegisterVirtualMethod(@TSTRINGLIST.FIND, CS_FIND);
    RegisterVirtualMethod(@TSTRINGLIST.SORT, CS_SORT);
    RegisterPropertyHelper(@TSTRINGLISTDUPLICATES_R, @TSTRINGLISTDUPLICATES_W, CS_DUPLICATES);
    RegisterPropertyHelper(@TSTRINGLISTSORTED_R, @TSTRINGLISTSORTED_W, CS_SORTED);
    RegisterEventPropertyHelper(@TSTRINGLISTONCHANGE_R, @TSTRINGLISTONCHANGE_W, CS_ONCHANGE);
    RegisterEventPropertyHelper(@TSTRINGLISTONCHANGING_R, @TSTRINGLISTONCHANGING_W, CS_ONCHANGING);
  end;
end;

{$IFNDEF PS_MINIVCL}
procedure TBITSBITS_W(Self: TBITS; T: BOOLEAN; t1: INTEGER); begin Self.BITS[t1] := T; end;
procedure TBITSBITS_R(Self: TBITS; var T: BOOLEAN; t1: INTEGER); begin T := Self.Bits[t1]; end;
procedure TBITSSIZE_R(Self: TBITS; T: INTEGER); begin Self.SIZE := T; end;
procedure TBITSSIZE_W(Self: TBITS; var T: INTEGER); begin T := Self.SIZE; end;

procedure RIRegisterTBITS(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBITS) do
  begin
    RegisterMethod(@TBITS.OPENBIT, CS_OPENBIT);
    RegisterPropertyHelper(@TBITSBITS_R, @TBITSBITS_W, CS_BITS);
    RegisterPropertyHelper(@TBITSSIZE_R, @TBITSSIZE_W, CS_SIZE);
  end;
end;
{$ENDIF}

procedure TSTREAMPOSITION_R(Self: TSTREAM; var T: LONGINT); begin t := Self.POSITION; end;
procedure TSTREAMPOSITION_W(Self: TSTREAM; T: LONGINT); begin Self.POSITION := t; end;
procedure TSTREAMSIZE_R(Self: TSTREAM; var T: LONGINT); begin t := Self.SIZE; end;
{$IFDEF DELPHI3UP}
procedure TSTREAMSIZE_W(Self: TSTREAM; T: LONGINT); begin Self.SIZE := t; end;
{$ENDIF}

procedure RIRegisterTSTREAM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSTREAM) do
  begin
    RegisterVirtualAbstractMethod(TMemoryStream, @TMemoryStream.READ, CS_READ);
    RegisterVirtualAbstractMethod(TMemoryStream, @TMemoryStream.WRITE, CS_WRITE);
    RegisterVirtualAbstractMethod(TMemoryStream, @TMemoryStream.SEEK, CS_SEEK);
    RegisterMethod(@TSTREAM.READBUFFER, CS_READBUFFER);
    RegisterMethod(@TSTREAM.WRITEBUFFER, CS_WRITEBUFFER);
    RegisterMethod(@TSTREAM.COPYFROM, CS_COPYFROM);
    RegisterPropertyHelper(@TSTREAMPOSITION_R, @TSTREAMPOSITION_W, CS_POSITION);
    RegisterPropertyHelper(@TSTREAMSIZE_R, {$IFDEF DELPHI3UP}@TSTREAMSIZE_W, {$ELSE}nil, {$ENDIF}CS_SIZE);
  end;
end;

procedure THANDLESTREAMHANDLE_R(Self: THANDLESTREAM; var T: INTEGER); begin T := Self.HANDLE; end;

procedure RIRegisterTHANDLESTREAM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(THANDLESTREAM) do
  begin
    RegisterConstructor(@THANDLESTREAM.CREATE, CS_CREATE);
    RegisterPropertyHelper(@THANDLESTREAMHANDLE_R, nil, CS_HANDLE);
  end;
end;

{$IFDEF FPC}
// mh: because FPC doesn't handle pointers to overloaded functions
function TFileStreamCreate(filename: string; mode: word): TFileStream;
begin
  result := TFilestream.Create(filename, mode);
end;
{$ENDIF}

procedure RIRegisterTFILESTREAM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TFILESTREAM) do
  begin
    {$IFDEF FPC}
    RegisterConstructor(@TFileStreamCreate, CS_CREATE);
    {$ELSE}
    RegisterConstructor(@TFILESTREAM.CREATE, CS_CREATE);
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
procedure RIRegisterTCUSTOMMEMORYSTREAM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMMEMORYSTREAM) do
  begin
    RegisterMethod(@TCUSTOMMEMORYSTREAM.SAVETOSTREAM, CS_SAVETOSTREAM);
    RegisterMethod(@TCUSTOMMEMORYSTREAM.SAVETOFILE, CS_SAVETOFILE);
  end;
end;

procedure RIRegisterTMEMORYSTREAM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TMEMORYSTREAM) do
  begin
    RegisterMethod(@TMEMORYSTREAM.CLEAR, CS_CLEAR);
    RegisterMethod(@TMEMORYSTREAM.LOADFROMSTREAM, CS_LOADFROMSTREAM);
    RegisterMethod(@TMEMORYSTREAM.LOADFROMFILE, CS_LOADFROMFILE);
    RegisterMethod(@TMEMORYSTREAM.SETSIZE, CS_SETSIZE);
  end;
end;

procedure RIRegisterTRESOURCESTREAM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TRESOURCESTREAM) do
  begin
    RegisterConstructor(@TRESOURCESTREAM.CREATE, CS_CREATE);
    RegisterConstructor(@TRESOURCESTREAM.CREATEFROMID, CS_CREATEFROMID);
  end;
end;

procedure TPARSERSOURCELINE_R(Self: TPARSER; var T: INTEGER); begin T := Self.SOURCELINE; end;
procedure TPARSERTOKEN_R(Self: TPARSER; var T: CHAR); begin T := Self.TOKEN; end;

procedure RIRegisterTPARSER(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPARSER) do
  begin
    RegisterConstructor(@TPARSER.CREATE, CS_CREATE);
    RegisterMethod(@TPARSER.CHECKTOKEN, CS_CHECKTOKEN);
    RegisterMethod(@TPARSER.CHECKTOKENSYMBOL, CS_CHECKTOKENSYMBOL);
    RegisterMethod(@TPARSER.ERROR, CS_ERROR);
    RegisterMethod(@TPARSER.ERRORSTR, CS_ERRORSTR);
    RegisterMethod(@TPARSER.HEXTOBINARY, CS_HEXTOBINARY);
    RegisterMethod(@TPARSER.NEXTTOKEN, CS_NEXTTOKEN);
    RegisterMethod(@TPARSER.SOURCEPOS, CS_SOURCEPOS);
    RegisterMethod(@TPARSER.TOKENCOMPONENTIDENT, CS_TOKENCOMPONENTIDENT);
    RegisterMethod(@TPARSER.TOKENFLOAT, CS_TOKENFLOAT);
    RegisterMethod(@TPARSER.TOKENINT, CS_TOKENINT);
    RegisterMethod(@TPARSER.TOKENSTRING, CS_TOKENSTRING);
    RegisterMethod(@TPARSER.TOKENSYMBOLIS, CS_TOKENSYMBOLIS);
    RegisterPropertyHelper(@TPARSERSOURCELINE_R, nil, CS_SOURCELINE);
    RegisterPropertyHelper(@TPARSERTOKEN_R, nil, CS_TOKEN);
  end;
end;

procedure TCOLLECTIONITEMS_W(Self: TCOLLECTION; const T: TCOLLECTIONITEM; const t1: INTEGER);
begin Self.ITEMS[t1] := T; end;

procedure TCOLLECTIONITEMS_R(Self: TCOLLECTION; var T: TCOLLECTIONITEM; const t1: INTEGER);
begin T := Self.ITEMS[t1]; end;

{$IFDEF DELPHI3UP}
procedure TCOLLECTIONITEMCLASS_R(Self: TCOLLECTION; var T: TCOLLECTIONITEMCLASS);
begin T := Self.ITEMCLASS; end;
{$ENDIF}

procedure TCOLLECTIONCOUNT_R(Self: TCOLLECTION; var T: INTEGER);
begin T := Self.COUNT; end;

{$IFDEF DELPHI3UP}
procedure TCOLLECTIONITEMDISPLAYNAME_W(Self: TCOLLECTIONITEM; const T: STRING);
begin Self.DISPLAYNAME := T; end;
{$ENDIF}

{$IFDEF DELPHI3UP}
procedure TCOLLECTIONITEMDISPLAYNAME_R(Self: TCOLLECTIONITEM; var T: STRING);
begin T := Self.DISPLAYNAME; end;
{$ENDIF}

procedure TCOLLECTIONITEMINDEX_W(Self: TCOLLECTIONITEM; const T: INTEGER);
begin Self.INDEX := T; end;

procedure TCOLLECTIONITEMINDEX_R(Self: TCOLLECTIONITEM; var T: INTEGER);
begin T := Self.INDEX; end;

{$IFDEF DELPHI3UP}
procedure TCOLLECTIONITEMID_R(Self: TCOLLECTIONITEM; var T: INTEGER);
begin T := Self.ID; end;
{$ENDIF}

procedure TCOLLECTIONITEMCOLLECTION_W(Self: TCOLLECTIONITEM; const T: TCOLLECTION);
begin Self.COLLECTION := T; end;

procedure TCOLLECTIONITEMCOLLECTION_R(Self: TCOLLECTIONITEM; var T: TCOLLECTION);
begin T := Self.COLLECTION; end;

{$IFDEF DELPHI3UP}
procedure RIRegisterTOWNEDCOLLECTION(Cl: TPSRuntimeClassImporter);
Begin
with Cl.Add(TOWNEDCOLLECTION) do
  begin
  RegisterConstructor(@TOWNEDCOLLECTION.CREATE, CS_CREATE);
  end;
end;
{$ENDIF}

procedure RIRegisterTCOLLECTION(Cl: TPSRuntimeClassImporter);
Begin
with Cl.Add(TCOLLECTION) do
  begin
  RegisterConstructor(@TCOLLECTION.CREATE, CS_CREATE);
{$IFDEF DELPHI6UP}  {$IFNDEF FPC} RegisterMethod(@TCOLLECTION.OWNER, CS_OWNER); {$ENDIF} {$ENDIF} // no owner in FPC
  RegisterMethod(@TCOLLECTION.ADD, CS_ADD);
  RegisterVirtualMethod(@TCOLLECTION.BEGINUPDATE, CS_BEGINUPDATE);
  RegisterMethod(@TCOLLECTION.CLEAR, CS_CLEAR);
{$IFDEF DELPHI5UP}  RegisterMethod(@TCOLLECTION.DELETE, CS_DELETE); {$ENDIF}
  RegisterVirtualMethod(@TCOLLECTION.ENDUPDATE, CS_ENDUPDATE);
{$IFDEF DELPHI3UP}  RegisterMethod(@TCOLLECTION.FINDITEMID, CS_FINDITEMID); {$ENDIF}
{$IFDEF DELPHI3UP}  RegisterMethod(@TCOLLECTION.INSERT, CS_INSERT); {$ENDIF}
  RegisterPropertyHelper(@TCOLLECTIONCOUNT_R,nil,CS_COUNT);
{$IFDEF DELPHI3UP}  RegisterPropertyHelper(@TCOLLECTIONITEMCLASS_R,nil,CS_ITEMCLASS); {$ENDIF}
  RegisterPropertyHelper(@TCOLLECTIONITEMS_R,@TCOLLECTIONITEMS_W,CS_ITEMS);
  end;
end;

procedure RIRegisterTCOLLECTIONITEM(Cl: TPSRuntimeClassImporter);
Begin
with Cl.Add(TCOLLECTIONITEM) do
  begin
  RegisterVirtualConstructor(@TCOLLECTIONITEM.CREATE, CS_CREATE);
  RegisterPropertyHelper(@TCOLLECTIONITEMCOLLECTION_R,@TCOLLECTIONITEMCOLLECTION_W,CS_COLLECTION);
{$IFDEF DELPHI3UP}  RegisterPropertyHelper(@TCOLLECTIONITEMID_R,nil,CS_ID); {$ENDIF}
  RegisterPropertyHelper(@TCOLLECTIONITEMINDEX_R,@TCOLLECTIONITEMINDEX_W,CS_INDEX);
{$IFDEF DELPHI3UP}  RegisterPropertyHelper(@TCOLLECTIONITEMDISPLAYNAME_R,@TCOLLECTIONITEMDISPLAYNAME_W,CS_DISPLAYNAME); {$ENDIF}
  end;
end;
{$ENDIF}

procedure RIRegister_Classes(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  if Streams then
    RIRegisterTSTREAM(Cl);
  RIRegisterTList(cl);
  RIRegisterTStrings(cl, Streams);
  RIRegisterTStringList(cl);
  {$IFNDEF PS_MINIVCL}
  RIRegisterTBITS(cl);
  {$ENDIF}
  if Streams then
  begin
    RIRegisterTHANDLESTREAM(Cl);
    RIRegisterTFILESTREAM(Cl);
    {$IFNDEF PS_MINIVCL}
    RIRegisterTCUSTOMMEMORYSTREAM(Cl);
    RIRegisterTMEMORYSTREAM(Cl);
    RIRegisterTRESOURCESTREAM(Cl);
    {$ENDIF}
  end;
  {$IFNDEF PS_MINIVCL}
  RIRegisterTPARSER(Cl);
  RIRegisterTCOLLECTIONITEM(Cl);
  RIRegisterTCOLLECTION(Cl);
  {$IFDEF DELPHI3UP}
  RIRegisterTOWNEDCOLLECTION(Cl);
  {$ENDIF}
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.
