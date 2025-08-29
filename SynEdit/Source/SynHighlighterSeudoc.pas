{------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynHighlighterPas.pas, released 2000-04-17.
The Original Code is based on the mwPasSyn.pas file from the
mwEdit component suite by Martin Waldenburg and other developers, the Initial
Author of this file is Martin Waldenburg.
Portions created by Martin Waldenburg are Copyright (C) 1998 Martin Waldenburg.
All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterSeudoc.pas,v 1.5 2009/05/03 10:05:49 dabdala Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}
{
@abstract(Sintaxis de seudocódigo - basado en el componente para pascal)
@author(Orignal Martin Waldenburg, adaptación David Abdala)
@created(1998, converted to SynEdit 2000-04-07 - Adaptado 2009)
@lastmod(Original: 2001-11-21 - Adaptación: 2009-05-30)
The SynHighlighterPas unit provides SynEdit with a Object Pascal syntax highlighter.
One extra property included (PackageSource):
  PackageSource - Allows you to enable/disable the highlighting of package keywords
}

unit SynHighlighterSeudoc;

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
{$ELSE}
  Windows,
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
{$ENDIF}
  SysUtils,
  Classes;

resourcestring
  SYNS_AttrAssignment = 'Asignación';
  
type
  TtkTokenKind = (tkAsm, tkComment, tkIdentifier, tkKey, tkNull, tkNumber,
    tkSpace, tkString, tkSymbol, tkUnknown, tkFloat, tkHex, tkDirec, tkChar, tkInner,
    tkAssignment);

  TRangeState = (rsANil, rsAnsi, rsAnsiAsm, rsAsm, rsBor, rsBorAsm, rsProperty,
    rsExports, rsDirective, rsDirectiveAsm, rsUnKnown);

  TProcTableProc = procedure of object;

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function(kw:string): TtkTokenKind of object;

