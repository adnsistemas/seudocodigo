{ Compiletime Controls support }
unit uPSC_controls;
{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;

{
  Will register files from:
    Controls
 
  Register the STD, Classes (at least the types&consts) and Graphics libraries first
 
}

procedure SIRegister_Controls_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTControl(Cl: TPSPascalCompiler);
procedure SIRegisterTWinControl(Cl: TPSPascalCompiler); 
procedure SIRegisterTGraphicControl(cl: TPSPascalCompiler); 
procedure SIRegisterTCustomControl(cl: TPSPascalCompiler); 
procedure SIRegisterTDragObject(cl: TPSPascalCompiler);

procedure SIRegister_Controls(Cl: TPSPascalCompiler);


implementation

uses langdef;

procedure SIRegisterTControl(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TComponent), CS_TCONTROL) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_Create + '(AOwner: ' + CS_TComponent + ')' + CS_iend);
    RegisterMethod(CS_procedure + ' ' + CS_BringToFront + CS_iend);
    RegisterMethod(CS_procedure + ' ' + CS_Hide + CS_iend);
    RegisterMethod(CS_procedure + ' ' + CS_Invalidate + ';' + CS_virtual + CS_iend);
    RegisterMethod(CS_procedure + ' ' + CS_refresh + CS_iend);
    RegisterMethod(CS_procedure + ' ' + CS_Repaint + ';' + CS_virtual + CS_iend);
    RegisterMethod(CS_procedure + ' ' + CS_SendToBack);
    RegisterMethod(CS_procedure + ' ' + CS_Show);
    RegisterMethod(CS_procedure + ' ' + CS_Update + ';' + CS_virtual);
    RegisterMethod(CS_procedure + ' ' + CS_SetBounds + '(x,V,w,h: ' + CS_Integer + ');' + CS_virtual + CS_iend);
    RegisterProperty(CS_Left, CS_Integer, iptRW);
    RegisterProperty(CS_Top, CS_Integer, iptRW);
    RegisterProperty(CS_Width, CS_Integer, iptRW);
    RegisterProperty(CS_Height, CS_Integer, iptRW);
    RegisterProperty(CS_Hint, CS_String, iptRW);
    RegisterProperty(CS_Align, CS_TAlign, iptRW);
    RegisterProperty(CS_ClientHeight, CS_Longint, iptRW);
    RegisterProperty(CS_ClientWidth, CS_Longint, iptRW);
    RegisterProperty(CS_ShowHint, CS_Boolean, iptRW);
    RegisterProperty(CS_Visible, CS_Boolean, iptRW);
    RegisterProperty(CS_ENABLED, CS_BOOLEAN, iptrw);
    RegisterProperty(CS_CURSOR, CS_TCURSOR, iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_function + ' ' + CS_Dragging + ': ' + CS_Boolean);
    RegisterMethod(CS_function + ' ' + CS_HasParent + ': ' + CS_Boolean);
    RegisterMethod(CS_procedure + ' ' + CS_BEGINDRAG + '(IMMEDIATE:' + CS_BOOLEAN + ')');
    RegisterMethod(CS_function + ' ' + CS_CLIENTTOSCREEN + '(POINT:' + CS_TPOINT + '):' + CS_TPOINT);
    RegisterMethod(CS_procedure + ' ' + CS_ENDDRAG + '(DROP:' + CS_BOOLEAN + ')');
    {$IFNDEF CLX}
    RegisterMethod(CS_function + ' ' + CS_GETTEXTBUF + '(BUFFER:' + CS_PCHAR + ';BUFSIZE:' + CS_INTEGER + '):' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_GETTEXTLEN + ':' + CS_INTEGER);
    RegisterMethod(CS_procedure + ' ' + CS_SETTEXTBUF + '(BUFFER:' + CS_PCHAR + ')');
    RegisterMethod(CS_function + ' ' + CS_PERFORM + '(MSG:' + CS_CARDINAL + ';WPARAM,LPARAM:' + CS_LONGINT + '):' + CS_LONGINT);
    {$ENDIF}
    RegisterMethod(CS_function + ' ' + CS_SCREENTOCLIENT + '(POINT:' + CS_TPOINT + '):' + CS_TPOINT);
    {$ENDIF}
  end;
