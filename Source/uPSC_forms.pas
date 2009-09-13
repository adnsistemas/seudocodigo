{ Compiletime Forms support }
unit uPSC_forms;
{$I PascalScript.inc}

interface
uses
  uPSCompiler, uPSUtils;

procedure SIRegister_Forms_TypesAndConsts(Cl: TPSPascalCompiler);


procedure SIRegisterTCONTROLSCROLLBAR(Cl: TPSPascalCompiler);
procedure SIRegisterTSCROLLINGWINCONTROL(Cl: TPSPascalCompiler);
procedure SIRegisterTSCROLLBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTFORM(Cl: TPSPascalCompiler);
procedure SIRegisterTAPPLICATION(Cl: TPSPascalCompiler);

procedure SIRegister_Forms(Cl: TPSPascalCompiler);

implementation

uses sysutils, langdef;

procedure SIRegisterTCONTROLSCROLLBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TPERSISTENT)), Uppercase(CS_TCONTROLSCROLLBAR)) do
  begin
    RegisterProperty(Uppercase(CS_KIND), Uppercase(CS_TSCROLLBARKIND), iptr);
    RegisterProperty(Uppercase(CS_SCROLLPOS), Uppercase(CS_INTEGER), iptr);
    RegisterProperty(Uppercase(CS_MARGIN), Uppercase(CS_WORD), iptrw);
    RegisterProperty(Uppercase(CS_INCREMENT), Uppercase(CS_TSCROLLBARINC), iptrw);
    RegisterProperty(Uppercase(CS_RANGE), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_POSITION), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_TRACKING), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_VISIBLE), Uppercase(CS_BOOLEAN), iptrw);
  end;
end;

procedure SIRegisterTSCROLLINGWINCONTROL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TWINCONTROL)), Uppercase(CS_TSCROLLINGWINCONTROL)) do
  begin
    RegisterMethod(CS_procedure + ' ' +  CS_SCROLLINVIEW + '(ACONTROL:' + CS_TCONTROL + ')');
    RegisterProperty(Uppercase(CS_HORZSCROLLBAR), Uppercase(CS_TCONTROLSCROLLBAR), iptrw);
    RegisterProperty(Uppercase(CS_VERTSCROLLBAR), Uppercase(CS_TCONTROLSCROLLBAR), iptrw);
  end;
end;

procedure SIRegisterTSCROLLBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TSCROLLINGWINCONTROL)), Uppercase(CS_TSCROLLBOX)) do
  begin
    RegisterProperty(Uppercase(CS_BORDERSTYLE), Uppercase(CS_TBORDERSTYLE), iptrw);
    RegisterProperty(Uppercase(CS_COLOR), Uppercase(CS_TCOLOR), iptrw);
    RegisterProperty(Uppercase(CS_FONT), Uppercase(CS_TFONT), iptrw);
    RegisterProperty(Uppercase(CS_AUTOSCROLL), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_PARENTCOLOR), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_PARENTFONT), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDBLCLICK), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONENTER), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONEXIT), Uppercase(CS_TNOTIFYEVENT), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterProperty(Uppercase(CS_ONRESIZE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_DRAGCURSOR), Uppercase(CS_TCURSOR), iptrw);
    RegisterProperty(Uppercase(CS_DRAGMODE), Uppercase(CS_TDRAGMODE), iptrw);
    RegisterProperty(Uppercase(CS_PARENTSHOWHINT), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPOPUPMENU), iptrw);
    RegisterProperty(Uppercase(CS_CTL3D), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_PARENTCTL3D), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), Uppercase(CS_TDRAGDROPEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), Uppercase(CS_TDRAGOVEREVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONENDDRAG), Uppercase(CS_TENDDRAGEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), Uppercase(CS_TMOUSEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), Uppercase(CS_TMOUSEMOVEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), Uppercase(CS_TMOUSEEVENT), iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTFORM(Cl: TPSPascalCompiler);
