{ Menus Import Unit }
Unit uPSC_menus;
{$I PascalScript.inc}
Interface
Uses uPSCompiler;

procedure SIRegisterTMENUITEMSTACK(CL: TPSPascalCompiler);
procedure SIRegisterTPOPUPLIST(CL: TPSPascalCompiler);
procedure SIRegisterTPOPUPMENU(CL: TPSPascalCompiler);
procedure SIRegisterTMAINMENU(CL: TPSPascalCompiler);
procedure SIRegisterTMENU(CL: TPSPascalCompiler);
procedure SIRegisterTMENUITEM(CL: TPSPascalCompiler);
procedure SIRegister_Menus(Cl: TPSPascalCompiler);

implementation

uses sysutils, langdef;

procedure SIRegisterTMENUITEMSTACK(CL: TPSPascalCompiler);
begin
	With cl.AddClassN(Cl.FindClass(Uppercase(CS_TSTACK)),Uppercase(CS_TMENUITEMSTACK)) do
	begin
	  RegisterMethod(CS_procedure + ' ' + CS_CLEARITEM + '( AITEM : ' + CS_TMENUITEM + ')');
	end;
end;

procedure SIRegisterTPOPUPLIST(CL: TPSPascalCompiler);
begin
	With cl.AddClassN(Cl.FindClass(Uppercase(CS_TLIST)),Uppercase(CS_TPOPUPLIST)) do
	begin
		RegisterProperty(Uppercase(CS_WINDOW), Uppercase(CS_HWND), iptr);
		RegisterMethod(CS_procedure + ' ' + CS_ADD + '( POPUP : ' + CS_TPOPUPMENU + ')');
		RegisterMethod(CS_procedure + ' ' + CS_REMOVE + '( POPUP : ' + CS_TPOPUPMENU + ')');
	end;
end;

procedure SIRegisterTPOPUPMENU(CL: TPSPascalCompiler);
var
	cc: TPSCompileTimeClass;
begin
	With cl.AddClassN(Cl.FindClass(Uppercase(CS_TMENU)),Uppercase(CS_TPOPUPMENU)) do
	begin
		cc := Cl.FindClass(CS_TLabel);
		if cc <> nil then
			RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPOPUPMENU), iptRW);
		with Cl.FindClass(CS_TForm) do
		begin
			RegisterProperty(Uppercase(CS_POPUPMENU), Uppercase(CS_TPOPUPMENU), iptRW);
		end;
	RegisterMethod(CS_constructor + ' ' + CS_CREATE + '( AOWNER : ' + CS_TCOMPONENT + ')');
	RegisterMethod(CS_procedure + ' ' + CS_POPUP + '( X, Y : ' + CS_INTEGER + ')');
	RegisterProperty(Uppercase(CS_POPUPCOMPONENT), Uppercase(CS_TCOMPONENT), iptrw);
	RegisterProperty(Uppercase(CS_ALIGNMENT), Uppercase(CS_TPOPUPALIGNMENT), iptrw);
	RegisterProperty(Uppercase(CS_AUTOPOPUP), Uppercase(CS_BOOLEAN), iptrw);
	RegisterProperty(Uppercase(CS_HELPCONTEXT), Uppercase(CS_THELPCONTEXT), iptrw);
    RegisterProperty(Uppercase(CS_MENUANIMATION), Uppercase(CS_TMENUANIMATION), iptrw);
    RegisterProperty(Uppercase(CS_TRACKBUTTON), Uppercase(CS_TTRACKBUTTON), iptrw);
    RegisterProperty(Uppercase(CS_ONPOPUP), Uppercase(CS_TNOTIFYEVENT), iptrw);
  end;
end;

