{ Compiletime STDCtrls support }
unit uPSC_stdctrls;

{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;

{
   Will register files from:
     stdctrls
 
Requires:
  STD, classes, controls and graphics
}

procedure SIRegister_StdCtrls_TypesAndConsts(cl: TPSPascalCompiler);



procedure SIRegisterTCUSTOMGROUPBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTGROUPBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMLABEL(Cl: TPSPascalCompiler);
procedure SIRegisterTLABEL(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMMEMO(Cl: TPSPascalCompiler);
procedure SIRegisterTMEMO(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCOMBOBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTBUTTONCONTROL(Cl: TPSPascalCompiler);
procedure SIRegisterTBUTTON(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMCHECKBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCHECKBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTRADIOBUTTON(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMLISTBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTLISTBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTSCROLLBAR(Cl: TPSPascalCompiler);

procedure SIRegister_StdCtrls(cl: TPSPascalCompiler);


implementation

uses langdef;

procedure SIRegisterTCUSTOMGROUPBOX(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass(CS_TCUSTOMCONTROL), CS_TCUSTOMGROUPBOX);
end;


procedure SIRegisterTGROUPBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMGROUPBOX), CS_TGROUPBOX) do
  begin
    RegisterProperty(CS_CAPTION, CS_String, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;





procedure SIRegisterTCUSTOMLABEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TGRAPHICCONTROL), CS_TCUSTOMLABEL) do
  begin
    {$IFNDEF PS_MINIVCL}
{$IFNDEF CLX}
    RegisterProperty(CS_CANVAS, CS_TCANVAS, iptr);
{$ENDIF}
    {$ENDIF}
  end;
end;


procedure SIRegisterTLABEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMLABEL), CS_TLABEL) do
  begin
    RegisterProperty(CS_ALIGNMENT, CS_TAlignment, iptrw);
    RegisterProperty(CS_AUTOSIZE, CS_Boolean, iptrw);
    RegisterProperty(CS_CAPTION, CS_String, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_FOCUSCONTROL, CS_TWinControl, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_LAYOUT, CS_TTextLayout, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_SHOWACCELCHAR, CS_Boolean, iptrw);
    RegisterProperty(CS_TRANSPARENT, CS_Boolean, iptrw);
    RegisterProperty(CS_WORDWRAP, CS_Boolean, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
  end;
end;







procedure SIRegisterTCUSTOMEDIT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TWINCONTROL), CS_TCUSTOMEDIT) do
  begin
    RegisterMethod(CS_procedure + ' ' + CS_CLEAR);
    RegisterMethod(CS_procedure + ' ' + CS_CLEARSELECTION);
    RegisterMethod(CS_procedure + ' ' + CS_SELECTALL);
    RegisterProperty(CS_MODIFIED, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_SELLENGTH, CS_INTEGER, iptrw);
    RegisterProperty(CS_SELSTART, CS_INTEGER, iptrw);
    RegisterProperty(CS_SELTEXT, CS_String, iptrw);
    RegisterProperty(CS_TEXT, CS_String, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_COPYTOCLIPBOARD);
    RegisterMethod(CS_procedure + ' ' + CS_CUTTOCLIPBOARD);
    RegisterMethod(CS_procedure + ' ' + CS_PASTEFROMCLIPBOARD);
    RegisterMethod(CS_function + ' ' + CS_GETSELTEXTBUF + '(BUFFER:' + CS_PCHAR + ';BUFSIZE:' + CS_INTEGER + '):' + CS_INTEGER);
    RegisterMethod(CS_procedure + ' ' + CS_SETSELTEXTBUF + '(BUFFER:' + CS_PCHAR + ')');
    {$ENDIF}
  end;
end;