begin
 with Cl.AddClassN(cl.FindClass(Uppercase(CS_TSCROLLINGWINCONTROL)), Uppercase(CS_TFORM)) do
  begin
    {$IFDEF DELPHI4UP}
    RegisterMethod(CS_constructor + ' ' + CS_CREATENEW + '(AOWNER:' + CS_TCOMPONENT + '; Dummy: ' + CS_Integer + ')');
    {$ELSE}
    RegisterMethod(CS_constructor + ' ' + CS_CREATENEW + '(AOWNER:' + CS_TCOMPONENT + ')');
    {$ENDIF}
    RegisterMethod(CS_procedure + ' ' + CS_CLOSE);
    RegisterMethod(CS_procedure + ' ' + CS_HIDE);
    RegisterMethod(CS_procedure + ' ' + CS_SHOW);
    RegisterMethod(CS_function + ' ' + CS_SHOWMODAL + ':' + CS_INTEGER);
    RegisterMethod(CS_procedure + ' ' + CS_RELEASE);
    RegisterProperty(Uppercase(CS_ACTIVE), Uppercase(CS_Boolean), iptr);
    RegisterProperty(Uppercase(CS_ACTIVECONTROL), Uppercase(CS_TWINCONTROL), iptrw);
    RegisterProperty(Uppercase(CS_BORDERICONS), Uppercase(CS_TBorderIcons), iptrw);
    RegisterProperty(Uppercase(CS_BORDERSTYLE), Uppercase(CS_TFORMBORDERSTYLE), iptrw);
    RegisterProperty(Uppercase(CS_CAPTION), Uppercase(CS_NativeString), iptrw);
    RegisterProperty(Uppercase(CS_AUTOSCROLL), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_COLOR), Uppercase(CS_TCOLOR), iptrw);
    RegisterProperty(Uppercase(CS_FONT), Uppercase(CS_TFONT), iptrw);
    RegisterProperty(Uppercase(CS_FORMSTYLE), Uppercase(CS_TFORMSTYLE), iptrw);
    RegisterProperty(Uppercase(CS_KEYPREVIEW), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_POSITION), Uppercase(CS_TPOSITION), iptrw);
    RegisterProperty(Uppercase(CS_ONACTIVATE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDBLCLICK), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONCLOSE), Uppercase(CS_TCLOSEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONCLOSEQUERY), Uppercase(CS_TCLOSEQUERYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONCREATE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDESTROY), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDEACTIVATE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONHIDE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONKEYDOWN), Uppercase(CS_TKEYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONKEYPRESS), Uppercase(CS_TKEYPRESSEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONKEYUP), Uppercase(CS_TKEYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONRESIZE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONSHOW), Uppercase(CS_TNOTIFYEVENT), iptrw);


    {$IFNDEF PS_MINIVCL}
    {$IFNDEF CLX}
    RegisterMethod(CS_procedure + ' ' + CS_ARRANGEICONS);
