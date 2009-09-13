{ Compiletime Extctrls support }
unit uPSC_extctrls;

{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;

(*
   Will register files from:
     ExtCtrls
 
Requires:
  STD, classes, controls, graphics {$IFNDEF PS_MINIVCL}, stdctrls {$ENDIF}
*)

procedure SIRegister_ExtCtrls_TypesAndConsts(cl: TPSPascalCompiler);

procedure SIRegisterTSHAPE(Cl: TPSPascalCompiler);
procedure SIRegisterTIMAGE(Cl: TPSPascalCompiler);
procedure SIRegisterTPAINTBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTBEVEL(Cl: TPSPascalCompiler);
procedure SIRegisterTTIMER(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMPANEL(Cl: TPSPascalCompiler);
procedure SIRegisterTPANEL(Cl: TPSPascalCompiler);
{$IFNDEF CLX}
procedure SIRegisterTPAGE(Cl: TPSPascalCompiler);
procedure SIRegisterTNOTEBOOK(Cl: TPSPascalCompiler);
procedure SIRegisterTHEADER(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTCUSTOMRADIOGROUP(Cl: TPSPascalCompiler);
procedure SIRegisterTRADIOGROUP(Cl: TPSPascalCompiler);

procedure SIRegister_ExtCtrls(cl: TPSPascalCompiler);

implementation

uses sysutils, langdef;

procedure SIRegisterTSHAPE(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TGRAPHICCONTROL)), Uppercase(CS_TSHAPE)) do
  begin
    RegisterProperty(Uppercase(CS_BRUSH), Uppercase(CS_TBRUSH), iptrw);
    RegisterProperty(Uppercase(CS_PEN), Uppercase(CS_TPEN), iptrw);
    RegisterProperty(Uppercase(CS_SHAPE), Uppercase(CS_TSHAPETYPE), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_STYLECHANGED + '(SENDER:' + CS_TOBJECT + ')');
    RegisterProperty(Uppercase(CS_DRAGCURSOR), CS_Longint, iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), CS_TDragMode, iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), CS_TDragDropEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), CS_TDragOverEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), CS_TEndDragEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), CS_TMouseMoveEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONSTARTDRAG), CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTIMAGE(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TGRAPHICCONTROL)), Uppercase(CS_TIMAGE)) do
  begin
    RegisterProperty(Uppercase(CS_CANVAS), Uppercase(CS_TCANVAS), iptr);
    RegisterProperty(Uppercase(CS_AUTOSIZE), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_CENTER), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_PICTURE), Uppercase(CS_TPICTURE), iptrw);
    RegisterProperty(Uppercase(CS_STRETCH), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), Uppercase(CS_TNotifyEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONDBLCLICK), Uppercase(CS_TNotifyEvent), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_DRAGCURSOR), Uppercase(CS_Longint), iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), CS_TDragMode, iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), CS_TPopupMenu, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), CS_TDragDropEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), CS_TDragOverEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), CS_TEndDragEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), CS_TMouseMoveEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONSTARTDRAG), CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTPAINTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TGRAPHICCONTROL)), Uppercase(CS_TPAINTBOX)) do
  begin
    RegisterProperty(Uppercase(CS_CANVAS), CS_TCanvas, iptr);
    RegisterProperty(Uppercase(CS_COLOR), CS_TColor, iptrw);
    RegisterProperty(Uppercase(CS_Font), CS_TFont, iptrw);
    RegisterProperty(Uppercase(CS_PARENTCOLOR), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_PARENTFONT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDBLCLICK), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONPAINT), CS_TNOTIFYEVENT, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_DRAGCURSOR), CS_Longint, iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), CS_TDragMode, iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), CS_TPopupMenu, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), CS_TDragDropEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), CS_TDragOverEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), CS_TEndDragEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), CS_TMouseMoveEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONSTARTDRAG), CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTBEVEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TGRAPHICCONTROL)), Uppercase(CS_TBEVEL)) do
  begin
    RegisterProperty(Uppercase(CS_SHAPE), Uppercase(CS_TBEVELSHAPE), iptrw);
    RegisterProperty(Uppercase(CS_STYLE), Uppercase(CS_TBEVELSTYLE), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), CS_Boolean, iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTTIMER(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCOMPONENT)), Uppercase(CS_TTIMER)) do
  begin
    RegisterProperty(Uppercase(CS_ENABLED), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_INTERVAL), Uppercase(CS_CARDINAL), iptrw);
    RegisterProperty(Uppercase(CS_ONTIMER), Uppercase(CS_TNOTIFYEVENT), iptrw);
  end;