procedure SIRegisterTEDIT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMEDIT), CS_TEDIT) do
  begin
    RegisterProperty(CS_AUTOSELECT, CS_Boolean, iptrw);
    RegisterProperty(CS_AUTOSIZE, CS_Boolean, iptrw);
    RegisterProperty(CS_BORDERSTYLE, CS_TBorderStyle, iptrw);
    RegisterProperty(CS_CHARCASE, CS_TEditCharCase, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_HIDESELECTION, CS_Boolean, iptrw);
    RegisterProperty(CS_MAXLENGTH, CS_Integer, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_PASSWORDCHAR, CS_Char, iptrw);
    RegisterProperty(CS_READONLY, CS_Boolean, iptrw);
    RegisterProperty(CS_TEXT, CS_String, iptrw);
    RegisterProperty(CS_ONCHANGE, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_OEMCONVERT, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;




procedure SIRegisterTCUSTOMMEMO(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMEDIT), CS_TCUSTOMMEMO) do
  begin
    {$IFNDEF CLX}
    RegisterProperty(CS_LINES, CS_TSTRINGS, iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTMEMO(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMMEMO), CS_TMEMO) do
  begin
    {$IFDEF CLX}
    RegisterProperty(CS_LINES, CS_TSTRINGS, iptrw);
    {$ENDIF}
    RegisterProperty(CS_ALIGNMENT, CS_TAlignment, iptrw);
    RegisterProperty(CS_BORDERSTYLE, CS_TBorderStyle, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_HIDESELECTION, CS_Boolean, iptrw);
    RegisterProperty(CS_MAXLENGTH, CS_Integer, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_READONLY, CS_Boolean, iptrw);
    RegisterProperty(CS_SCROLLBARS, CS_TScrollStyle, iptrw);
    RegisterProperty(CS_WANTRETURNS, CS_Boolean, iptrw);
    RegisterProperty(CS_WANTTABS, CS_Boolean, iptrw);
    RegisterProperty(CS_WORDWRAP, CS_Boolean, iptrw);
    RegisterProperty(CS_ONCHANGE, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_OEMCONVERT, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;





procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TWINCONTROL), CS_TCUSTOMCOMBOBOX) do
  begin
    RegisterProperty(CS_DROPPEDDOWN, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_ITEMS, CS_TSTRINGS, iptrw);
    RegisterProperty(CS_ITEMINDEX, CS_INTEGER, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_CLEAR);
    RegisterMethod(CS_procedure + ' ' + CS_SELECTALL);
    RegisterProperty(CS_CANVAS, CS_TCANVAS, iptr);
    RegisterProperty(CS_SELLENGTH, CS_INTEGER, iptrw);
    RegisterProperty(CS_SELSTART, CS_INTEGER, iptrw);
    RegisterProperty(CS_SELTEXT, CS_String, iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTCOMBOBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMCOMBOBOX), CS_TCOMBOBOX) do
  begin
    RegisterProperty(CS_STYLE, CS_TComboBoxStyle, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_DROPDOWNCOUNT, CS_Integer, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_MAXLENGTH, CS_Integer, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_SORTED, CS_Boolean, iptrw);
    RegisterProperty(CS_TEXT, CS_String, iptrw);
    RegisterProperty(CS_ONCHANGE, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDROPDOWN, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_ITEMHEIGHT, CS_Integer, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONDRAWITEM, CS_TDrawItemEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONMEASUREITEM, CS_TMeasureItemEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTBUTTONCONTROL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TWINCONTROL), CS_TBUTTONCONTROL) do
  begin
  end;
end;



procedure SIRegisterTBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TBUTTONCONTROL),  CS_TBUTTON) do
  begin
    RegisterProperty(CS_CANCEL, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_CAPTION, CS_String, iptrw);
    RegisterProperty(CS_DEFAULT, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_MODALRESULT, CS_LONGINT, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTCUSTOMCHECKBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TBUTTONCONTROL), CS_TCUSTOMCHECKBOX) do
  begin
  end;
end;