procedure SIRegisterTMAINMENU(CL: TPSPascalCompiler);
begin
  With cl.AddClassN(Cl.FindClass(Uppercase(CS_TMENU)),Uppercase(CS_TMAINMENU)) do
  begin
    RegisterMethod(CS_procedure + ' ' + CS_MERGE + '( MENU : ' + CS_TMAINMENU + ')');
    RegisterMethod(CS_procedure + ' ' + CS_UNMERGE + '( MENU : ' + CS_TMAINMENU + ')');
    RegisterMethod(CS_procedure + ' ' + CS_POPULATEOLE2MENU + '( SHAREDMENU : ' + CS_HMENU  + '; GROUPS : ' + CS_array_of + CS_INTEGER + '; ' + CS_var + ' WIDTHS : ' + CS_array_of +  CS_LONGINT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_GETOLE2ACCELERATORTABLE + '( ' + CS_var + ' ACCELTABLE : ' + CS_HACCEL + '; ' + CS_var  + ' ACCELCOUNT : ' + CS_INTEGER + '; GROUPS : ' + CS_array_of + CS_INTEGER + ')');
    RegisterMethod(CS_procedure + ' ' + CS_SETOLE2MENUHANDLE + '( HANDLE : ' + CS_HMENU + ')');
    RegisterProperty(Uppercase(CS_AUTOMERGE), Uppercase(CS_BOOLEAN), iptrw);
  end;
end;

procedure SIRegisterTMENU(CL: TPSPascalCompiler);
begin
  With cl.AddClassN(Cl.FindClass(Uppercase(CS_TCOMPONENT)),Uppercase(CS_TMENU)) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE + '( AOWNER : ' + CS_TCOMPONENT + ')');
    RegisterMethod(CS_function + ' ' + CS_DISPATCHCOMMAND + '( ACOMMAND : ' + CS_WORD + ') : ' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_DISPATCHPOPUP + '( AHANDLE : ' + CS_HMENU + ') : ' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_FINDITEM + '( VALUE : ' + CS_INTEGER + '; KIND : ' + CS_TFINDITEMKIND + ') : ' + CS_TMENUITEM);
    RegisterMethod(CS_function + ' ' + CS_GETHELPCONTEXT + '( VALUE : ' + CS_INTEGER + '; BYCOMMAND : ' + CS_BOOLEAN + ') : ' + CS_THELPCONTEXT);
    RegisterProperty(Uppercase(CS_IMAGES), Uppercase(CS_TCUSTOMIMAGELIST), iptrw);
    RegisterMethod(CS_function + ' ' + CS_ISRIGHTTOLEFT + ' : ' + CS_BOOLEAN);
    RegisterMethod(CS_procedure + ' ' + CS_PARENTBIDIMODECHANGED + '( ACONTROL : ' + CS_TOBJECT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_PROCESSMENUCHAR + '( ' + CS_var + ' MESSAGE : ' + CS_TWMMENUCHAR + ')');
    RegisterProperty(Uppercase(CS_AUTOHOTKEYS), Uppercase(CS_TMENUAUTOFLAG), iptrw);
    RegisterProperty(Uppercase(CS_AUTOLINEREDUCTION), Uppercase(CS_TMENUAUTOFLAG), iptrw);
    RegisterProperty(Uppercase(CS_BIDIMODE), Uppercase(CS_TBIDIMODE), iptrw);
    RegisterProperty(Uppercase(CS_HANDLE), Uppercase(CS_HMENU), iptr);
    RegisterProperty(Uppercase(CS_OWNERDRAW), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_PARENTBIDIMODE), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_WINDOWHANDLE), Uppercase(CS_HWND), iptrw);
    RegisterProperty(Uppercase(CS_ITEMS), Uppercase(CS_TMENUITEM), iptr);
  end;
end;

