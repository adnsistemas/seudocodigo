{ Compiletime Graphics support }
unit uPSC_graphics;

{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;



procedure SIRegister_Graphics_TypesAndConsts(Cl: TPSPascalCompiler);
procedure SIRegisterTGRAPHICSOBJECT(Cl: TPSPascalCompiler);
procedure SIRegisterTFont(Cl: TPSPascalCompiler);
procedure SIRegisterTPEN(Cl: TPSPascalCompiler);
procedure SIRegisterTBRUSH(Cl: TPSPascalCompiler);
procedure SIRegisterTCanvas(cl: TPSPascalCompiler);
procedure SIRegisterTGraphic(CL: TPSPascalCompiler);
procedure SIRegisterTBitmap(CL: TPSPascalCompiler; Streams: Boolean);

procedure SIRegister_Graphics(Cl: TPSPascalCompiler; Streams: Boolean);

implementation
uses
  langdef
{$IFNDEF PS_NOGRAPHCONST}
  ,{$IFDEF CLX}QGraphics{$ELSE}Graphics{$ENDIF}
{$ELSE}
{$IFNDEF CLX}
{$IFNDEF FPC}
  ,Windows
{$ENDIF}
{$ENDIF}
{$ENDIF};

procedure SIRegisterTGRAPHICSOBJECT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TPERSISTENT), CS_TGRAPHICSOBJECT) do
  begin
    RegisterProperty(CS_ONCHANGE, CS_TNOTIFYEVENT, iptrw);
  end;
end;

procedure SIRegisterTFont(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TGraphicsObject), CS_TFONT) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_Create);
{$IFNDEF CLX}
    RegisterProperty(CS_Handle, CS_Integer, iptRW);
{$ENDIF}
    RegisterProperty(CS_Color, CS_TColor, iptRW);
    RegisterProperty(CS_Height, CS_Integer, iptRW);
    RegisterProperty(CS_Name, CS_String, iptRW);
    RegisterProperty(CS_Pitch, CS_Byte, iptRW);
    RegisterProperty(CS_Size, CS_Integer, iptRW);
    RegisterProperty(CS_PixelsPerInch, CS_Integer, iptRW);
    RegisterProperty(CS_Style, CS_TFontStyles, iptrw);
  end;
end;

procedure SIRegisterTCanvas(cl: TPSPascalCompiler); // requires TPersistent
begin
  with Cl.AddClassN(cl.FindClass(CS_TPersistent), CS_TCANVAS) do
  begin
    RegisterMethod(CS_procedure + ' ' + CS_Arc + '(X1, Y1, X2, Y2, X3, Y3, X4, Y4: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Chord + '(X1, Y1, X2, Y2, X3, Y3, X4, Y4: ' + CS_Integer+ ')');
//    RegisterMethod(CS_procedure + ' ' + CS_Draw(X, Y: Integer; Graphic: TGraphic);');
    RegisterMethod(CS_procedure + ' ' + CS_Ellipse + '(X1, Y1, X2, Y2: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_FillRect + '(' + CS_const + ' Rect: ' + CS_TRect + ')');
{$IFNDEF CLX}
    RegisterMethod(CS_procedure + ' ' + CS_FloodFill + '(X, Y: ' + CS_Integer + '; Color: ' + CS_TColor + '; FillStyle: ' + CS_Byte + ')');
{$ENDIF}
    RegisterMethod(CS_procedure + ' ' + CS_LineTo + '(X, Y: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_MoveTo + '(X, Y: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Pie + '(X1, Y1, X2, Y2, X3, Y3, X4, Y4: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Rectangle + '(X1, Y1, X2, Y2: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Refresh);
    RegisterMethod(CS_procedure + ' ' + CS_RoundRect + '(X1, Y1, X2, Y2, X3, Y3: ' + CS_Integer + ')');
    RegisterMethod(CS_function + ' ' + CS_TextHeight + '(Text: ' + CS_String + '): ' + CS_Integer);
    RegisterMethod(CS_procedure + ' ' + CS_TextOut + '(X, Y: ' + CS_Integer + '; Text: ' + CS_String + ')');
    RegisterMethod(CS_function + ' ' + CS_TextWidth + '(Text: ' + CS_String + '): ' + CS_Integer);
{$IFNDEF CLX}
    RegisterProperty(CS_Handle, CS_Integer, iptRw);
{$ENDIF}
    RegisterProperty(CS_Pixels, CS_Integer + ' ' + CS_Integer + ' ' + CS_Integer, iptRW);
    RegisterProperty(CS_Brush, CS_TBrush, iptR);
    RegisterProperty(CS_CopyMode, CS_Byte, iptRw);
    RegisterProperty(CS_Font, CS_TFont, iptR);
    RegisterProperty(CS_Pen, CS_TPen, iptR);
  end;
end;

procedure SIRegisterTPEN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TGRAPHICSOBJECT), CS_TPEN) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE);
    RegisterProperty(CS_COLOR, CS_TCOLOR, iptrw);
    RegisterProperty(CS_MODE, CS_TPENMODE, iptrw);
    RegisterProperty(CS_STYLE, CS_TPENSTYLE, iptrw);
    RegisterProperty(CS_WIDTH, CS_INTEGER, iptrw);
  end;
end;

procedure SIRegisterTBRUSH(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TGRAPHICSOBJECT), CS_TBRUSH) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE);
    RegisterProperty(CS_COLOR, CS_TCOLOR, iptrw);
    RegisterProperty(CS_STYLE, CS_TBRUSHSTYLE, iptrw);
  end;