procedure SIRegisterTCHECKBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMCHECKBOX), CS_TCHECKBOX) do
  begin
    RegisterProperty(CS_ALIGNMENT, CS_TAlignment, iptrw);
    RegisterProperty(CS_ALLOWGRAYED, CS_Boolean, iptrw);
    RegisterProperty(CS_CAPTION, CS_String, iptrw);
    RegisterProperty(CS_CHECKED, CS_Boolean, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_STATE, CS_TCheckBoxState, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;





procedure SIRegisterTRADIOBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TBUTTONCONTROL), CS_TRADIOBUTTON) do
  begin
    RegisterProperty(CS_ALIGNMENT, CS_TALIGNMENT, iptrw);
    RegisterProperty(CS_CAPTION, CS_String, iptrw);
    RegisterProperty(CS_CHECKED, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTCUSTOMLISTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TWINCONTROL), CS_TCUSTOMLISTBOX) do
  begin
    RegisterProperty(CS_ITEMS, CS_TSTRINGS, iptrw);
    RegisterProperty(CS_ITEMINDEX, CS_INTEGER, iptrw);
    RegisterProperty(CS_SELCOUNT, CS_INTEGER, iptr);
    RegisterProperty(CS_SELECTED, CS_BOOLEAN + ' ' + CS_INTEGER, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_CLEAR);
    RegisterMethod(CS_function + ' ' + CS_ITEMATPOS + '(POS:' + CS_TPOINT + ';EXISTING:' + CS_BOOLEAN + '):' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_ITEMRECT + '(INDEX:' + CS_INTEGER + '):' + CS_TRECT);
    RegisterProperty(CS_CANVAS, CS_TCANVAS, iptr);
    RegisterProperty(CS_TOPINDEX, CS_INTEGER, iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegisterTLISTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TCUSTOMLISTBOX), CS_TLISTBOX) do
  begin
    RegisterProperty(CS_BORDERSTYLE, CS_TBorderStyle, iptrw);
    RegisterProperty(CS_COLOR, CS_TColor, iptrw);
    RegisterProperty(CS_FONT, CS_TFont, iptrw);
    RegisterProperty(CS_MULTISELECT, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTCOLOR, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTFONT, CS_Boolean, iptrw);
    RegisterProperty(CS_SORTED, CS_Boolean, iptrw);
    RegisterProperty(CS_STYLE, CS_TListBoxStyle, iptrw);
    RegisterProperty(CS_ONCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONDBLCLICK, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(CS_COLUMNS, CS_Integer, iptrw);
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_EXTENDEDSELECT, CS_Boolean, iptrw);
    RegisterProperty(CS_INTEGRALHEIGHT, CS_Boolean, iptrw);
    RegisterProperty(CS_ITEMHEIGHT, CS_Integer, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_TABWIDTH, CS_Integer, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONDRAWITEM, CS_TDrawItemEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONMEASUREITEM, CS_TMeasureItemEvent, iptrw);
    RegisterProperty(CS_ONMOUSEDOWN, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONMOUSEMOVE, CS_TMouseMoveEvent, iptrw);
    RegisterProperty(CS_ONMOUSEUP, CS_TMouseEvent, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;






procedure SIRegisterTSCROLLBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TWINCONTROL), CS_TSCROLLBAR) do
  begin
    RegisterProperty(CS_KIND, CS_TSCROLLBARKIND, iptrw);
    RegisterProperty(CS_MAX, CS_INTEGER, iptrw);
    RegisterProperty(CS_MIN, CS_INTEGER, iptrw);
    RegisterProperty(CS_POSITION, CS_INTEGER, iptrw);
    RegisterProperty(CS_ONCHANGE, CS_TNOTIFYEVENT, iptrw);
    RegisterProperty(CS_ONENTER, CS_TNotifyEvent, iptrw);
    RegisterProperty(CS_ONEXIT, CS_TNotifyEvent, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_SETPARAMS + '(APOSITION,AMIN,AMAX:' + CS_INTEGER + ')');
    RegisterProperty(CS_CTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_DRAGCURSOR, CS_Longint, iptrw);
    RegisterProperty(CS_DRAGMODE, CS_TDragMode, iptrw);
    RegisterProperty(CS_LARGECHANGE, CS_TSCROLLBARINC, iptrw);
    RegisterProperty(CS_PARENTCTL3D, CS_Boolean, iptrw);
    RegisterProperty(CS_PARENTSHOWHINT, CS_Boolean, iptrw);
    RegisterProperty(CS_POPUPMENU, CS_TPopupMenu, iptrw);
    RegisterProperty(CS_SMALLCHANGE, CS_TSCROLLBARINC, iptrw);
    RegisterProperty(CS_ONDRAGDROP, CS_TDragDropEvent, iptrw);
    RegisterProperty(CS_ONDRAGOVER, CS_TDragOverEvent, iptrw);
    RegisterProperty(CS_ONENDDRAG, CS_TEndDragEvent, iptrw);
    RegisterProperty(CS_ONKEYDOWN, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONKEYPRESS, CS_TKeyPressEvent, iptrw);
    RegisterProperty(CS_ONKEYUP, CS_TKeyEvent, iptrw);
    RegisterProperty(CS_ONSCROLL, CS_TSCROLLEVENT, iptrw);
    RegisterProperty(CS_ONSTARTDRAG, CS_TStartDragEvent, iptrw);
    {$ENDIF}
  end;