end;

procedure SIRegisterTCUSTOMPANEL(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMCONTROL)), Uppercase(CS_TCUSTOMPANEL));
end;

procedure SIRegisterTPANEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMPANEL)), Uppercase(CS_TPANEL)) do
  begin
    RegisterProperty(Uppercase(CS_ALIGNMENT), CS_TAlignment, iptrw);
    RegisterProperty(Uppercase(CS_BEVELINNER), CS_TPanelBevel, iptrw);
    RegisterProperty(Uppercase(CS_BEVELOUTER), CS_TPanelBevel, iptrw);
    RegisterProperty(Uppercase(CS_BEVELWIDTH), CS_TBevelWidth, iptrw);
    RegisterProperty(Uppercase(CS_BORDERWIDTH), CS_TBorderWidth, iptrw);
    RegisterProperty(Uppercase(CS_BORDERSTYLE), CS_TBorderStyle, iptrw);
    RegisterProperty(Uppercase(CS_CAPTION), CS_String, iptrw);
    RegisterProperty(Uppercase(CS_Color), CS_TColor, iptrw);
    RegisterProperty(Uppercase(CS_Font), CS_TFont, iptrw);
    RegisterProperty(Uppercase(CS_PARENTCOLOR), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_PARENTFONT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDBLCLICK), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONENTER), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONEXIT), CS_TNotifyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_DRAGCURSOR), CS_Longint, iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), CS_TDragMode, iptrw);
    RegisterProperty(Uppercase(CS_CTL3D), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_LOCKED), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_PARENTCTL3D), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), CS_TPopupMenu, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), CS_TDragDropEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), CS_TDragOverEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), CS_TEndDragEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), CS_TMouseMoveEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), CS_TMouseEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONRESIZE), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONSTARTDRAG), CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;
{$IFNDEF CLX}
procedure SIRegisterTPAGE(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMCONTROL)), Uppercase(CS_TPAGE)) do
  begin
    RegisterProperty(Uppercase(CS_CAPTION), CS_String, iptrw);
  end;
end;
procedure SIRegisterTNOTEBOOK(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMCONTROL)), Uppercase(CS_TNOTEBOOK)) do
  begin
    RegisterProperty(Uppercase(CS_ACTIVEPAGE), CS_String, iptrw);
    RegisterProperty(Uppercase(CS_Color), CS_TColor, iptrw);
    RegisterProperty(Uppercase(CS_Font), CS_TFont, iptrw);
    RegisterProperty(Uppercase(CS_PAGEINDEX), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_PAGES), Uppercase(CS_TSTRINGS), iptrw);
    RegisterProperty(Uppercase(CS_PARENTCOLOR), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_PARENTFONT), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONDBLCLICK), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONENTER), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONEXIT), CS_TNotifyEvent, iptrw);
    RegisterProperty(Uppercase(CS_ONPAGECHANGED), Uppercase(CS_TNOTIFYEVENT), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_CTL3D), CS_Boolean, iptrw);
    RegisterProperty(Uppercase(CS_DRAGCURSOR), Uppercase(CS_Longint), iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), Uppercase(CS_TDragMode), iptrw);
    RegisterProperty(Uppercase(CS_PARENTCTL3D), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPopupMenu), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), Uppercase(CS_TDragDropEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), Uppercase(CS_TDragOverEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), Uppercase(CS_TEndDragEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), Uppercase(CS_TMouseEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), Uppercase(CS_TMouseMoveEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), Uppercase(CS_TMouseEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONSTARTDRAG), Uppercase(CS_TStartDragEvent), iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTHEADER(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMCONTROL)), Uppercase(CS_THEADER)) do
  begin
    RegisterProperty(Uppercase(CS_SECTIONWIDTH), Uppercase(CS_INTEGER + ' ' + CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_ALLOWRESIZE), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_BORDERSTYLE), Uppercase(CS_TBORDERSTYLE), iptrw);
    RegisterProperty(Uppercase(CS_Font), Uppercase(CS_TFont), iptrw);
    RegisterProperty(Uppercase(CS_PARENTFONT), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_SECTIONS), Uppercase(CS_TSTRINGS), iptrw);
    RegisterProperty(Uppercase(CS_ONSIZING), Uppercase(CS_TSECTIONEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONSIZED), Uppercase(CS_TSECTIONEVENT), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPopupMenu), iptrw);
    {$ENDIF}
  end;