type
  TSynSeudocSyn = class(TSynCustomHighlighter)
  private
    fAsmStart: Boolean;
    fRange: TRangeState;
    fLine: PChar;
    fLineNumber: Integer;
    fProcTable: array[#0..#255] of TProcTableProc;
    Run: LongInt;
    fStringLen: Integer;
    fToIdent: PChar;
    fIdentFuncTable: array[0..1023] of TIdentFuncTableFunc;
    fTokenPos: Integer;
    FTokenID: TtkTokenKind;
    fStringAttri: TSynHighlighterAttributes;
    fNumberAttri: TSynHighlighterAttributes;
    fKeyAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fProcAttri: TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fAssignAttri: TSynHighlighterAttributes;
    fPackageSource: Boolean;
    function KeyHash(ToHash: PChar): Integer;
    function KeyComp(const aKey: string): Boolean;
    function NormalFunc(kw:string): TtkTokenKind;
    function AltFunc(kw:string): TtkTokenKind;
    procedure InitIdent;
    function IdentKind(MayBe: PChar): TtkTokenKind;
    procedure MakeMethodTables;
    procedure AddressOpProc;
    procedure AsciiCharProc;
    procedure AnsiProc;
    procedure BorProc;
    procedure BraceOpenProc;
    procedure GreaterProc;
    procedure CRProc;
    procedure IdentProc;
    procedure IntegerProc;
    procedure LFProc;
    procedure LowerProc;
    procedure AssignmentProc;
    procedure NullProc;
    procedure NumberProc;
    procedure PointProc;
    procedure RoundOpenProc;
    procedure SemicolonProc;
    procedure SlashProc;
    procedure SpaceProc;
    procedure StringProc;
    procedure SymbolProc;
    procedure UnknownProc;
    procedure SetPackageSource(const Value: Boolean);
  protected
    function GetSampleSource: string; override;
    function IsFilterStored: boolean; override;
  public
    class function GetLanguageName: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
      override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetToken: string; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    procedure Next; override;
    procedure ResetRange; override;
    procedure SetLine(const Value: UnicodeString; LineNumber:Integer); override;
    procedure SetRange(Value: Pointer); override;
  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri
      write fCommentAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri
      write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeyAttri write fKeyAttri;
    property NumberAttri: TSynHighlighterAttributes read fNumberAttri
      write fNumberAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri
      write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri
      write fStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri
      write fSymbolAttri;
    property InnerRoutineAttri: TSynHighlighterAttributes read fProcAttri
      write fProcAttri;
    property AssignmentAttri: TSynHighlighterAttributes read fAssignAttri
      write fAssignAttri;
    property PackageSource: Boolean read fPackageSource write SetPackageSource default True;
  end;

procedure Register;

implementation

uses
  langdef,
{$IFDEF SYN_CLX}
  QSynEditStrConst
{$ELSE}
  SynEditStrConst
{$ENDIF};

procedure Register;
begin
// SynEdit highlighters
  RegisterComponents(SYNS_HighlightersPage, [TSynSeudocSyn]);
end;

var
  Identifiers: array[#0..#255] of ByteBool;
  mHashTable: array[#0..#255] of Integer;
  ResWords:array[0..1023] of string;

procedure MakeIdentTable;
var
  I, J: Char;
begin
  for I := #0 to #255 do
  begin
    Case I of
      '_', '0'..'9', 'a'..'z', 'A'..'Z','ñ','Ñ','á','é','í','ó','ú','ü','Á','É','Í','Ó','Ú','Ü': Identifiers[I] := True;
    else Identifiers[I] := False;
    end;
    J := UpCase(I);
    Case I of
      'a'..'z', 'A'..'Z', '_','ñ','Ñ','á','é','í','ó','ú','ü','Á','É','Í','Ó','Ú','Ü': mHashTable[I] := Ord(J) - 64;
    else mHashTable[Char(I)] := 0;
    end;
  end;
end;

procedure TSynSeudocSyn.InitIdent;
  procedure SetHashFunc(resWord:string);
  var
    hs:integer;
    tp:char;
  begin
    hs := KeyHash(PChar(resWord));
    if resWord = CS_asm then
      tp := 'a'
    else if resWord = CS_end then
      tp := 'e'
    else if resWord = CS_name then
      tp := 'm'
    else if (resWord = CS_read)or(resWord = CS_write)or(resWord = CS_stored)or(resWord = CS_readonly)or(resWord = CS_nodefault)or(resWord = CS_implements)or(resWord = CS_writeonly) then
      tp := 'r'
    else if (resWord = CS_package) or (resWord = CS_contains) or(resWord = CS_requires)then
      tp := 'p'
    else if resWord = CS_index then
      tp := 'i'
    else if resWord = CS_property then
      tp := 'y'
    else if resWord = CS_exports then
      tp := 'x'
    else
      tp := 'n';
    fIdentFuncTable[hs] := NormalFunc;
    ResWords[hs] := ResWords[hs] + ',' + resWord + ',' + tp;
  end;
  procedure SetInnerHash(resWord:string);
  var
    hs:integer;
  begin
    hs := KeyHash(PChar(resWord));
    fIdentFuncTable[hs] := NormalFunc;
    ResWords[hs] := ResWords[hs] + ',' + resWord + ',s';
  end;
var
  I: Integer;
  pF: PIdentFuncTableFunc;
begin
  pF := PIdentFuncTableFunc(@fIdentFuncTable);
  for I := Low(fIdentFuncTable) to High(fIdentFuncTable) do begin
    pF^ := AltFunc;
    Inc(pF);
  end;
  SetHashFunc(CS_if);
  SetHashFunc(CS_end);
  SetHashFunc(CS_endFor);
  SetHashFunc(CS_endFunction);
  SetHashFunc(CS_endIf);
  SetHashFunc(CS_endProcedure);
  SetHashFunc(CS_endProgram);
  SetHashFunc(CS_endRecord);
  SetHashFunc(CS_endWhile);
  SetHashFunc(CS_endIterar);
  SetHashFunc(CS_endCase);
  SetHashFunc(CS_endUnit);
  SetHashFunc(CS_caseCase);
  SetHashFunc(CS_do);
  SetHashFunc(CS_and);
  SetHashFunc(CS_as);
  SetHashFunc(CS_of);
  SetHashFunc(CS_in);
  SetHashFunc(CS_far);
  SetHashFunc(CS_Cdecl);
  SetHashFunc(CS_is);
  SetHashFunc(CS_case);
//  SetHashFunc(CS_read); no se utiliza y se usa como procedimiento
  SetHashFunc(CS_on);
  SetHashFunc(CS_label);
  SetHashFunc(CS_mod);
  SetHashFunc(CS_file);
  SetHashFunc(CS_or);
  SetHashFunc(CS_name);
  SetHashFunc(CS_to);
  SetHashFunc(CS_div);
  SetHashFunc(CS_begin);
  SetHashFunc(CS_near);
  SetHashFunc(CS_for);
  SetHashFunc(CS_forFrom);
  SetHashFunc(CS_shl);
  SetHashFunc(CS_packed);
  SetHashFunc(CS_else);
  SetHashFunc(CS_var);
  SetHashFunc(CS_vars);
  SetHashFunc(CS_final);
  SetHashFunc(CS_set);
  SetHashFunc(CS_shr);
  SetHashFunc(CS_sealed);
  SetHashFunc(CS_then);
  SetHashFunc(CS_not);
  SetHashFunc(CS_pascal);
  SetHashFunc(CS_raise);
  SetHashFunc(CS_out);
  SetHashFunc(CS_goto);
  SetHashFunc(CS_while);
  SetHashFunc(CS_xor);
  SetHashFunc(CS_safecall);
  SetHashFunc(CS_with);
  SetHashFunc(CS_dispid);
  SetHashFunc(CS_public);
  SetHashFunc(CS_try);
  SetHashFunc(CS_inline);
  SetHashFunc(CS_unit);
  SetHashFunc(CS_uses);
  SetHashFunc(CS_helper);
  SetHashFunc(CS_repeat);
  SetHashFunc(CS_iterar);
  SetHashFunc(CS_salirSi);
  SetHashFunc(CS_type);
  SetHashFunc(CS_default);
  SetHashFunc(CS_dynamic);
  SetHashFunc(CS_message);
  SetHashFunc(CS_stdcall);
  SetHashFunc(CS_const);
  SetHashFunc(CS_except);
  SetHashFunc(CS_exit);
  SetHashFunc(CS_break);
  SetHashFunc(CS_continue);
  SetHashFunc(CS_until);
  SetHashFunc(CS_finally);
  SetHashFunc(CS_interface);
  SetHashFunc(CS_deprecated);
  SetHashFunc(CS_abstract);
  SetHashFunc(CS_forward);
  SetHashFunc(CS_library);
  SetHashFunc(CS_exports);
  SetHashFunc(CS_program);
//  SetHashFunc(CS_downto);
  SetHashFunc(CS_step);
  SetHashFunc(CS_private);
  SetHashFunc(CS_overload);
  SetHashFunc(CS_inherited);
  SetHashFunc(CS_assembler);
  SetHashFunc(CS_absolute);
  SetHashFunc(CS_published);
  SetHashFunc(CS_override);
  SetHashFunc(CS_threadvar);
  SetHashFunc(CS_export);
  SetHashFunc(CS_external);
  SetHashFunc(CS_automated);
  SetHashFunc(CS_register);
  SetHashFunc(CS_platform);
  SetHashFunc(CS_function);
  SetHashFunc(CS_procedure);
  SetHashFunc(CS_protected);
  SetHashFunc(CS_operator);
  SetHashFunc(CS_implements);
  SetHashFunc(CS_property);
  SetHashFunc(CS_writeonly);
  SetHashFunc(CS_dispinterface);
  SetHashFunc(CS_reintroduce);
  SetHashFunc(CS_finalization);
  SetHashFunc(CS_destructor);
  SetHashFunc(CS_constructor);
  SetHashFunc(CS_implementation);
  SetHashFunc(CS_initialization);
  SetHashFunc(CS_resourcestring);
  SetHashFunc(CS_stringresource);
  //tipos
  SetHashFunc(CS_string);
  SetHashFunc(CS_record);
  SetHashFunc(CS_array);
  SetHashFunc(CS_nil);
  SetHashFunc(CS_class);
  SetHashFunc(CS_object);
  SetHashFunc(CS_integer);
  SetHashFunc(CS_List);
  SetHashFunc(CS_real);
  SetHashFunc(CS_cardinal);
  SetHashFunc(CS_word);
  SetHashFunc(CS_char);
  SetHashFunc(CS_float);
  SetHashFunc(CS_boolean);
  SetHashFunc(CS_currency);
  SetHashFunc(CS_extended);
  SetHashFunc(CS_int64);
  SetHashFunc(CS_longWord);
  SetHashFunc(CS_single);
  SetHashFunc(CS_smallint);
  SetHashFunc(CS_shortint);
  SetHashFunc(CS_TDateTime);
  //funciones y procedimiento internos
  SetInnerHash(CS_charToInt);
  SetInnerHash(CS_intToChar);
  SetInnerHash(CS_delete);
  SetInnerHash(CS_Read);
  SetInnerHash(CS_Show);
  SetInnerHash(CS_Wait);
  SetInnerHash(CS_ClearScreen);
  SetInnerHash(CS_ShowAndRead);
  SetInnerHash(CS_Add);
  SetInnerHash(CS_Random);
  SetInnerHash(CS_ReadDateTime);
  SetInnerHash(CS_Remove);
  SetInnerHash(CS_whatType);
  SetInnerHash(CS_sameType);
  SetInnerHash(CS_sameText);
  SetInnerHash(CS_replace);
  SetInnerHash(CS_copy);
  SetInnerHash(CS_pos);
  SetInnerHash(CS_Item);
  SetInnerHash(CS_AnyToString);
  SetInnerHash(CS_Inc);
  SetInnerHash(CS_Dec);
  SetInnerHash(CS_Count);
  //palabras no reservadas, pero con significado específico
  SetInnerHash(CS_result);
  SetInnerHash(CS_True);
  SetInnerHash(CS_False);

  SetInnerHash(CS_length);
  SetInnerHash(CS_High);
  SetInnerHash(CS_Low);
  SetInnerHash(CS_FormatDateTime);
  SetInnerHash(CS_DateToStr);
  SetInnerHash(CS_Now);
  SetInnerHash(CS_Date);
  SetInnerHash(CS_crlf);
  SetInnerHash(CS_First);
  SetInnerHash(CS_Last);
  SetInnerHash(CS_RemoveLast);
  SetInnerHash(CS_RemoveFirst);
  SetInnerHash(CS_DecodeDate);
  SetInnerHash(CS_EncodeDate);
  SetInnerHash(CS_DecodeTime);
  SetInnerHash(CS_SetLength);
  SetInnerHash(CS_DayOfWeek);
  SetInnerHash(CS_StrToInt);
  SetInnerHash(CS_StrToInt64);
  SetInnerHash(CS_StrToFloat);
  SetInnerHash(CS_StrToDate);
  SetInnerHash(CS_EncodeTime);
  SetInnerHash(CS_Time);
  SetInnerHash(CS_Uppercase);
  SetInnerHash(CS_Lowercase);
  SetInnerHash(CS_Abs);
  SetInnerHash(CS_Trunc);
  SetInnerHash(CS_SizeOf);
  SetInnerHash(CS_Sin);
  SetInnerHash(CS_Trim);
  SetInnerHash(CS_Sqrt);
  SetInnerHash(CS_Pi);
  SetInnerHash(CS_MessageBox);
  SetInnerHash(CS_Int);
  SetInnerHash(CS_TryEncodeDate);
  SetInnerHash(CS_TryEncodeTime);
  {archivos}
  SetInnerHash(CS_OpenFile);
  SetInnerHash(CS_CreateFile);
  SetInnerHash(CS_CloseFile);
  SetInnerHash(CS_WriteFile);
  SetInnerHash(CS_ReadFile);
  SetInnerHash(CS_FileSize);
  SetInnerHash(CS_ValidFile);
  SetInnerHash(CS_EmptyFile);
  SetInnerHash(CS_SeekFile);
  SetInnerHash(CS_FilePos);
end;

function TSynSeudocSyn.KeyHash(ToHash: PChar): Integer;
begin
  Result := 0;
  while ToHash^ in ['_','a'..'z', 'A'..'Z','ñ','Ñ','á','é','í','ó','ú','ü','Á','É','Í','Ó','Ú','Ü'] do
  begin
    inc(Result, mHashTable[ToHash^]);
    inc(ToHash);
  end;
  if ToHash^ in ['0'..'9'] then inc(ToHash);
  fStringLen := ToHash - fToIdent;
  if result > 1023 then
    result := 0;
end; { KeyHash }

function TSynSeudocSyn.KeyComp(const aKey: string): Boolean;
var
  I: Integer;
  Temp: PChar;
begin
  Temp := fToIdent;
  if Length(aKey) = fStringLen then
  begin
    Result := True;
    for i := 1 to fStringLen do
    begin
      if mHashTable[Temp^] <> mHashTable[aKey[i]] then
      begin
        Result := False;
        break;
      end;
      inc(Temp);
    end;
  end else Result := False;
end; { KeyComp }

function TSynSeudocSyn.NormalFunc(kw:string): TtkTokenKind;
var
  cpos:integer;
  currw:string;
begin
  Result := tkIdentifier;
  repeat
    Delete(kw,1,1);
    cpos := Pos(',',kw);
    currw := Copy(kw,1,cpos - 1);
    delete(kw,1,cpos);
    if KeyComp(currw) then begin
      Result := tkKey;
      case kw[1] of
        'a':begin
          fRange := rsAsm;
          fAsmStart := True;
        end;
        'e':fRange := rsUnknown;
        'i': if not (fRange in [rsProperty, rsExports]) then Result := tkIdentifier;
        'm': if not (fRange = rsExports) then Result := tkIdentifier;
        'p': if not PackageSource then Result := tkIdentifier;
        'r': if not (fRange = rsProperty) then Result := tkIdentifier;
        'x': fRange := rsExports;
        'y': fRange := rsProperty;
        's': Result := tkInner;
      end;
      exit;
    end;
    Delete(kw,1,1);
  until kw = '';
end;

function TSynSeudocSyn.AltFunc(kw:string): TtkTokenKind;
begin
  Result := tkIdentifier
end;

function TSynSeudocSyn.IdentKind(MayBe: PChar): TtkTokenKind;
var
  HashKey: Integer;
begin
  fToIdent := MayBe;
  HashKey := KeyHash(MayBe);
  if HashKey > 0 then Result := fIdentFuncTable[HashKey](ResWords[HashKey]) else
    Result := tkIdentifier;
end;

procedure TSynSeudocSyn.MakeMethodTables;
var
  I: Char;
begin
  for I := #0 to #255 do
    case I of
      CS_CharChar: fProcTable[I] := AsciiCharProc;
      CS_HexChar: fProcTable[I] := IntegerProc;
      CS_quote: fProcTable[I] := StringProc;
      CS_addressOf: fProcTable[I] := AddressOpProc;
      else begin
        case I of
          #0: fProcTable[I] := NullProc;
          #10: fProcTable[I] := LFProc;
          #13: fProcTable[I] := CRProc;
          #1..#9, #11, #12, #14..#32:
            fProcTable[I] := SpaceProc;
          '0'..'9': fProcTable[I] := NumberProc;
          'A'..'Z', 'a'..'z', '_','ñ','Ñ','á','é','í','ó','ú','ü','Á','É','Í','Ó','Ú','Ü':
            fProcTable[I] := IdentProc;
          '{': fProcTable[I] := BraceOpenProc;
          '}', '!', '"', '%', '&', '('..'/', ':'..'@', '['..'^', '`', '~':
            begin
              case I of
                '(': fProcTable[I] := RoundOpenProc;
                '.': fProcTable[I] := PointProc;
                ';': fProcTable[I] := SemicolonProc;
                '/': fProcTable[I] := SlashProc;
                '>': fProcTable[I] := GreaterProc;
                '<': fProcTable[I] := LowerProc;
              else
                fProcTable[I] := SymbolProc;
              end;
            end;
        else
          fProcTable[I] := UnknownProc;
        end;
      end;
    end;
end;

constructor TSynSeudocSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fPackageSource := True;

  fCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment);
  fCommentAttri.Style:= [fsItalic];
  AddAttribute(fCommentAttri);
  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier);
  AddAttribute(fIdentifierAttri);
  fKeyAttri := TSynHighlighterAttributes.Create(SYNS_AttrReservedWord);
  fKeyAttri.Style:= [fsBold];
  AddAttribute(fKeyAttri);
  fNumberAttri := TSynHighlighterAttributes.Create(SYNS_AttrNumber);
  AddAttribute(fNumberAttri);
  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace);
  AddAttribute(fSpaceAttri);
  fAssignAttri := TSynHighlighterAttributes.Create(SYNS_AttrAssignment);
  AddAttribute(fAssignAttri);
  fStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString);
  AddAttribute(fStringAttri);
  fSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol);
  AddAttribute(fSymbolAttri);
  fProcAttri := TSynHighlighterAttributes.Create(SYNS_AttrSystem);
  AddAttribute(fProcAttri);
  SetAttributesOnChange(DefHighlightChange);

  InitIdent;
  MakeMethodTables;
  fRange := rsUnknown;
  fAsmStart := False;
  fDefaultFilter := SYNS_FilterSeudocodigo;