procedure SIRegisterTMENUITEM(CL: TPSPascalCompiler);
begin
  With cl.AddClassN(Cl.FindClass(Uppercase(CS_TCOMPONENT)),Uppercase(CS_TMENUITEM)) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_CREATE + '( AOWNER : ' + CS_TCOMPONENT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_INITIATEACTION);
    RegisterMethod(CS_procedure + ' ' + CS_INSERT + '( INDEX : ' + CS_INTEGER + '; ITEM : ' + CS_TMENUITEM + ')');
    RegisterMethod(CS_procedure + ' ' + CS_DELETE + '( INDEX : ' + CS_INTEGER + ')');
    RegisterMethod(CS_procedure + ' ' + CS_CLEAR);
    RegisterMethod(CS_procedure + ' ' + CS_CLICK);
    RegisterMethod(CS_function + ' ' + CS_FIND + '( ACAPTION : '  + CS_String + ') : ' + CS_TMENUITEM);
    RegisterMethod(CS_function + ' ' + CS_INDEXOF + '( ITEM : ' + CS_TMENUITEM + ') : ' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_ISLINE + ' : ' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_GETIMAGELIST + ' : ' + CS_TCUSTOMIMAGELIST);
    RegisterMethod(CS_function + ' ' + CS_GETPARENTCOMPONENT + ' : ' + CS_TCOMPONENT);
    RegisterMethod(CS_function + ' ' + CS_GETPARENTMENU + ' : ' + CS_TMENU);
    RegisterMethod(CS_function + ' ' + CS_HASPARENT + ' : ' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_NEWTOPLINE + ' : ' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_NEWBOTTOMLINE + ' : ' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_INSERTNEWLINEBEFORE + '( AITEM : ' + CS_TMENUITEM + ') : ' + CS_INTEGER);
    RegisterMethod(CS_function + ' ' + CS_INSERTNEWLINEAFTER + '( AITEM : ' + CS_TMENUITEM + ') : ' + CS_INTEGER);
    RegisterMethod(CS_procedure + ' ' + CS_ADD + '( ITEM : ' + CS_TMENUITEM + ')');
    RegisterMethod(CS_procedure + ' ' + CS_REMOVE + '( ITEM : ' + CS_TMENUITEM + ')');
    RegisterMethod(CS_function + ' ' + CS_RETHINKHOTKEYS + ' : ' + CS_BOOLEAN);
    RegisterMethod(CS_function + ' ' + CS_RETHINKLINES + ' : ' + CS_BOOLEAN);
    RegisterProperty(Uppercase(CS_COMMAND), Uppercase(CS_WORD), iptr);
    RegisterProperty(Uppercase(CS_HANDLE), Uppercase(CS_HMENU), iptr);
    RegisterProperty(Uppercase(CS_COUNT), Uppercase(CS_INTEGER), iptr);
    RegisterProperty(Uppercase(CS_ITEMS), Uppercase(CS_TMENUITEM), iptr);
    RegisterProperty(Uppercase(CS_MENUINDEX), Uppercase(CS_INTEGER), iptrw);
    RegisterProperty(Uppercase(CS_PARENT), Uppercase(CS_TMENUITEM), iptr);
    {$IFDEF DELPHI5UP}
    RegisterProperty(Uppercase(CS_ACTION), Uppercase(CS_TBASICACTION), iptrw);
    {$ENDIF}
    RegisterProperty(Uppercase(CS_AUTOHOTKEYS), Uppercase(CS_TMENUITEMAUTOFLAG), iptrw);
    RegisterProperty(Uppercase(CS_AUTOLINEREDUCTION), Uppercase(CS_TMENUITEMAUTOFLAG), iptrw);
    RegisterProperty(Uppercase(CS_BITMAP), Uppercase(CS_TBITMAP), iptrw);
    RegisterProperty(Uppercase(CS_CAPTION), Uppercase(CS_String), iptrw);
    RegisterProperty(Uppercase(CS_CHECKED), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_SUBMENUIMAGES), Uppercase(CS_TCUSTOMIMAGELIST), iptrw);
    RegisterProperty(Uppercase(CS_DEFAULT), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_ENABLED), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_GROUPINDEX), Uppercase(CS_BYTE), iptrw);
    RegisterProperty(Uppercase(CS_HELPCONTEXT), Uppercase(CS_THELPCONTEXT), iptrw);
    RegisterProperty(Uppercase(CS_HINT), CS_String, iptrw);
    RegisterProperty(Uppercase(CS_IMAGEINDEX), Uppercase(CS_TIMAGEINDEX), iptrw);
    RegisterProperty(Uppercase(CS_RADIOITEM), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_SHORTCUT), Uppercase(CS_TSHORTCUT), iptrw);
    RegisterProperty(Uppercase(CS_VISIBLE), Uppercase(CS_BOOLEAN), iptrw);
    RegisterProperty(Uppercase(CS_ONCLICK), Uppercase(CS_TNOTIFYEVENT), iptrw);
   {$IFNDEF FPC} RegisterProperty(Uppercase(CS_ONDRAWITEM), Uppercase(CS_TMENUDRAWITEMEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONADVANCEDDRAWITEM), Uppercase(CS_TADVANCEDMENUDRAWITEMEVENT), iptrw);
    RegisterProperty(Uppercase(CS_ONMEASUREITEM), Uppercase(CS_TMENUMEASUREITEMEVENT), iptrw);{$ENDIF}
  end;