end;
{$ENDIF}

procedure SIRegisterTCUSTOMRADIOGROUP(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMGROUPBOX)), Uppercase(CS_TCUSTOMRADIOGROUP));
end;

procedure SIRegisterTRADIOGROUP(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCUSTOMRADIOGROUP)), Uppercase(CS_TRADIOGROUP)) do
  begin
    RegisterProperty(Uppercase(CS_CAPTION), Uppercase(CS_String), iptrw);
    RegisterProperty(Uppercase(CS_Color), Uppercase(CS_TColor), iptrw);
    RegisterProperty(Uppercase(CS_COLUMNS), Uppercase(CS_Integer), iptrw);
    RegisterProperty(Uppercase(CS_Font), Uppercase(CS_TFont), iptrw);
    RegisterProperty(Uppercase(CS_ITEMINDEX), Uppercase(CS_Integer), iptrw);
    RegisterProperty(Uppercase(CS_ITEMS), Uppercase(CS_TStrings), iptrw);
    RegisterProperty(Uppercase(CS_PARENTCOLOR), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_PARENTFONT), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), Uppercase(CS_TNotifyEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONENTER), Uppercase(CS_TNotifyEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONEXIT), Uppercase(CS_TNotifyEvent), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_CTL3D), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_DRAGCURSOR), Uppercase(CS_Longint), iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), Uppercase(CS_TDragMode), iptrw);
    RegisterProperty(Uppercase(CS_PARENTCTL3D), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPopupMenu), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), Uppercase(CS_TDragDropEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), Uppercase(CS_TDragOverEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), Uppercase(CS_TEndDragEvent), iptrw);
    RegisterProperty(Uppercase(CS_ONSTARTDRAG), Uppercase(CS_TStartDragEvent), iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegister_ExtCtrls_TypesAndConsts(cl: TPSPascalCompiler);
begin
  cl.AddTypeS(Uppercase(CS_TShapeType), '(' + CS_stRectangle + ', ' + CS_stSquare + ', ' + CS_stRoundRect + ', ' + CS_stRoundSquare + ', ' + CS_stEllipse + ', ' + CS_stCircle + ')');
  cl.AddTypeS(Uppercase(CS_TBevelStyle), '(' + CS_bsLowered + ', ' + CS_bsRaised + ')');
  cl.AddTypeS(Uppercase(CS_TBevelShape), '(' + CS_bsBox + ', ' + CS_bsFrame + ', ' + CS_bsTopLine + ', ' + CS_bsBottomLine + ', ' + CS_bsLeftLine + ', ' + CS_bsRightLine + ', ' + CS_bsSpacer + ')');
  cl.AddTypeS(Uppercase(CS_TPanelBevel), '(' + CS_bvNone + ', ' + CS_bvLowered + ', ' + CS_bvRaised + ', ' + CS_bvSpace + ')');
  cl.AddTypeS(Uppercase(CS_TBevelWidth), Uppercase(CS_Longint));
  cl.AddTypeS(Uppercase(CS_TBorderWidth), Uppercase(CS_Longint));
  cl.AddTypeS(Uppercase(CS_TSectionEvent), CS_procedure + '(Sender: ' + CS_TObject + '; ASection, AWidth: ' + CS_Integer + ')');
end;

procedure SIRegister_ExtCtrls(cl: TPSPascalCompiler);
begin
  SIRegister_ExtCtrls_TypesAndConsts(cl);

  {$IFNDEF PS_MINIVCL}
  SIRegisterTSHAPE(Cl);
  SIRegisterTIMAGE(Cl);
  SIRegisterTPAINTBOX(Cl);
  {$ENDIF}
  SIRegisterTBEVEL(Cl);
  {$IFNDEF PS_MINIVCL}
  SIRegisterTTIMER(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMPANEL(Cl);
  SIRegisterTPANEL(Cl);
  {$IFNDEF PS_MINIVCL}
  {$IFNDEF CLX}
  SIRegisterTPAGE(Cl);
  SIRegisterTNOTEBOOK(Cl);
  SIRegisterTHEADER(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMRADIOGROUP(Cl);
  SIRegisterTRADIOGROUP(Cl);
  {$ENDIF}
end;

end.