//    RegisterMethod('funcion GETFORMIMAGE:TBITMAP');
    RegisterMethod(CS_procedure + ' ' + CS_PRINT);
    RegisterMethod(CS_procedure + ' ' + CS_SENDCANCELMODE + '(SENDER:' + CS_TCONTROL + ')');
    RegisterProperty(Uppercase(CS_ACTIVEOLECONTROL), Uppercase(CS_TWINCONTROL), iptrw);
    RegisterProperty(Uppercase(CS_OLEFORMOBJECT), Uppercase(CS_TOLEFORMOBJECT), iptrw);
    RegisterProperty(Uppercase(CS_CLIENTHANDLE), Uppercase(CS_LONGINT), iptr);
    RegisterProperty(Uppercase(CS_TILEMODE), Uppercase(CS_TTILEMODE), iptrw);
    {$ENDIF}
    RegisterMethod(CS_procedure + ' ' + CS_CASCADE);
    RegisterMethod(CS_function + ' ' + CS_CLOSEQUERY + ':' + CS_BOOLEAN);
    RegisterMethod(CS_procedure + ' ' + CS_DEFOCUSCONTROL + '(CONTROL:' + CS_TWINCONTROL + ';REMOVING:' + CS_BOOLEAN + ')');
    RegisterMethod(CS_procedure + ' ' + CS_FOCUSCONTROL + '(CONTROL:' + CS_TWINCONTROL + ')');
    RegisterMethod(CS_procedure + ' ' + CS_NEXT);
    RegisterMethod(CS_procedure + ' ' + CS_PREVIOUS);
    RegisterMethod(CS_function  + ' ' + CS_SETFOCUSEDCONTROL + '(CONTROL:' + CS_TWINCONTROL + '):' + CS_BOOLEAN);
    RegisterMethod(CS_procedure + ' ' + CS_TILE);
    RegisterProperty(Uppercase(CS_ACTIVEMDICHILD), Uppercase(CS_TFORM), iptr);
    RegisterProperty(Uppercase(CS_CANVAS), Uppercase(CS_TCANVAS), iptr);
    RegisterProperty(Uppercase(CS_DROPTARGET), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_MODALRESULT), Uppercase(CS_Longint), iptrw);
    RegisterProperty(Uppercase(CS_MDICHILDCOUNT), Uppercase(CS_INTEGER), iptr);
    RegisterProperty(Uppercase(CS_MDICHILDREN), Uppercase(CS_TFORM + ' ' + CS_INTEGER), iptr);
    RegisterProperty(Uppercase(CS_ICON), Uppercase(CS_TICON), iptrw);
    RegisterProperty(Uppercase(CS_MENU), Uppercase(CS_TMAINMENU), iptrw);
    RegisterProperty(Uppercase(CS_OBJECTMENUITEM), Uppercase(CS_TMENUITEM), iptrw);
    RegisterProperty(Uppercase(CS_PIXELSPERINCH), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_PRINTSCALE), Uppercase(CS_TPRINTSCALE), iptrw);
    RegisterProperty(Uppercase(CS_SCALED), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_WINDOWSTATE), Uppercase(CS_TWINDOWSTATE), iptrw);
    RegisterProperty(Uppercase(CS_WINDOWMENU), Uppercase(CS_TMENUITEM), iptrw);
    RegisterProperty(Uppercase(CS_CTL3D), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPOPUPMENU), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGDROP), Uppercase(CS_TDRAGDROPEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDRAGOVER), Uppercase(CS_TDRAGOVEREVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEDOWN), Uppercase(CS_TMOUSEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEMOVE), Uppercase(CS_TMOUSEMOVEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMOUSEUP), Uppercase(CS_TMOUSEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONPAINT), Uppercase(CS_TNOTIFYEVENT), iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegisterTAPPLICATION(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(Uppercase(CS_TCOMPONENT)), Uppercase(CS_TAPPLICATION)) do
  begin
    RegisterMethod(CS_procedure + ' ' + CS_BRINGTOFRONT);
    RegisterMethod(CS_function + ' ' + CS_MESSAGEBOX + '(TEXT,CAPTION:' + CS_PCHAR + ';FLAGS:' + CS_WORD + '):' + CS_INTEGER);
    RegisterMethod(CS_procedure + ' ' + CS_MINIMIZE);
    RegisterMethod(CS_procedure + ' ' + CS_PROCESSMESSAGES);
    RegisterMethod(CS_procedure + ' ' + CS_RESTORE);
    RegisterMethod(CS_procedure + ' ' + CS_TERMINATE);
    RegisterProperty(Uppercase(CS_ACTIVE), Uppercase(CS_Boolean), iptr);
    RegisterProperty(Uppercase(CS_EXENAME), Uppercase(CS_NativeString), iptr);
    {$IFNDEF CLX}
    RegisterProperty(Uppercase(CS_HANDLE), Uppercase(CS_LONGINT), iptrw);
    RegisterProperty(Uppercase(CS_UPDATEFORMATSETTINGS), Uppercase(CS_Boolean), iptrw);
    {$ENDIF}
    RegisterProperty(Uppercase(CS_HINT), Uppercase(CS_NativeString), iptrw);
    RegisterProperty(Uppercase(CS_MAINFORM), Uppercase(CS_TFORM), iptr);
    RegisterProperty(Uppercase(CS_SHOWHINT), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_SHOWMAINFORM), Uppercase(CS_Boolean), iptrw);
    RegisterProperty(Uppercase(CS_TERMINATED), Uppercase(CS_Boolean), iptr);
    RegisterProperty(Uppercase(CS_TITLE), Uppercase(CS_NativeString), iptrw);
    RegisterProperty(Uppercase(CS_ONACTIVATE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONDEACTIVATE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONIDLE), Uppercase(CS_TIDLEEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONHINT), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMINIMIZE), Uppercase(CS_TNOTIFYEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONRESTORE), Uppercase(CS_TNOTIFYEVENT), iptrw);

    {$IFNDEF PS_MINIVCL}
    RegisterMethod(CS_procedure + ' ' + CS_CONTROLDESTROYED + '(CONTROL:' + CS_TCONTROL + ')');
    RegisterMethod(CS_procedure + ' ' + CS_CANCELHINT);
    RegisterMethod(CS_procedure + ' ' + CS_HANDLEEXCEPTION + '(SENDER:' + CS_TOBJECT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_HANDLEMESSAGE);
    RegisterMethod(CS_procedure + ' ' + CS_HIDEHINT);
//    RegisterMethod('procedimiento HINTMOUSEMESSAGE(CONTROL:TCONTROL;porRef MESSAGE:TMESSAGE)');
    RegisterMethod(CS_procedure + ' ' + CS_INITIALIZE);
    RegisterMethod(CS_procedure + ' ' + CS_NORMALIZETOPMOSTS);
    RegisterMethod(CS_procedure + ' ' + CS_RESTORETOPMOSTS);
    RegisterMethod(CS_procedure + ' ' + CS_RUN);
//    RegisterMethod('procedimiento SHOWEXCEPTION(E:EXCEPTION)');
    {$IFNDEF CLX}
    RegisterMethod(CS_function + ' ' + CS_HELPCOMMAND + '(COMMAND:' + CS_INTEGER + ';DATA:' + CS_LONGINT + '):' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_HELPCONTEXT + '(CONTEXT:' + CS_THELPCONTEXT + '):' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_HELPJUMP + '(JUMPID:' + CS_NativeString + '):' + CS_BOOLEAN);
    RegisterProperty(Uppercase(CS_DIALOGHANDLE), Uppercase(CS_LONGINT), iptrw);
    RegisterMethod(CS_procedure + ' ' + CS_CREATEHANDLE);