end;

procedure SIRegisterTWinControl(Cl: TPSPascalCompiler); // requires TControl
begin
  with Cl.AddClassN(cl.FindClass(CS_TControl), CS_TWINCONTROL) do
  begin

    with Cl.FindClass(CS_TControl) do
    begin
      RegisterProperty(CS_Parent, CS_TWinControl, iptRW);
    end;

    {$IFNDEF CLX}
    RegisterProperty(CS_Handle, CS_Longint, iptR);
    {$ENDIF}
    RegisterProperty(CS_Showing, CS_Boolean, iptR);
    RegisterProperty(CS_TabOrder, CS_Integer, iptRW);
    RegisterProperty(CS_TabStop, CS_Boolean, iptRW);
    RegisterMethod(CS_function + ' ' + CS_CANFOCUS + ':' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_FOCUSED + ':' + CS_BOOLEAN);
    RegisterProperty(CS_CONTROLS, CS_TCONTROL + ' ' + CS_INTEGER, iptr);
    RegisterProperty(CS_CONTROLCOUNT, CS_INTEGER, iptr);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_function + ' ' + CS_HandleAllocated + ': ' + CS_Boolean);
    RegisterMethod(CS_procedure + ' ' + CS_HandleNeeded);
    RegisterMethod(CS_procedure + ' ' + CS_EnableAlign);
    RegisterMethod(CS_procedure + ' ' + CS_RemoveControl + '(AControl: ' + CS_TControl + ')');
    RegisterMethod(CS_procedure + ' ' + CS_InsertControl + '(AControl: ' + CS_TControl + ')');
    RegisterMethod(CS_procedure + ' ' + CS_Realign);
    RegisterMethod(CS_procedure + ' ' + CS_ScaleBy + '(M, D: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_ScrollBy + '(DeltaX, DeltaY: ' + CS_Integer + ')');
    RegisterMethod(CS_procedure + ' ' + CS_SetFocus + '; ' + CS_virtual);
    {$IFNDEF CLX}
    RegisterMethod(CS_procedure + ' ' + CS_PAINTTO + '(DC:' + CS_Longint + ';X,V:' + CS_INTEGER + ')');
    {$ENDIF}

    RegisterMethod(CS_function + ' ' + CS_CONTAINSCONTROL + '(CONTROL:' + CS_TCONTROL + '):' + CS_BOOLEAN);
    RegisterMethod(CS_procedure + ' ' + CS_DISABLEALIGN);
    RegisterMethod(CS_procedure + ' ' + CS_UPDATECONTROLSTATE);

    RegisterProperty(CS_BRUSH, CS_TBRUSH, iptr);
    RegisterProperty(CS_HELPCONTEXT, CS_LONGINT, iptrw);
    {$ENDIF}
  end;
end;
procedure SIRegisterTGraphicControl(cl: TPSPascalCompiler); // requires TControl
begin
  Cl.AddClassN(cl.FindClass(CS_TControl), CS_TGRAPHICCONTROL);
end;

procedure SIRegisterTCustomControl(cl: TPSPascalCompiler); // requires TWinControl
begin
  Cl.AddClassN(cl.FindClass(CS_TWinControl), CS_TCUSTOMCONTROL);
end;

procedure SIRegister_Controls_TypesAndConsts(Cl: TPSPascalCompiler);
begin
{$IFNDEF FPC}
  Cl.addTypeS(CS_TEShiftState,'(' + CS_ssShift + ', ' + CS_ssAlt + ', ' + CS_ssCtrl + ', ' + CS_ssLeft + ', ' + CS_ssRight + ', ' + CS_ssMiddle + ', ' + CS_ssDouble + ')');
  {$ELSE}
  Cl.addTypeS(CS_TEShiftState,'(' + CS_ssShift + ', ' + CS_ssAlt + ', ' + CS_ssCtrl + ', ' + CS_ssLeft + ', ' + CS_ssRight + ', ' + CS_ssMiddle + ', ' + CS_ssDouble
   + ', ' + CS_ssMeta + ', ' + CS_ssSuper + ', ' + CS_ssHyper + ', ' + CS_ssAltGr + ', ' + CS_ssCaps + ', ' + CS_ssNum + ', ' + CS_ssScroll + ', ' + CS_ssTriple + ', ' + CS_ssQuad + ')');
  {$ENDIF}
  Cl.addTypeS(CS_TShiftState,CS_set_of + CS_TEShiftState);
  cl.AddTypeS(CS_TMouseButton, '(' + CS_mbLeft + ', ' + CS_mbRight + ', ' + CS_mbMiddle + ')');
  cl.AddTypeS(CS_TDragMode, '(' + CS_dmManual + ', ' + CS_dmAutomatic + ')');
  cl.AddTypeS(CS_TDragState, '(' + CS_dsDragEnter + ', ' + CS_dsDragLeave + ', ' + CS_dsDragMove + ')');
  cl.AddTypeS(CS_TDragKind, '(' + CS_dkDrag + ', ' + CS_dkDock + ')');
  cl.AddTypeS(CS_TMouseEvent, CS_procedure + '(Sender: ' + CS_TObject + '; Button: ' + CS_TMouseButton + '; Shift: ' + CS_TShiftState + '; X, V: ' + CS_Integer + ')');
  cl.AddTypeS(CS_TMouseMoveEvent, CS_procedure + '(Sender: ' + CS_TObject + '; Shift: ' + CS_TShiftState + '; X, V: ' + CS_Integer + ')');
  cl.AddTypeS(CS_TKeyEvent, CS_procedure + '(Sender: ' + CS_TObject + '; ' + CS_var + ' Key: ' + CS_Word + '; Shift: ' + CS_TShiftState + ')');
  cl.AddTypeS(CS_TKeyPressEvent, CS_procedure + '(Sender: ' + CS_TObject + '; ' + CS_var + ' Key: ' + CS_Char + ')');
  cl.AddTypeS(CS_TDragOverEvent, CS_procedure + '(Sender, Source: ' + CS_TObject + '; X, V: ' + CS_Integer + '; State: ' + CS_TDragState + '; ' + CS_var + ' Accept: ' + CS_Boolean + ')');
  cl.AddTypeS(CS_TDragDropEvent, CS_procedure + '(Sender, Source: ' + CS_TObject + ';X, V: ' + CS_Integer + ')');
  cl.AddTypeS(CS_HWND, CS_Longint);

  cl.AddTypeS(CS_TEndDragEvent, CS_procedure + '(Sender, Target: ' + CS_TObject + '; X, V: ' + CS_Integer + ')');

  cl.addTypeS(CS_TAlign, '(' + CS_alNone + ', ' + CS_alTop + ', ' + CS_alBottom + ', ' + CS_alLeft + ', ' + CS_alRight + ', ' + CS_alClient + ')');

  cl.addTypeS(CS_TAnchorKind, '(' + CS_akTop + ', ' + CS_akLeft + ', ' + CS_akRight + ', ' + CS_akBottom + ')');
  cl.addTypeS(CS_TAnchors,CS_set_of + CS_TAnchorKind);
  cl.AddTypeS(CS_TModalResult, CS_Integer);
  cl.AddTypeS(CS_TCursor, CS_Integer);
  cl.AddTypeS(CS_TPoint, CS_record + ' ' + CS_Longint + ' x,V'+ CS_iend + CS_end);

  cl.AddConstantN(CS_mrNone, CS_Integer).Value.ts32 := 0;
  cl.AddConstantN(CS_mrOk, CS_Integer).Value.ts32 := 1;
  cl.AddConstantN(CS_mrCancel, CS_Integer).Value.ts32 := 2;
  cl.AddConstantN(CS_mrAbort, CS_Integer).Value.ts32 := 3;
  cl.AddConstantN(CS_mrRetry, CS_Integer).Value.ts32 := 4;
  cl.AddConstantN(CS_mrIgnore, CS_Integer).Value.ts32 := 5;
  cl.AddConstantN(CS_mrYes, CS_Integer).Value.ts32 := 6;
  cl.AddConstantN(CS_mrNo, CS_Integer).Value.ts32 := 7;
  cl.AddConstantN(CS_mrAll, CS_Integer).Value.ts32 := 8;
  cl.AddConstantN(CS_mrNoToAll, CS_Integer).Value.ts32 := 9;
  cl.AddConstantN(CS_mrYesToAll, CS_Integer).Value.ts32 := 10;
  cl.AddConstantN(CS_crDefault, CS_Integer).Value.ts32 := 0;
  cl.AddConstantN(CS_crNone, CS_Integer).Value.ts32 := -1;
  cl.AddConstantN(CS_crArrow, CS_Integer).Value.ts32 := -2;
  cl.AddConstantN(CS_crCross, CS_Integer).Value.ts32 := -3;
  cl.AddConstantN(CS_crIBeam, CS_Integer).Value.ts32 := -4;
  cl.AddConstantN(CS_crSizeNESW, CS_Integer).Value.ts32 := -6;
  cl.AddConstantN(CS_crSizeNS, CS_Integer).Value.ts32 := -7;
  cl.AddConstantN(CS_crSizeNWSE, CS_Integer).Value.ts32 := -8;
  cl.AddConstantN(CS_crSizeWE, CS_Integer).Value.ts32 := -9;
  cl.AddConstantN(CS_crUpArrow, CS_Integer).Value.ts32 := -10;
  cl.AddConstantN(CS_crHourGlass, CS_Integer).Value.ts32 := -11;
  cl.AddConstantN(CS_crDrag, CS_Integer).Value.ts32 := -12;
  cl.AddConstantN(CS_crNoDrop, CS_Integer).Value.ts32 := -13;
  cl.AddConstantN(CS_crHSplit, CS_Integer).Value.ts32 := -14;
  cl.AddConstantN(CS_crVSplit, CS_Integer).Value.ts32 := -15;
  cl.AddConstantN(CS_crMultiDrag, CS_Integer).Value.ts32 := -16;
  cl.AddConstantN(CS_crSQLWait, CS_Integer).Value.ts32 := -17;
  cl.AddConstantN(CS_crNo, CS_Integer).Value.ts32 := -18;
  cl.AddConstantN(CS_crAppStart, CS_Integer).Value.ts32 := -19;
  cl.AddConstantN(CS_crHelp, CS_Integer).Value.ts32 := -20;
{$IFDEF DELPHI3UP}
  cl.AddConstantN(CS_crHandPoint, CS_Integer).Value.ts32 := -21;
{$ENDIF}
{$IFDEF DELPHI4UP}
  cl.AddConstantN(CS_crSizeAll, CS_Integer).Value.ts32 := -22;
{$ENDIF}
end;

procedure SIRegisterTDragObject(cl: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass(CS_TObject),CS_TDragObject) do
  begin
{$IFNDEF PS_MINIVCL}
{$IFDEF DELPHI4UP}
    RegisterMethod(CS_procedure + ' ' + CS_Assign + '( Source : ' + CS_TDragObject + ')');
{$ENDIF}
{$IFNDEF FPC}
    RegisterMethod(CS_function + ' ' + CS_GetName + ' : ' + CS_String);
    RegisterMethod(CS_function + ' ' + CS_Instance + ': ' + CS_Longint);
{$ENDIF}
    RegisterMethod(CS_procedure + ' ' + CS_HideDragImage);
    RegisterMethod(CS_procedure + ' ' + CS_ShowDragImage);
{$IFDEF DELPHI4UP}
    RegisterProperty(CS_Cancelling, CS_Boolean, iptrw);
    RegisterProperty(CS_DragHandle, CS_Longint, iptrw);
    RegisterProperty(CS_DragPos, CS_TPoint, iptrw);
    RegisterProperty(CS_DragTargetPos, CS_TPoint, iptrw);
    RegisterProperty(CS_MouseDeltaX, CS_Double, iptr);
    RegisterProperty(CS_MouseDeltaY, CS_Double, iptr);
{$ENDIF}
{$ENDIF}
  end;
  Cl.AddTypeS(CS_TStartDragEvent, CS_procedure + '(Sender: ' + CS_TObject + '; ' + CS_var + ' DragObject: ' + CS_TDragObject + ')');
end;

procedure SIRegister_Controls(Cl: TPSPascalCompiler);
begin
  SIRegister_Controls_TypesAndConsts(cl);
  SIRegisterTDragObject(cl);
  SIRegisterTControl(Cl);
  SIRegisterTWinControl(Cl);
  SIRegisterTGraphicControl(cl);
  SIRegisterTCustomControl(cl);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.