end;

procedure SIRegister_Menus(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS(CS_HMenu, CS_Cardinal);
  Cl.AddTypeS(CS_HACCEL, CS_Cardinal);

  cl.addClassN(cl.FindClass(Uppercase(CS_EXCEPTION)),Uppercase(CS_EMENUERROR));
  Cl.addTypeS(Uppercase(CS_TMENUBREAK), '( ' + CS_MBNONE + ', ' + CS_MBBREAK + ', ' + CS_MBBARBREAK + ')');
{$IFNDEF FPC}
  Cl.addTypeS(Uppercase(CS_TMENUDRAWITEMEVENT), CS_procedure + ' ( SENDER : ' + CS_TOBJECT + '; ACANVAS : ' + CS_TCANVAS
  + '; ARECT : ' + CS_TRECT + '; SELECTED : ' + CS_BOOLEAN + ')');
  Cl.addTypeS(Uppercase(CS_TADVANCEDMENUDRAWITEMEVENT), CS_procedure + ' ( SENDER : ' + CS_TOBJECT + '; ACANVAS : ' + CS_TCANVAS
  + '; ARECT : ' + CS_TRECT + '; STATE : ' + CS_TOWNERDRAWSTATE + ')');
  Cl.addTypeS(Uppercase(CS_TMENUMEASUREITEMEVENT), CS_procedure + ' ( SENDER : ' + CS_TOBJECT + '; ACANVAS :'
   + CS_TCANVAS + '; ' + CS_var + ' WIDTH, HEIGHT : ' + CS_INTEGER + ')');
{$ENDIF}
  Cl.addTypeS(Uppercase(CS_TMENUITEMAUTOFLAG), '( ' + CS_MAAUTOMATIC + ', ' + CS_MAMANUAL + ', ' + CS_MAPARENT + ' )');
  Cl.AddTypeS(CS_TMenuAutoFlag, Uppercase(CS_TMENUITEMAUTOFLAG));
  Cl.addTypeS(Uppercase(CS_TSHORTCUT), Uppercase(CS_WORD));
  cl.addClassN(cl.FindClass(Uppercase(CS_TACTIONLINK)),Uppercase(CS_TMENUACTIONLINK));
  SIRegisterTMENUITEM(Cl);
  Cl.addTypeS(Uppercase(CS_TMENUCHANGEEVENT), CS_procedure + ' ( SENDER : ' + CS_TOBJECT + '; SOURCE : ' + CS_TMENUITEM
  + '; REBUILD : ' + CS_BOOLEAN + ')');
  Cl.addTypeS(Uppercase(CS_TFINDITEMKIND), '( ' + CS_FKCOMMAND + ', ' + CS_FKHANDLE + ', ' + CS_FKSHORTCUT + ' )');
  SIRegisterTMENU(Cl);
  SIRegisterTMAINMENU(Cl);
  Cl.addTypeS(Uppercase(CS_TPOPUPALIGNMENT), '( ' + CS_PALEFT + ', ' + CS_PARIGHT + ', ' + CS_PACENTER + ' )');
  Cl.addTypeS(Uppercase(CS_TTRACKBUTTON), '( ' + CS_TBRIGHTBUTTON + ', ' + CS_TBLEFTBUTTON + ' )');
  Cl.addTypeS(Uppercase(CS_TMENUANIMATIONS), '( ' + CS_MALEFTTORIGHT + ', ' + CS_MARIGHTTOLEFT + ', ' + CS_MATOPTOBOTTOM
   +', ' + CS_MABOTTOMTOTOP + ', ' + CS_MANONE + ' )');
  Cl.addTypeS(Uppercase(CS_TMENUANIMATION), CS_set_of + ' ' + CS_TMENUANIMATIONS);
  SIRegisterTPOPUPMENU(Cl);
  SIRegisterTPOPUPLIST(Cl);
  SIRegisterTMENUITEMSTACK(Cl);
  Cl.addTypeS(Uppercase(CS_TCMENUITEM), Uppercase(CS_TMENUITEM));
{$IFNDEF FPC}
//TODO: it should work,but somehow TShiftState is not defined
  Cl.AddDelphiFunction(CS_function + ' ' + CS_SHORTCUT + '( KEY : ' + CS_WORD + '; SHIFT : ' + CS_TSHIFTSTATE + ') : '
   + CS_TSHORTCUT);
  Cl.AddDelphiFunction(CS_procedure + ' ' + CS_SHORTCUTTOKEY + '( SHORTCUT : ' + CS_TSHORTCUT + '; ' + CS_var + ' KEY : '
   + CS_WORD + '; ' + CS_var + ' SHIFT : ' + CS_TSHIFTSTATE + ')');
{$ENDIF}
  Cl.AddDelphiFunction(CS_function + ' ' + CS_SHORTCUTTOTEXT + '( SHORTCUT : ' + CS_TSHORTCUT + ' ) : ' + CS_String);
  Cl.AddDelphiFunction(CS_function + ' ' + CS_TEXTTOSHORTCUT + '( TEXT : ' + CS_String + ') : ' + CS_TSHORTCUT);
  Cl.AddDelphiFunction(CS_function + ' ' + CS_NEWMENU + '( OWNER : ' + CS_TCOMPONENT + '; ' + CS_const + ' ANAME : ' + CS_STRING
   +'; ITEMS : ' + CS_array_of + CS_TMenuItem + ') : ' + CS_TMAINMENU);
  Cl.AddDelphiFunction(CS_function + ' ' + CS_NEWPOPUPMENU + '( OWNER : ' + CS_TCOMPONENT + '; ' + CS_const + ' ANAME :'
   + CS_String + '; ALIGNMENT : ' + CS_TPOPUPALIGNMENT + '; AUTOPOPUP : ' + CS_BOOLEAN + '; ' + CS_const + ' ITEMS : '
   + CS_array_of + CS_TCMENUITEM + ') : ' + CS_TPOPUPMENU);
  Cl.AddDelphiFunction(CS_function + ' ' + CS_NEWSUBMENU + '( ' + CS_const + ' ACAPTION : ' + CS_String + '; HCTX : '
   + CS_WORD + '; ' + CS_const + ' ANAME : ' + CS_String + '; ITEMS : ' + CS_array_of + CS_TMenuItem + '; AENABLED : ' + CS_BOOLEAN
    + ') : ' + CS_TMENUITEM);
  Cl.AddDelphiFunction(CS_function + ' ' + CS_NEWITEM + '( ' + CS_const + ' ACAPTION : ' + CS_String + '; ASHORTCUT : '
   + CS_TSHORTCUT + '; ACHECKED, AENABLED : ' + CS_BOOLEAN + '; AONCLICK : ' + CS_TNOTIFYEVENT + '; HCTX : '
   + CS_WORD + '; ' + CS_const + ' ANAME : ' + CS_String + ') : ' + CS_TMENUITEM);
  Cl.AddDelphiFunction(CS_function + ' ' + CS_NEWLINE + ' : ' + CS_TMENUITEM);
{$IFNDEF FPC}
  Cl.AddDelphiFunction(CS_procedure + ' ' + CS_DRAWMENUITEM + '( MENUITEM : ' + CS_TMENUITEM + '; ACANVAS :'
   + CS_TCANVAS + '; ARECT : ' + CS_TRECT + '; STATE : ' + CS_TOWNERDRAWSTATE + ')');
{$ENDIF}
end;

end.