//    RegisterMethod('procedimiento HOOKMAINWINDOW(HOOK:TWINDOWHOOK)');
//    RegisterMethod('procedimiento UNHOOKMAINWINDOW(HOOK:TWINDOWHOOK)');
    {$ENDIF}
    RegisterProperty(Uppercase(CS_HELPFILE), Uppercase(CS_NativeString), iptrw);
    RegisterProperty(Uppercase(CS_HINTCOLOR), Uppercase(CS_TCOLOR), iptrw);
    RegisterProperty(Uppercase(CS_HINTPAUSE), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_HINTSHORTPAUSE), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_HINTHIDEPAUSE), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_ICON), Uppercase(CS_TICON), iptrw);
    RegisterProperty(Uppercase(CS_ONHELP), Uppercase(CS_THELPEVENT), iptrw);
    {$ENDIF}
  end;
end;

procedure SIRegister_Forms_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS(Uppercase(CS_TIdleEvent), CS_procedure + '(Sender: ' + CS_TObject + '; ' + CS_var + ' Done: ' + CS_Boolean + ')');
  cl.AddTypeS(Uppercase(CS_TScrollBarKind), '(' + CS_sbHorizontal + ', ' + CS_sbVertical + ')');
  cl.AddTypeS(Uppercase(CS_TScrollBarInc), Uppercase(CS_SmallInt));
  cl.AddTypeS(Uppercase(CS_TFormBorderStyle), '(' + CS_bsNone + ', ' + CS_bsSingle + ', ' + CS_bsSizeable + ', ' + CS_bsDialog + ', ' + CS_bsToolWindow + ', ' + CS_bsSizeToolWin + ')');
  cl.AddTypeS(Uppercase(CS_TBorderStyle), Uppercase(CS_TFormBorderStyle));
  cl.AddTypeS(Uppercase(CS_TWindowState), '(' + CS_wsNormal + ', ' + CS_wsMinimized + ', ' + CS_wsMaximized + ')');
  cl.AddTypeS(Uppercase(CS_TFormStyle), '(' + CS_fsNormal + ', ' + CS_fsMDIChild + ', ' + CS_fsMDIForm + ', ' + CS_fsStayOnTop + ')');
  cl.AddTypeS(Uppercase(CS_TPosition), '(' + CS_poDesigned + ', ' + CS_poDefault + ', ' + CS_poDefaultPosOnly + ', ' + CS_poDefaultSizeOnly + ', ' + CS_poScreenCenter + ', ' + CS_poDesktopCenter + ', ' + CS_poMainFormCenter + ', ' + CS_poOwnerFormCenter + ')');
  cl.AddTypeS(Uppercase(CS_TPrintScale), '(' + CS_poNone + ', ' + CS_poProportional + ', ' + CS_poPrintToFit + ')');
  cl.AddTypeS(Uppercase(CS_TCloseAction), '(' + CS_caNone + ', ' + CS_caHide + ', ' + CS_caFree + ', ' + CS_caMinimize + ')');
  cl.AddTypeS(Uppercase(CS_TCloseEvent) ,CS_procedure + '(Sender: ' + CS_TObject + '; ' + CS_var + ' Action: ' + CS_TCloseAction + ')');
  cl.AddTypeS(Uppercase(CS_TCloseQueryEvent) ,CS_procedure + '(Sender: ' + CS_TObject + '; ' + CS_var + ' CanClose: ' + CS_Boolean + ' )');
  cl.AddTypeS(Uppercase(CS_TBorderIcon) ,'(' + CS_biSystemMenu + ', ' + CS_biMinimize + ', ' + CS_biMaximize + ', ' + CS_biHelp + ')');
  cl.AddTypeS(Uppercase(CS_TBorderIcons), CS_set_of + CS_TBorderIcon);
  cl.AddTypeS(Uppercase(CS_THELPCONTEXT), CS_Longint);
end;

procedure SIRegister_Forms(Cl: TPSPascalCompiler);
begin
  SIRegister_Forms_TypesAndConsts(cl);

  {$IFNDEF PS_MINIVCL}
  SIRegisterTCONTROLSCROLLBAR(cl);
  {$ENDIF}
  SIRegisterTScrollingWinControl(cl);
  {$IFNDEF PS_MINIVCL}
  SIRegisterTSCROLLBOX(cl);
  {$ENDIF}
  SIRegisterTForm(Cl);
  {$IFNDEF PS_MINIVCL}
  SIRegisterTApplication(Cl);
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.