end;

procedure SIRegister_Graphics_TypesAndConsts(Cl: TPSPascalCompiler);
{$IFDEF PS_NOGRAPHCONST}
const
  clSystemColor = {$IFDEF DELPHI7UP} $FF000000 {$ELSE} $80000000 {$ENDIF};
{$ENDIF}
begin
{$IFNDEF PS_NOGRAPHCONST}
  cl.AddConstantN(CS_clScrollBar, CS_Integer).Value.ts32 := clScrollBar;
  cl.AddConstantN(CS_clBackground, CS_Integer).Value.ts32 := clBackground;
  cl.AddConstantN(CS_clActiveCaption, CS_Integer).Value.ts32 := clActiveCaption;
  cl.AddConstantN(CS_clInactiveCaption, CS_Integer).Value.ts32 := clInactiveCaption;
  cl.AddConstantN(CS_clMenu, CS_Integer).Value.ts32 := clMenu;
  cl.AddConstantN(CS_clWindow, CS_Integer).Value.ts32 := clWindow;
  cl.AddConstantN(CS_clWindowFrame, CS_Integer).Value.ts32 := clWindowFrame;
  cl.AddConstantN(CS_clMenuText, CS_Integer).Value.ts32 := clMenuText;
  cl.AddConstantN(CS_clWindowText, CS_Integer).Value.ts32 := clWindowText;
  cl.AddConstantN(CS_clCaptionText, CS_Integer).Value.ts32 := clCaptionText;
  cl.AddConstantN(CS_clActiveBorder, CS_Integer).Value.ts32 := clActiveBorder;
  cl.AddConstantN(CS_clInactiveBorder, CS_Integer).Value.ts32 := clInactiveCaption;
  cl.AddConstantN(CS_clAppWorkSpace, CS_Integer).Value.ts32 := clAppWorkSpace;
  cl.AddConstantN(CS_clHighlight, CS_Integer).Value.ts32 := clHighlight;
  cl.AddConstantN(CS_clHighlightText, CS_Integer).Value.ts32 := clHighlightText;
  cl.AddConstantN(CS_clBtnFace, CS_Integer).Value.ts32 := clBtnFace;
  cl.AddConstantN(CS_clBtnShadow, CS_Integer).Value.ts32 := clBtnShadow;
  cl.AddConstantN(CS_clGrayText, CS_Integer).Value.ts32 := clGrayText;
  cl.AddConstantN(CS_clBtnText, CS_Integer).Value.ts32 := clBtnText;
  cl.AddConstantN(CS_clInactiveCaptionText, CS_Integer).Value.ts32 := clInactiveCaptionText;
  cl.AddConstantN(CS_clBtnHighlight, CS_Integer).Value.ts32 := clBtnHighlight;
  cl.AddConstantN(CS_cl3DDkShadow, CS_Integer).Value.ts32 := cl3DDkShadow;
  cl.AddConstantN(CS_cl3DLight, CS_Integer).Value.ts32 := cl3DLight;
  cl.AddConstantN(CS_clInfoText, CS_Integer).Value.ts32 := clInfoText;
  cl.AddConstantN(CS_clInfoBk, CS_Integer).Value.ts32 := clInfoBk;
{$ELSE}
{$IFNDEF CLX}  // These are VCL-only; CLX uses different constant values
  cl.AddConstantN(CS_clScrollBar, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_SCROLLBAR);
  cl.AddConstantN(CS_clBackground, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_BACKGROUND);
  cl.AddConstantN(CS_clActiveCaption, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_ACTIVECAPTION);
  cl.AddConstantN(CS_clInactiveCaption, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_INACTIVECAPTION);
  cl.AddConstantN(CS_clMenu, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_MENU);
  cl.AddConstantN(CS_clWindow, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_WINDOW);
  cl.AddConstantN(CS_clWindowFrame, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_WINDOWFRAME);
  cl.AddConstantN(CS_clMenuText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_MENUTEXT);
  cl.AddConstantN(CS_clWindowText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_WINDOWTEXT);
  cl.AddConstantN(CS_clCaptionText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_CAPTIONTEXT);
  cl.AddConstantN(CS_clActiveBorder, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_ACTIVEBORDER);
  cl.AddConstantN(CS_clInactiveBorder, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_INACTIVEBORDER);
  cl.AddConstantN(CS_clAppWorkSpace, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_APPWORKSPACE);
  cl.AddConstantN(CS_clHighlight, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_HIGHLIGHT);
  cl.AddConstantN(CS_clHighlightText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_HIGHLIGHTTEXT);
  cl.AddConstantN(CS_clBtnFace, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_BTNFACE);
  cl.AddConstantN(CS_clBtnShadow, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_BTNSHADOW);
  cl.AddConstantN(CS_clGrayText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_GRAYTEXT);
  cl.AddConstantN(CS_clBtnText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_BTNTEXT);
  cl.AddConstantN(CS_clInactiveCaptionText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_INACTIVECAPTIONTEXT);
  cl.AddConstantN(CS_clBtnHighlight, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_BTNHIGHLIGHT);
  cl.AddConstantN(CS_cl3DDkShadow, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_3DDKSHADOW);
  cl.AddConstantN(CS_cl3DLight, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_3DLIGHT);
  cl.AddConstantN(CS_clInfoText, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_INFOTEXT);
  cl.AddConstantN(CS_clInfoBk, CS_Integer).Value.ts32 := Integer(clSystemColor or COLOR_INFOBK);
{$ENDIF}
{$ENDIF}
  cl.AddConstantN(CS_clBlack, CS_Integer).Value.ts32 := $000000;
  cl.AddConstantN(CS_clMaroon, CS_Integer).Value.ts32 := $000080;
  cl.AddConstantN(CS_clGreen, CS_Integer).Value.ts32 := $008000;
  cl.AddConstantN(CS_clOlive, CS_Integer).Value.ts32 := $008080;
  cl.AddConstantN(CS_clNavy, CS_Integer).Value.ts32 := $800000;
  cl.AddConstantN(CS_clPurple, CS_Integer).Value.ts32 := $800080;
  cl.AddConstantN(CS_clTeal, CS_Integer).Value.ts32 := $808000;
  cl.AddConstantN(CS_clGray, CS_Integer).Value.ts32 := $808080;
  cl.AddConstantN(CS_clSilver, CS_Integer).Value.ts32 := $C0C0C0;
  cl.AddConstantN(CS_clRed, CS_Integer).Value.ts32 := $0000FF;
  cl.AddConstantN(CS_clLime, CS_Integer).Value.ts32 := $00FF00;
  cl.AddConstantN(CS_clYellow, CS_Integer).Value.ts32 := $00FFFF;
  cl.AddConstantN(CS_clBlue, CS_Integer).Value.ts32 := $FF0000;
  cl.AddConstantN(CS_clFuchsia, CS_Integer).Value.ts32 := $FF00FF;
  cl.AddConstantN(CS_clAqua, CS_Integer).Value.ts32 := $FFFF00;
  cl.AddConstantN(CS_clLtGray, CS_Integer).Value.ts32 := $C0C0C0;
  cl.AddConstantN(CS_clDkGray, CS_Integer).Value.ts32 := $808080;
  cl.AddConstantN(CS_clWhite, CS_Integer).Value.ts32 := $FFFFFF;
  cl.AddConstantN(CS_clNone, CS_Integer).Value.ts32 := $1FFFFFFF;
  cl.AddConstantN(CS_clDefault, CS_Integer).Value.ts32 := $20000000;

  Cl.addTypeS(CS_TFONTSTYLE, '(' + CS_FSBOLD + ', ' + CS_FSITALIC + ', ' + CS_FSUNDERLINE + ', ' + CS_FSSTRIKEOUT + ')');
  Cl.addTypeS(CS_TFONTSTYLES, CS_set_of + CS_TFONTSTYLE);

  cl.AddTypeS(CS_TFontPitch, '(' + CS_fpDefault + ', ' + CS_fpVariable + ', ' + CS_fpFixed + ')');
  cl.AddTypeS(CS_TPenStyle, '(' + CS_psSolid + ', ' + CS_psDash + ', ' + CS_psDot + ', ' + CS_psDashDot + ', ' + CS_psDashDotDot + ', ' + CS_psClear + ', ' + CS_psInsideFrame + ')');
  cl.AddTypeS(CS_TPenMode, '(' + CS_pmBlack + ', ' + CS_pmWhite + ', ' + CS_pmNop + ', ' + CS_pmNot + ', ' + CS_pmCopy + ', ' + CS_pmNotCopy + ', ' + CS_pmMergePenNot + ', ' + CS_pmMaskPenNot + ', ' + CS_pmMergeNotPen + ', ' + CS_pmMaskNotPen + ', ' + CS_pmMerge + ', ' + CS_pmNotMerge + ', ' + CS_pmMask + ', ' + CS_pmNotMask + ', ' + CS_pmXor + ', ' + CS_pmNotXor + ')');
  cl.AddTypeS(CS_TBrushStyle, '(' + CS_bsSolid + ', ' + CS_bsClear + ', ' + CS_bsHorizontal + ', ' + CS_bsVertical + ', ' + CS_bsFDiagonal + ', ' + CS_bsBDiagonal + ', ' + CS_bsCross + ', ' + CS_bsDiagCross+ ')');
  cl.addTypeS(CS_TColor, CS_integer);