end; { Create }

procedure TSynSeudocSyn.SetLine(const Value: UnicodeString; LineNumber:Integer);
begin
  fLine := PChar(Value);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end; { SetLine }

procedure TSynSeudocSyn.AddressOpProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] = CS_AddressOf then inc(Run);
end;

procedure TSynSeudocSyn.AsciiCharProc;
begin
  fTokenID := tkChar;
  Inc(Run);
  while FLine[Run] in ['0'..'9', CS_HexChar, 'A'..'F', 'a'..'f'] do
    Inc(Run);
end;

procedure TSynSeudocSyn.BorProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      if fRange in [rsDirective, rsDirectiveAsm] then
        fTokenID := tkDirec
      else
        fTokenID := tkComment;
      repeat
        if fLine[Run] = '}' then
        begin
          Inc(Run);
          if fRange in [rsBorAsm, rsDirectiveAsm] then
            fRange := rsAsm
          else
            fRange := rsUnKnown;
          break;
        end;
        Inc(Run);
      until fLine[Run] in [#0, #10, #13];
    end;
  end;
end;

procedure TSynSeudocSyn.BraceOpenProc;
begin
  if (fLine[Run + 1] = '$') then
  begin
    if fRange = rsAsm then
      fRange := rsDirectiveAsm
    else
      fRange := rsDirective;
  end
  else
  begin
    if fRange = rsAsm then
      fRange := rsBorAsm
    else
      fRange := rsBor;
  end;
  BorProc;
end;

procedure TSynSeudocSyn.GreaterProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] = '=' then inc(Run);
end;

