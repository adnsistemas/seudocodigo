
unit uPSR_controls;

{$I PascalScript.inc}
interface
uses
  uPSRuntime, uPSUtils;




procedure RIRegisterTControl(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTWinControl(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTGraphicControl(cl: TPSRuntimeClassImporter);
procedure RIRegisterTCustomControl(cl: TPSRuntimeClassImporter);
procedure RIRegister_TDragObject(CL: TPSRuntimeClassImporter);

procedure RIRegister_Controls(Cl: TPSRuntimeClassImporter);

implementation
uses langdef
{$IFNDEF FPC}
  ,Classes{$IFDEF CLX}, QControls, QGraphics{$ELSE}, Controls, Graphics, Windows{$ENDIF};
{$ELSE}
  ,Classes, Controls, Graphics;
{$ENDIF}

procedure TControlAlignR(Self: TControl; var T: Byte); begin T := Byte(Self.Align); end;
procedure TControlAlignW(Self: TControl; T: Byte); begin Self.Align:= TAlign(T); end;

procedure TControlClientHeightR(Self: TControl; var T: Longint); begin T := Self.ClientHeight; end;
procedure TControlClientHeightW(Self: TControl; T: Longint); begin Self.ClientHeight := T; end;

procedure TControlClientWidthR(Self: TControl; var T: Longint); begin T := Self.ClientWidth; end;
procedure TControlClientWidthW(Self: TControl; T: Longint); begin Self.ClientWidth:= T; end;

procedure TControlShowHintR(Self: TControl; var T: Boolean); begin T := Self.ShowHint; end;
procedure TControlShowHintW(Self: TControl; T: Boolean); begin Self.ShowHint:= T; end;

procedure TControlVisibleR(Self: TControl; var T: Boolean); begin T := Self.Visible; end;
procedure TControlVisibleW(Self: TControl; T: Boolean); begin Self.Visible:= T; end;

procedure TControlParentR(Self: TControl; var T: TWinControl); begin T := Self.Parent; end;
procedure TControlParentW(Self: TControl; T: TWinControl); begin Self.Parent:= T; end;


procedure TCONTROLSHOWHINT_W(Self: TCONTROL; T: BOOLEAN); begin Self.SHOWHINT := T; end;
procedure TCONTROLSHOWHINT_R(Self: TCONTROL; var T: BOOLEAN); begin T := Self.SHOWHINT; end;
procedure TCONTROLENABLED_W(Self: TCONTROL; T: BOOLEAN); begin Self.ENABLED := T; end;
procedure TCONTROLENABLED_R(Self: TCONTROL; var T: BOOLEAN); begin T := Self.ENABLED; end;

procedure RIRegisterTControl(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TControl) do
  begin
    RegisterVirtualConstructor(@TControl.Create, CS_CREATE);
    RegisterMethod(@TControl.BRingToFront, CS_BRINGTOFRONT);
    RegisterMethod(@TControl.Hide, CS_HIDE);
    RegisterVirtualMethod(@TControl.Invalidate, CS_INVALIDATE);
    RegisterMethod(@TControl.Refresh, CS_REFRESH);
    RegisterVirtualMethod(@TControl.Repaint, CS_REPAINT);
    RegisterMethod(@TControl.SendToBack, CS_SENDTOBACK);
    RegisterMethod(@TControl.Show, CS_SHOW);
    RegisterVirtualMethod(@TControl.Update, CS_UPDATE);
    RegisterVirtualMethod(@TControl.SetBounds, CS_SETBOUNDS);

    RegisterPropertyHelper(@TControlShowHintR, @TControlShowHintW, CS_SHOWHINT);
    RegisterPropertyHelper(@TControlAlignR, @TControlAlignW, CS_ALIGN);
    RegisterPropertyHelper(@TControlClientHeightR, @TControlClientHeightW, CS_CLIENTHEIGHT);
    RegisterPropertyHelper(@TControlClientWidthR, @TControlClientWidthW, CS_CLIENTWIDTH);
    RegisterPropertyHelper(@TControlVisibleR, @TControlVisibleW, CS_VISIBLE);
    RegisterPropertyHelper(@TCONTROLENABLED_R, @TCONTROLENABLED_W, CS_ENABLED);

    RegisterPropertyHelper(@TControlParentR, @TControlParentW, CS_PARENT);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TControl.Dragging, CS_DRAGGING);
    RegisterMethod(@TControl.HasParent, CS_HASPARENT);
    RegisterMethod(@TCONTROL.CLIENTTOSCREEN, CS_CLIENTTOSCREEN);
    RegisterMethod(@TCONTROL.DRAGGING, CS_DRAGGING);
   {$IFNDEF FPC} 
    RegisterMethod(@TCONTROL.BEGINDRAG, CS_BEGINDRAG);
    RegisterMethod(@TCONTROL.ENDDRAG, CS_ENDDRAG);
   {$ENDIF}
    {$IFNDEF CLX}
    RegisterMethod(@TCONTROL.GETTEXTBUF, CS_GETTEXTBUF);
    RegisterMethod(@TCONTROL.GETTEXTLEN, CS_GETTEXTLEN);
    RegisterMethod(@TCONTROL.PERFORM, CS_PERFORM);
    RegisterMethod(@TCONTROL.SETTEXTBUF, CS_SETTEXTBUF);
    {$ENDIF}
    RegisterMethod(@TCONTROL.SCREENTOCLIENT, CS_SCREENTOCLIENT);
    {$ENDIF}
  end;
end;
{$IFNDEF CLX}
procedure TWinControlHandleR(Self: TWinControl; var T: Longint); begin T := Self.Handle; end;
{$ENDIF}
procedure TWinControlShowingR(Self: TWinControl; var T: Boolean); begin T := Self.Showing; end;


procedure TWinControlTabOrderR(Self: TWinControl; var T: Longint); begin T := Self.TabOrder; end;
procedure TWinControlTabOrderW(Self: TWinControl; T: Longint); begin Self.TabOrder:= T; end;

procedure TWinControlTabStopR(Self: TWinControl; var T: Boolean); begin T := Self.TabStop; end;
procedure TWinControlTabStopW(Self: TWinControl; T: Boolean); begin Self.TabStop:= T; end;
procedure TWINCONTROLBRUSH_R(Self: TWINCONTROL; var T: TBRUSH); begin T := Self.BRUSH; end;
procedure TWINCONTROLCONTROLS_R(Self: TWINCONTROL; var T: TCONTROL; t1: INTEGER); begin t := Self.CONTROLS[t1]; end;
procedure TWINCONTROLCONTROLCOUNT_R(Self: TWINCONTROL; var T: INTEGER); begin t := Self.CONTROLCOUNT; end;

procedure RIRegisterTWinControl(Cl: TPSRuntimeClassImporter); // requires TControl
begin
  with Cl.Add(TWinControl) do
  begin
    {$IFNDEF CLX}
    RegisterPropertyHelper(@TWinControlHandleR, nil, CS_HANDLE);
    {$ENDIF}
    RegisterPropertyHelper(@TWinControlShowingR, nil, CS_SHOWING);
    RegisterPropertyHelper(@TWinControlTabOrderR, @TWinControlTabOrderW, CS_TABORDER);
    RegisterPropertyHelper(@TWinControlTabStopR, @TWinControlTabStopW, CS_TABSTOP);
    RegisterMethod(@TWINCONTROL.CANFOCUS, CS_CANFOCUS);
    RegisterMethod(@TWINCONTROL.FOCUSED, CS_FOCUSED);
    RegisterPropertyHelper(@TWINCONTROLCONTROLS_R, nil, CS_CONTROLS);
    RegisterPropertyHelper(@TWINCONTROLCONTROLCOUNT_R, nil, CS_CONTROLCOUNT);
    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TWinControl.HandleAllocated, CS_HANDLEALLOCATED);
    RegisterMethod(@TWinControl.HandleNeeded, CS_HANDLENEEDED);
    RegisterMethod(@TWinControl.EnableAlign, CS_ENABLEALIGN);
		RegisterMethod(@TWinControl.RemoveControl, CS_REMOVECONTROL);
		{$IFNDEF FPC}
		RegisterMethod(@TWinControl.InsertControl, CS_INSERTCONTROL);
		RegisterMethod(@TWinControl.ScaleBy, CS_SCALEBY);
		RegisterMethod(@TWinControl.ScrollBy, CS_SCROLLBY);
		{$IFNDEF CLX}
		 RegisterMethod(@TWINCONTROL.PAINTTO, CS_PAINTTO);
		{$ENDIF}
		{$ENDIF}{FPC}
		RegisterMethod(@TWinControl.Realign, CS_REALIGN);
		RegisterVirtualMethod(@TWinControl.SetFocus, CS_SETFOCUS);
		RegisterMethod(@TWINCONTROL.CONTAINSCONTROL, CS_CONTAINSCONTROL);
		RegisterMethod(@TWINCONTROL.DISABLEALIGN, CS_DISABLEALIGN);
		RegisterMethod(@TWINCONTROL.UPDATECONTROLSTATE, CS_UPDATECONTROLSTATE);
    RegisterPropertyHelper(@TWINCONTROLBRUSH_R, nil, CS_BRUSH);
    {$ENDIF}
  end;