{$IFNDEF CLX}
  cl.addTypeS(CS_HBITMAP, CS_Integer);
  cl.addTypeS(CS_HPALETTE, CS_Integer);
{$ENDIF}
end;

procedure SIRegisterTGraphic(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass(CS_TPersistent),CS_TGraphic) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_Create);
    RegisterMethod(CS_procedure + ' ' + CS_LoadFromFile + '( ' + CS_const + ' Filename : ' + CS_String + ')');
    RegisterMethod(CS_procedure + ' ' + CS_SaveToFile + '( ' + CS_const + ' Filename : ' + CS_String + ')');
    RegisterProperty(CS_Empty, CS_Boolean, iptr);
    RegisterProperty(CS_Height, CS_Integer, iptrw);
    RegisterProperty(CS_Modified, CS_Boolean, iptrw);
    RegisterProperty(CS_Width, CS_Integer, iptrw);
    RegisterProperty(CS_OnChange, CS_TNotifyEvent, iptrw);
  end;
end;

procedure SIRegisterTBitmap(CL: TPSPascalCompiler; Streams: Boolean);
begin
  with CL.AddClassN(CL.FindClass(CS_TGraphic),CS_TBitmap) do
  begin
    if Streams then begin
      RegisterMethod(CS_procedure + ' ' + CS_LoadFromStream + '( Stream : ' + CS_TStream + ')');
      RegisterMethod(CS_procedure + ' ' + CS_SaveToStream + '( Stream : ' + CS_TStream + ')');
    end;
    RegisterProperty(CS_Canvas, CS_TCanvas, iptr);
{$IFNDEF CLX}
    RegisterProperty(CS_Handle, CS_HBITMAP, iptrw);
{$ENDIF}

    {$IFNDEF IFPS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_Dormant);
    RegisterMethod(CS_procedure + ' ' + CS_FreeImage);
{$IFNDEF CLX}
    RegisterMethod(CS_procedure + ' ' + CS_LoadFromClipboardFormat + '( AFormat : ' + CS_Word + '; AData : ' + CS_THandle + '; APalette : ' + CS_HPALETTE + ')');
{$ENDIF}
    RegisterMethod(CS_procedure + ' ' + CS_LoadFromResourceName + '( Instance : ' + CS_THandle + '; ' + CS_const + ' ResName : ' + CS_String + ')');
    RegisterMethod(CS_procedure + ' ' + CS_LoadFromResourceID + '( Instance : ' + CS_THandle + '; ResID : ' + CS_Integer + ')');
{$IFNDEF CLX}
    RegisterMethod(CS_function + ' ' + CS_ReleaseHandle +' : ' + CS_HBITMAP);
    RegisterMethod(CS_function + ' ' + CS_ReleasePalette + ' : ' + CS_HPALETTE);
    RegisterMethod(CS_procedure + ' ' + CS_SaveToClipboardFormat + '( ' + CS_var + ' Format : ' + CS_Word + '; ' + CS_var + ' Data : ' + CS_THandle + '; ' + CS_var + ' APalette : ' + CS_HPALETTE + ')');
    RegisterProperty(CS_Monochrome, CS_Boolean, iptrw);
    RegisterProperty(CS_Palette, CS_HPALETTE, iptrw);
    RegisterProperty(CS_IgnorePalette, CS_Boolean, iptrw);
{$ENDIF}
    RegisterProperty(CS_TransparentColor, CS_TColor, iptr);
    {$ENDIF}
  end;
end;

procedure SIRegister_Graphics(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  SIRegister_Graphics_TypesAndConsts(Cl);
  SIRegisterTGRAPHICSOBJECT(Cl);
  SIRegisterTFont(Cl);
  SIRegisterTPEN(cl);
  SIRegisterTBRUSH(cl);
  SIRegisterTCanvas(cl);
  SIRegisterTGraphic(Cl);
  SIRegisterTBitmap(Cl, Streams);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

End.
