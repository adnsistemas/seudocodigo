{ Compiletime Buttons support }
unit uPSC_buttons;
{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils, langdef;

{
  Will register files from:
    Buttons
 
  Requires
      STD, classes, controls and graphics and StdCtrls
}
procedure SIRegister_Buttons_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTSPEEDBUTTON(Cl: TPSPascalCompiler);
procedure SIRegisterTBITBTN(Cl: TPSPascalCompiler);

procedure SIRegister_Buttons(Cl: TPSPascalCompiler);

implementation

procedure SIRegisterTSPEEDBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TGRAPHICCONTROL), CS_TSPEEDBUTTON) do
  begin
    RegisterProperty(CS_ALLOWALLUP, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_GROUPINDEX, CS_INTEGER, iptrw);
    RegisterProperty(CS_DOWN, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_CAPTION, CS_String, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_GLYPH, CS_TBITMAP, iptrw);
    RegisterProperty(CS_LAYOUT, CS_TBUTTONLAYOUT, iptrw);
    RegisterProperty(CS_MARGIN, CS_INTEGER, iptrw);
    RegisterProperty(CS_NUMGLYPHS, CS_BYTE, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_SPACING, CS_INTEGER, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
  end;
end;

procedure SIRegisterTBITBTN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TBUTTON), CS_TBITBTN) do
  begin
    RegisterProperty(CS_GLYPH, CS_TBITMAP, iptrw);
    RegisterProperty(CS_KIND, CS_TBITBTNKIND, iptrw);
    RegisterProperty(CS_LAYOUT, CS_TBUTTONLAYOUT, iptrw);
    RegisterProperty(CS_MARGIN, CS_INTEGER, iptrw);
    RegisterProperty(CS_NUMGLYPHS, CS_BYTE, iptrw);
    RegisterProperty(CS_STYLE, CS_TBUTTONSTYLE, iptrw);
    RegisterProperty(CS_SPACING, CS_INTEGER, iptrw);
  end;
end;



procedure SIRegister_Buttons_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS(CS_TButtonLayout, '(' + CS_blGlyphLeft +', ' + CS_blGlyphRight + ', ' + CS_blGlyphTop + ', ' + CS_blGlyphBottom + ')');
  Cl.AddTypeS(CS_TButtonState, '(' + CS_bsUp + ', ' + CS_bsDisabled + ', ' + CS_bsDown+ ', ' + CS_bsExclusive + ')');
  Cl.AddTypeS(CS_TButtonStyle, '(' + CS_bsAutoDetect + ', ' + CS_bsWin31 + ', ' + CS_bsNew + ')');
  Cl.AddTypeS(CS_TBitBtnKind, '(' + CS_bkCustom + ', ' + CS_bkOK + ', ' + CS_bkCancel + ', ' + CS_bkHelp + ', ' + CS_bkYes + ', ' + CS_bkNo + ', ' + CS_bkClose + ', ' + CS_bkAbort + ', ' + CS_bkRetry + ', ' + CS_bkIgnore + ', ' + CS_bkAll + ')');
end;

procedure SIRegister_Buttons(Cl: TPSPascalCompiler);
begin
  SIRegister_Buttons_TypesAndConsts(cl);
  SIRegisterTSPEEDBUTTON(cl);
  SIRegisterTBITBTN(cl);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.