procedure TSynSeudocSyn.CRProc;
begin
  fTokenID := tkSpace;
  inc(Run);
  if fLine[Run] = #10 then
    Inc(Run);
end; { CRProc }


procedure TSynSeudocSyn.IdentProc;
begin
  fTokenID := IdentKind((fLine + Run));
  inc(Run, fStringLen);
  while Identifiers[fLine[Run]] do
    Inc(Run);
end; { IdentProc }


procedure TSynSeudocSyn.IntegerProc;
begin
  inc(Run);
  fTokenID := tkHex;
  while FLine[Run] in ['0'..'9', 'A'..'F', 'a'..'f'] do
    Inc(Run);
end; { IntegerProc }


procedure TSynSeudocSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end; { LFProc }


procedure TSynSeudocSyn.LowerProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] in ['=', '>'] then
    Inc(Run);
end; { LowerProc }


procedure TSynSeudocSyn.NullProc;
begin
  fTokenID := tkNull;
end; { NullProc }

procedure TSynSeudocSyn.NumberProc;
begin
  Inc(Run);
  fTokenID := tkNumber;
  while FLine[Run] in ['0'..'9', '.', 'e', 'E', '-', '+'] do
  begin
    case FLine[Run] of
      '.':
        if FLine[Run + 1] = '.' then
          Break
        else
          fTokenID := tkFloat;
      'e', 'E': fTokenID := tkFloat;
      '-', '+':
        begin
          if fTokenID <> tkFloat then // arithmetic
            Break;
          if not (FLine[Run - 1] in ['e', 'E']) then
            Break; //float, but it ends here
        end;
    end;
    Inc(Run);
  end;