end;

procedure RIRegisterTGraphicControl(cl: TPSRuntimeClassImporter); // requires TControl
begin
  Cl.Add(TGraphicControl);
end;
procedure RIRegisterTCustomControl(cl: TPSRuntimeClassImporter); // requires TControl
begin
  Cl.Add(TCustomControl);
end;

{$IFDEF DELPHI4UP}
(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TDragObjectMouseDeltaY_R(Self: TDragObject; var T: Double);
begin T := Self.MouseDeltaY; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectMouseDeltaX_R(Self: TDragObject; var T: Double);
begin T := Self.MouseDeltaX; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragTarget_W(Self: TDragObject; const T: Pointer);
begin Self.DragTarget := T; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragTarget_R(Self: TDragObject; var T: Pointer);
begin T := Self.DragTarget; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragTargetPos_W(Self: TDragObject; const T: TPoint);
begin Self.DragTargetPos := T; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragTargetPos_R(Self: TDragObject; var T: TPoint);
begin T := Self.DragTargetPos; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragPos_W(Self: TDragObject; const T: TPoint);
begin Self.DragPos := T; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragPos_R(Self: TDragObject; var T: TPoint);
begin T := Self.DragPos; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragHandle_W(Self: TDragObject; const T: HWND);
begin Self.DragHandle := T; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectDragHandle_R(Self: TDragObject; var T: HWND);
begin T := Self.DragHandle; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectCancelling_W(Self: TDragObject; const T: Boolean);
begin Self.Cancelling := T; end;

(*----------------------------------------------------------------------------*)
procedure TDragObjectCancelling_R(Self: TDragObject; var T: Boolean);
begin T := Self.Cancelling; end;
{$ENDIF}
(*----------------------------------------------------------------------------*)
procedure RIRegister_TDragObject(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDragObject) do
  begin
{$IFNDEF PS_MINIVCL}
{$IFDEF DELPHI4UP}
    RegisterVirtualMethod(@TDragObject.Assign, CS_Assign);
{$ENDIF}
{$IFNDEF FPC}
    RegisterVirtualMethod(@TDragObject.GetName, CS_GetName);
    RegisterVirtualMethod(@TDragObject.Instance, CS_Instance);
{$ENDIF}    
    RegisterVirtualMethod(@TDragObject.HideDragImage, CS_HideDragImage);
    RegisterVirtualMethod(@TDragObject.ShowDragImage, CS_ShowDragImage);
{$IFDEF DELPHI4UP}
    RegisterPropertyHelper(@TDragObjectCancelling_R,@TDragObjectCancelling_W,CS_Cancelling);
    RegisterPropertyHelper(@TDragObjectDragHandle_R,@TDragObjectDragHandle_W,CS_DragHandle);
    RegisterPropertyHelper(@TDragObjectDragPos_R,@TDragObjectDragPos_W,CS_DragPos);
    RegisterPropertyHelper(@TDragObjectDragTargetPos_R,@TDragObjectDragTargetPos_W,CS_DragTargetPos);
    RegisterPropertyHelper(@TDragObjectDragTarget_R,@TDragObjectDragTarget_W,CS_DragTarget);
    RegisterPropertyHelper(@TDragObjectMouseDeltaX_R,nil,CS_MouseDeltaX);
    RegisterPropertyHelper(@TDragObjectMouseDeltaY_R,nil,CS_MouseDeltaY);
{$ENDIF}
{$ENDIF}
  end;
end;


procedure RIRegister_Controls(Cl: TPSRuntimeClassImporter);
begin
  RIRegisterTControl(Cl);
  RIRegisterTWinControl(Cl);
  RIRegisterTGraphicControl(cl);
  RIRegisterTCustomControl(cl);
  RIRegister_TDragObject(cl);

end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.