end;



procedure SIRegister_StdCtrls_TypesAndConsts(cl: TPSPascalCompiler);
begin
  cl.AddTypeS(CS_TEditCharCase, '(' + CS_ecNormal + ', ' + CS_ecUpperCase + ', ' + CS_ecLowerCase + ')');
  cl.AddTypeS(CS_TScrollStyle, '(' + CS_ssNone + ', ' + CS_ssHorizontal + ', ' + CS_ssVertical + ', ' + CS_ssBoth + ')');
  cl.AddTypeS(CS_TComboBoxStyle, '(' + CS_csDropDown + ', ' + CS_csSimple + ', ' + CS_csDropDownList + ', ' + CS_csOwnerDrawFixed + ', ' + CS_csOwnerDrawVariable + ')');
  cl.AddTypeS(CS_TDrawItemEvent, CS_procedure + '(Control: ' + CS_TWinControl + '; Index: ' + CS_Integer + '; Rect: ' + CS_TRect + '; State: ' + CS_Byte + ')');
  cl.AddTypeS(CS_TMeasureItemEvent, CS_procedure + '(Control: ' + CS_TWinControl + '; Index: ' + CS_Integer + '; ' + CS_var + ' Height: ' + CS_Integer + ')');
  cl.AddTypeS(CS_TCheckBoxState, '(' + CS_cbUnchecked + ', ' + CS_cbChecked + ', ' + CS_cbGrayed + ')');
  cl.AddTypeS(CS_TListBoxStyle, '(' + CS_lbStandard + ', ' + CS_lbOwnerDrawFixed + ', ' + CS_lbOwnerDrawVariable + ')');
  cl.AddTypeS(CS_TScrollCode, '(' + CS_scLineUp + ', ' + CS_scLineDown + ', ' + CS_scPageUp + ', ' + CS_scPageDown + ', ' + CS_scPosition + ', ' + CS_scTrack + ', ' + CS_scTop + ', ' + CS_scBottom + ', ' + CS_scEndScroll + ')');
  cl.AddTypeS(CS_TScrollEvent, CS_procedure + '(Sender: ' + CS_TObject + '; ScrollCode: ' + CS_TScrollCode + '; ' + CS_var + ' ScrollPos: ' + CS_Integer + ')');

  Cl.addTypeS(CS_TEOwnerDrawState, '(' + CS_odSelected + ', ' + CS_odGrayed + ', ' + CS_odDisabled + ', ' + CS_odChecked
     + ', ' + CS_odFocused + ', ' + CS_odDefault + ', ' + CS_odHotLight + ', ' + CS_odInactive + ', ' + CS_odNoAccel + ', ' + CS_odNoFocusRect
     + ', ' + CS_odReserved1 + ', ' + CS_odReserved2 + ', ' + CS_odComboBoxEdit + ')');
  cl.AddTypeS(CS_TTextLayout, '(' + CS_tlTop + ', ' + CS_tlCenter + ', ' + CS_tlBottom + ')');
  cl.AddTypeS(CS_TOwnerDrawState, CS_set_of + CS_TEOwnerDrawState);
end;


procedure SIRegister_stdctrls(cl: TPSPascalCompiler);
begin
  SIRegister_StdCtrls_TypesAndConsts(cl);
  {$IFNDEF PS_MINIVCL}
  SIRegisterTCUSTOMGROUPBOX(Cl);
  SIRegisterTGROUPBOX(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMLABEL(Cl);
  SIRegisterTLABEL(Cl);
  SIRegisterTCUSTOMEDIT(Cl);
  SIRegisterTEDIT(Cl);
  SIRegisterTCUSTOMMEMO(Cl);
  SIRegisterTMEMO(Cl);
  SIRegisterTCUSTOMCOMBOBOX(Cl);
  SIRegisterTCOMBOBOX(Cl);
  SIRegisterTBUTTONCONTROL(Cl);
  SIRegisterTBUTTON(Cl);
  SIRegisterTCUSTOMCHECKBOX(Cl);
  SIRegisterTCHECKBOX(Cl);
  SIRegisterTRADIOBUTTON(Cl);
  SIRegisterTCUSTOMLISTBOX(Cl);
  SIRegisterTLISTBOX(Cl);
  {$IFNDEF PS_MINIVCL}
  SIRegisterTSCROLLBAR(Cl);
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.