end; { NumberProc }

procedure TSynSeudocSyn.PointProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
  if fLine[Run] in ['.', ')'] then
    Inc(Run);
end; { PointProc }

procedure TSynSeudocSyn.AnsiProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    fTokenID := tkComment;
    repeat
      if (fLine[Run] = '*') and (fLine[Run + 1] = ')') then begin
        Inc(Run, 2);
        if fRange = rsAnsiAsm then
          fRange := rsAsm
        else
          fRange := rsUnKnown;
        break;
      end;
      Inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end;
end;

procedure TSynSeudocSyn.RoundOpenProc;
begin
  Inc(Run);
  case fLine[Run] of
    '*':
      begin
        Inc(Run);
        if fRange = rsAsm then
          fRange := rsAnsiAsm
        else
          fRange := rsAnsi;
        fTokenID := tkComment;
        if not (fLine[Run] in [#0, #10, #13]) then
          AnsiProc;
      end;
    '.':
      begin
        inc(Run);
        fTokenID := tkSymbol;
      end;
  else
    fTokenID := tkSymbol;
  end;
end;

procedure TSynSeudocSyn.SemicolonProc;
begin
  Inc(Run);
  fTokenID := tkSymbol;
  if fRange in [rsProperty, rsExports] then
    fRange := rsUnknown;
end;

procedure TSynSeudocSyn.SlashProc;
begin
  Inc(Run);
  if (fLine[Run] = '/') then
  begin
    fTokenID := tkComment;
    repeat
      Inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end
  else
    fTokenID := tkSymbol;
end;

procedure TSynSeudocSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while FLine[Run] in [#1..#9, #11, #12, #14..#32] do inc(Run);
end;

procedure TSynSeudocSyn.StringProc;
begin
  fTokenID := tkString;
  Inc(Run);
  while not (fLine[Run] in [#0, #10, #13]) do begin
    if fLine[Run] = CS_quote then begin
      Inc(Run);
      if fLine[Run] <> CS_quote then
        break;
    end;
    Inc(Run);
  end;
end;

procedure TSynSeudocSyn.SymbolProc;
begin
  inc(Run);
  fTokenID := tkSymbol;
end;

procedure TSynSeudocSyn.UnknownProc;
begin
{$IFDEF SYN_MBCSSUPPORT}
  if FLine[Run] in LeadBytes then
    Inc(Run, 2)
  else
{$ENDIF}
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynSeudocSyn.Next;
begin
  fAsmStart := False;
  fTokenPos := Run;
  case fRange of
    rsAnsi, rsAnsiAsm:
      AnsiProc;
    rsBor, rsBorAsm, rsDirective, rsDirectiveAsm:
      BorProc;
  else begin
    if CS_assignment[1] = fLine[Run] then begin
      AssignmentProc;
      if fTokenId <> tkUnknown then
        exit;
    end;
    fProcTable[fLine[Run]];
  end;
  end;
end;

function TSynSeudocSyn.GetDefaultAttribute(Index: integer):
  TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := fKeyAttri;
    SYN_ATTR_STRING: Result := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
    SYN_ATTR_SYMBOL: Result := fSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynSeudocSyn.GetEol: Boolean;
begin
  Result := fTokenID = tkNull;
end;

function TSynSeudocSyn.GetToken: string;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;

function TSynSeudocSyn.GetTokenID: TtkTokenKind;
begin
  if not fAsmStart and (fRange = rsAsm)
    and not (fTokenId in [tkNull, tkComment, tkDirec, tkSpace])
  then
    Result := tkAsm
  else
    Result := fTokenId;
end;

function TSynSeudocSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case GetTokenID of
    tkComment: Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey: Result := fKeyAttri;
    tkNumber: Result := fNumberAttri;
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkSymbol: Result := fSymbolAttri;
    tkUnknown: Result := fSymbolAttri;
    tkInner: Result := fProcAttri;
    tkAssignment: Result := fAssignAttri;
  else
    Result := nil;
  end;
end;

function TSynSeudocSyn.GetTokenKind: integer;
begin
  Result := Ord(GetTokenID);
end;

function TSynSeudocSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

function TSynSeudocSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

procedure TSynSeudocSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

procedure TSynSeudocSyn.ResetRange;
begin
  fRange:= rsUnknown;
end;

function TSynSeudocSyn.GetSampleSource: string;
begin
  Result := '{ Syntax highlighting }'#13#10 +
             CS_procedure + ' TForm1.Button1Click(Sender: ' + CS_TObject + ')' + CS_iend + #13#10 +
             CS_vars + #13#10 +
             '  ' + CS_Integer + ' Number, I, X' + CS_iend + #13#10 +
             CS_begin + #13#10 +
             '  Number ' + CS_assignment + ' 123456' + CS_iend + #13#10 +
             '  Caption := ''The Number is'' + #32 + IntToStr(Number);'#13#10 +
             '  for I := 0 to Number do'#13#10 +
             '  begin'#13#10 +
             '    Inc(X);'#13#10 +
             '    Dec(X);'#13#10 +
             '    X := X + 1.0;'#13#10 +
             '    X := X - $5E;'#13#10 +
             '  end;'#13#10 +
             '  {$R+}'#13#10 +
             '  asm'#13#10 +
             '    mov AX, 1234H'#13#10 +
             '    mov Number, AX'#13#10 +
             '  end;'#13#10 +
             '  {$R-}'#13#10 +
             'end;';
end; { GetSampleSource }


class function TSynSeudocSyn.GetLanguageName: string;
begin
  Result := SYNS_LangSeudocodigo;
end;

function TSynSeudocSyn.IsFilterStored: boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterSeudocodigo;
end;

procedure TSynSeudocSyn.SetPackageSource(const Value: Boolean);
begin
  if fPackageSource <> Value then
  begin
    fPackageSource := Value;
    DefHighlightChange( Self );
  end;
end;


procedure TSynSeudocSyn.AssignmentProc;
var
  prun:integer;
begin
  fTokenId := tkUnknown;
  for prun := 2 to Length(CS_assignment) do begin
    if CS_assignment[prun] <> fLine[Run + prun - 1] then
      exit;
  end;
  fTokenID := tkAssignment;
  inc(Run,Length(CS_assignment));
end;

initialization
  MakeIdentTable;
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynSeudocSyn);
{$ENDIF}
end.
