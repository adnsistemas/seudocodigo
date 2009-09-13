 
Unit uPSR_menus;
{$I PascalScript.inc}
Interface
Uses uPSRuntime;

procedure RIRegister_Menus_Routines(S: TPSExec);
{$IFNDEF FPC}
procedure RIRegisterTMENUITEMSTACK(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPOPUPLIST(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTPOPUPMENU(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTMAINMENU(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTMENU(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTMENUITEM(Cl: TPSRuntimeClassImporter);
procedure RIRegister_Menus(CL: TPSRuntimeClassImporter);

implementation

uses langdef
{$IFDEF LINUX}
{$IFNDEF FPC}
  ,Libc, SysUtils, Classes, QControls, QMenus, QGraphics
{$ELSE}
  ,Libc, SysUtils, Classes, Controls, Menus, Graphics, LCLType, ImgList
{$ENDIF}
{$ELSE}
  ,{$IFNDEF FPC}WINDOWS,{$ELSE} LCLType,{$ENDIF} SYSUTILS, CLASSES, CONTNRS, MESSAGES, GRAPHICS, IMGLIST, ACTNLIST, Menus
{$ENDIF};


{$IFNDEF FPC}
procedure TPOPUPLISTWINDOW_R(Self: TPOPUPLIST; var T: HWND);
begin T := Self.WINDOW; end;
{$ENDIF}

procedure TPOPUPMENUONPOPUP_W(Self: TPOPUPMENU; const T: TNOTIFYEVENT);
begin Self.ONPOPUP := T; end;

procedure TPOPUPMENUONPOPUP_R(Self: TPOPUPMENU; var T: TNOTIFYEVENT);
begin T := Self.ONPOPUP; end;

{$IFNDEF FPC}
procedure TPOPUPMENUTRACKBUTTON_W(Self: TPOPUPMENU; const T: TTRACKBUTTON);
begin Self.TRACKBUTTON := T; end;

procedure TPOPUPMENUTRACKBUTTON_R(Self: TPOPUPMENU; var T: TTRACKBUTTON);
begin T := Self.TRACKBUTTON; end;


procedure TPOPUPMENUMENUANIMATION_W(Self: TPOPUPMENU; const T: TMENUANIMATION);
begin Self.MENUANIMATION := T; end;

procedure TPOPUPMENUMENUANIMATION_R(Self: TPOPUPMENU; var T: TMENUANIMATION);
begin T := Self.MENUANIMATION; end;

procedure TPOPUPMENUHELPCONTEXT_W(Self: TPOPUPMENU; const T: THELPCONTEXT);
begin Self.HELPCONTEXT := T; end;

procedure TPOPUPMENUHELPCONTEXT_R(Self: TPOPUPMENU; var T: THELPCONTEXT);
begin T := Self.HELPCONTEXT; end;
{$ENDIF}

procedure TPOPUPMENUAUTOPOPUP_W(Self: TPOPUPMENU; const T: BOOLEAN);
begin Self.AUTOPOPUP := T; end;

procedure TPOPUPMENUAUTOPOPUP_R(Self: TPOPUPMENU; var T: BOOLEAN);
begin T := Self.AUTOPOPUP; end;

{$IFNDEF FPC}
procedure TPOPUPMENUALIGNMENT_W(Self: TPOPUPMENU; const T: TPOPUPALIGNMENT);
begin Self.ALIGNMENT := T; end;

procedure TPOPUPMENUALIGNMENT_R(Self: TPOPUPMENU; var T: TPOPUPALIGNMENT);
begin T := Self.ALIGNMENT; end;
{$ENDIF}

procedure TPOPUPMENUPOPUPCOMPONENT_W(Self: TPOPUPMENU; const T: TCOMPONENT);
begin Self.POPUPCOMPONENT := T; end;

procedure TPOPUPMENUPOPUPCOMPONENT_R(Self: TPOPUPMENU; var T: TCOMPONENT);
begin T := Self.POPUPCOMPONENT; end;

{$IFNDEF FPC}
procedure TMAINMENUAUTOMERGE_W(Self: TMAINMENU; const T: BOOLEAN);
begin Self.AUTOMERGE := T; end;

procedure TMAINMENUAUTOMERGE_R(Self: TMAINMENU; var T: BOOLEAN);
begin T := Self.AUTOMERGE; end;
{$ENDIF}

procedure TMENUITEMS_R(Self: TMENU; var T: TMENUITEM);
begin T := Self.ITEMS; end;


{$IFNDEF FPC}
procedure TMENUWINDOWHANDLE_W(Self: TMENU; const T: HWND);
begin Self.WINDOWHANDLE := T; end;

procedure TMENUWINDOWHANDLE_R(Self: TMENU; var T: HWND);
begin T := Self.WINDOWHANDLE; end;

procedure TMENUPARENTBIDIMODE_W(Self: TMENU; const T: BOOLEAN);
begin Self.PARENTBIDIMODE := T; end;

procedure TMENUPARENTBIDIMODE_R(Self: TMENU; var T: BOOLEAN);
begin T := Self.PARENTBIDIMODE; end;

procedure TMENUOWNERDRAW_W(Self: TMENU; const T: BOOLEAN);
begin Self.OWNERDRAW := T; end;

procedure TMENUOWNERDRAW_R(Self: TMENU; var T: BOOLEAN);
begin T := Self.OWNERDRAW; end;

procedure TMENUBIDIMODE_W(Self: TMENU; const T: TBIDIMODE);
begin Self.BIDIMODE := T; end;

procedure TMENUBIDIMODE_R(Self: TMENU; var T: TBIDIMODE);
begin T := Self.BIDIMODE; end;

procedure TMENUAUTOLINEREDUCTION_W(Self: TMENU; const T: TMENUAUTOFLAG);
begin Self.AUTOLINEREDUCTION := T; end;

procedure TMENUAUTOLINEREDUCTION_R(Self: TMENU; var T: TMENUAUTOFLAG);
begin T := Self.AUTOLINEREDUCTION; end;

procedure TMENUAUTOHOTKEYS_W(Self: TMENU; const T: TMENUAUTOFLAG);
begin Self.AUTOHOTKEYS := T; end;

procedure TMENUAUTOHOTKEYS_R(Self: TMENU; var T: TMENUAUTOFLAG);
begin T := Self.AUTOHOTKEYS; end;

{$ENDIF}


procedure TMENUHANDLE_R(Self: TMENU; var T: HMENU);
begin T := Self.HANDLE; end;




procedure TMENUIMAGES_W(Self: TMENU; const T: TCUSTOMIMAGELIST);
begin Self.IMAGES := T; end;

procedure TMENUIMAGES_R(Self: TMENU; var T: TCUSTOMIMAGELIST);
begin T := Self.IMAGES; end;

{$IFNDEF FPC}
procedure TMENUITEMONMEASUREITEM_W(Self: TMENUITEM; const T: TMENUMEASUREITEMEVENT);
begin Self.ONMEASUREITEM := T; end;

procedure TMENUITEMONMEASUREITEM_R(Self: TMENUITEM; var T: TMENUMEASUREITEMEVENT);
begin T := Self.ONMEASUREITEM; end;

procedure TMENUITEMONADVANCEDDRAWITEM_W(Self: TMENUITEM; const T: TADVANCEDMENUDRAWITEMEVENT);
begin Self.ONADVANCEDDRAWITEM := T; end;

procedure TMENUITEMONADVANCEDDRAWITEM_R(Self: TMENUITEM; var T: TADVANCEDMENUDRAWITEMEVENT);
begin T := Self.ONADVANCEDDRAWITEM; end;

procedure TMENUITEMONDRAWITEM_W(Self: TMENUITEM; const T: TMENUDRAWITEMEVENT);
begin Self.ONDRAWITEM := T; end;

procedure TMENUITEMONDRAWITEM_R(Self: TMENUITEM; var T: TMENUDRAWITEMEVENT);
begin T := Self.ONDRAWITEM; end;
{$ENDIF}

procedure TMENUITEMONCLICK_W(Self: TMENUITEM; const T: TNOTIFYEVENT);
begin Self.ONCLICK := T; end;

procedure TMENUITEMONCLICK_R(Self: TMENUITEM; var T: TNOTIFYEVENT);
begin T := Self.ONCLICK; end;

procedure TMENUITEMVISIBLE_W(Self: TMENUITEM; const T: BOOLEAN);
begin Self.VISIBLE := T; end;

procedure TMENUITEMVISIBLE_R(Self: TMENUITEM; var T: BOOLEAN);
begin T := Self.VISIBLE; end;

procedure TMENUITEMSHORTCUT_W(Self: TMENUITEM; const T: TSHORTCUT);
begin Self.SHORTCUT := T; end;

procedure TMENUITEMSHORTCUT_R(Self: TMENUITEM; var T: TSHORTCUT);
begin T := Self.SHORTCUT; end;

procedure TMENUITEMRADIOITEM_W(Self: TMENUITEM; const T: BOOLEAN);
begin Self.RADIOITEM := T; end;

procedure TMENUITEMRADIOITEM_R(Self: TMENUITEM; var T: BOOLEAN);
begin T := Self.RADIOITEM; end;

procedure TMENUITEMIMAGEINDEX_W(Self: TMENUITEM; const T: TIMAGEINDEX);
begin Self.IMAGEINDEX := T; end;

procedure TMENUITEMIMAGEINDEX_R(Self: TMENUITEM; var T: TIMAGEINDEX);
begin T := Self.IMAGEINDEX; end;

procedure TMENUITEMHINT_W(Self: TMENUITEM; const T: STRING);
begin Self.HINT := T; end;

procedure TMENUITEMHINT_R(Self: TMENUITEM; var T: STRING);
begin T := Self.HINT; end;

procedure TMENUITEMHELPCONTEXT_W(Self: TMENUITEM; const T: THELPCONTEXT);
begin Self.HELPCONTEXT := T; end;

procedure TMENUITEMHELPCONTEXT_R(Self: TMENUITEM; var T: THELPCONTEXT);
begin T := Self.HELPCONTEXT; end;

procedure TMENUITEMGROUPINDEX_W(Self: TMENUITEM; const T: BYTE);
begin Self.GROUPINDEX := T; end;

procedure TMENUITEMGROUPINDEX_R(Self: TMENUITEM; var T: BYTE);
begin T := Self.GROUPINDEX; end;

procedure TMENUITEMENABLED_W(Self: TMENUITEM; const T: BOOLEAN);
begin Self.ENABLED := T; end;

procedure TMENUITEMENABLED_R(Self: TMENUITEM; var T: BOOLEAN);
begin T := Self.ENABLED; end;

procedure TMENUITEMDEFAULT_W(Self: TMENUITEM; const T: BOOLEAN);
begin Self.DEFAULT := T; end;

procedure TMENUITEMDEFAULT_R(Self: TMENUITEM; var T: BOOLEAN);
begin T := Self.DEFAULT; end;

procedure TMENUITEMSUBMENUIMAGES_W(Self: TMENUITEM; const T: TCUSTOMIMAGELIST);
begin Self.SUBMENUIMAGES := T; end;

procedure TMENUITEMSUBMENUIMAGES_R(Self: TMENUITEM; var T: TCUSTOMIMAGELIST);
begin T := Self.SUBMENUIMAGES; end;

procedure TMENUITEMCHECKED_W(Self: TMENUITEM; const T: BOOLEAN);
begin Self.CHECKED := T; end;

procedure TMENUITEMCHECKED_R(Self: TMENUITEM; var T: BOOLEAN);
begin T := Self.CHECKED; end;

procedure TMENUITEMCAPTION_W(Self: TMENUITEM; const T: STRING);
begin Self.CAPTION := T; end;

procedure TMENUITEMCAPTION_R(Self: TMENUITEM; var T: STRING);
begin T := Self.CAPTION; end;

procedure TMENUITEMBITMAP_W(Self: TMENUITEM; const T: TBITMAP);
begin Self.BITMAP := T; end;

procedure TMENUITEMBITMAP_R(Self: TMENUITEM; var T: TBITMAP);
begin T := Self.BITMAP; end;

{$IFNDEF FPC}
procedure TMENUITEMAUTOLINEREDUCTION_W(Self: TMENUITEM; const T: TMENUITEMAUTOFLAG);
begin Self.AUTOLINEREDUCTION := T; end;

procedure TMENUITEMAUTOLINEREDUCTION_R(Self: TMENUITEM; var T: TMENUITEMAUTOFLAG);
begin T := Self.AUTOLINEREDUCTION; end;

procedure TMENUITEMAUTOHOTKEYS_W(Self: TMENUITEM; const T: TMENUITEMAUTOFLAG);
begin Self.AUTOHOTKEYS := T; end;

procedure TMENUITEMAUTOHOTKEYS_R(Self: TMENUITEM; var T: TMENUITEMAUTOFLAG);
begin T := Self.AUTOHOTKEYS; end;
{$ENDIF}

procedure TMENUITEMACTION_W(Self: TMENUITEM; const T: TBASICACTION);
begin Self.ACTION := T; end;

procedure TMENUITEMACTION_R(Self: TMENUITEM; var T: TBASICACTION);
begin T := Self.ACTION; end;

procedure TMENUITEMPARENT_R(Self: TMENUITEM; var T: TMENUITEM);
begin T := Self.PARENT; end;

procedure TMENUITEMMENUINDEX_W(Self: TMENUITEM; const T: INTEGER);
begin Self.MENUINDEX := T; end;

procedure TMENUITEMMENUINDEX_R(Self: TMENUITEM; var T: INTEGER);
begin T := Self.MENUINDEX; end;

procedure TMENUITEMITEMS_R(Self: TMENUITEM; var T: TMENUITEM; const t1: INTEGER);
begin T := Self.ITEMS[t1]; end;

procedure TMENUITEMCOUNT_R(Self: TMENUITEM; var T: INTEGER);
begin T := Self.COUNT; end;

procedure TMENUITEMHANDLE_R(Self: TMENUITEM; var T: HMENU);
begin T := Self.HANDLE; end;

procedure TMENUITEMCOMMAND_R(Self: TMENUITEM; var T: WORD);
begin T := Self.COMMAND; end;

procedure RIRegister_Menus_Routines(S: TPSExec);
begin
  S.RegisterDelphiFunction(@SHORTCUT, CS_SHORTCUT, cdRegister);
	S.RegisterDelphiFunction(@SHORTCUTTOKEY, CS_SHORTCUTTOKEY, cdRegister);
{$IFNDEF FPC}
  S.RegisterDelphiFunction(@SHORTCUTTOTEXT, CS_SHORTCUTTOTEXT, cdRegister);
  S.RegisterDelphiFunction(@TEXTTOSHORTCUT, CS_TEXTTOSHORTCUT, cdRegister);
  S.RegisterDelphiFunction(@NEWMENU, CS_NEWMENU, cdRegister);
  S.RegisterDelphiFunction(@NEWPOPUPMENU, CS_NEWPOPUPMENU, cdRegister);
  S.RegisterDelphiFunction(@NEWSUBMENU, CS_NEWSUBMENU, cdRegister);
  S.RegisterDelphiFunction(@NEWITEM, CS_NEWITEM, cdRegister);
  S.RegisterDelphiFunction(@NEWLINE, CS_NEWLINE, cdRegister);
	S.RegisterDelphiFunction(@DRAWMENUITEM, CS_DRAWMENUITEM, cdRegister);
{$ENDIF}	
end;

{$IFNDEF FPC}
procedure RIRegisterTMENUITEMSTACK(Cl: TPSRuntimeClassImporter);
begin
	with Cl.Add(TMENUITEMSTACK) do
	begin
		RegisterMethod(@TMENUITEMSTACK.CLEARITEM, CS_CLEARITEM);
	end;
end;

procedure RIRegisterTPOPUPLIST(Cl: TPSRuntimeClassImporter);
begin
	with Cl.Add(TPOPUPLIST) do
	begin
		RegisterPropertyHelper(@TPOPUPLISTWINDOW_R,nil,CS_WINDOW);
		RegisterMethod(@TPOPUPLIST.ADD, CS_ADD);
		RegisterMethod(@TPOPUPLIST.REMOVE, CS_REMOVE);
	end;
end;
{$ENDIF}


procedure RIRegisterTPOPUPMENU(Cl: TPSRuntimeClassImporter);
begin
	with Cl.Add(TPOPUPMENU) do
  begin
		RegisterConstructor(@TPOPUPMENU.CREATE, CS_CREATE);
		RegisterVirtualMethod(@TPOPUPMENU.POPUP, CS_POPUP);
		RegisterPropertyHelper(@TPOPUPMENUPOPUPCOMPONENT_R,@TPOPUPMENUPOPUPCOMPONENT_W,CS_POPUPCOMPONENT);
		RegisterEventPropertyHelper(@TPOPUPMENUONPOPUP_R,@TPOPUPMENUONPOPUP_W,CS_ONPOPUP);
{$IFNDEF FPC}
		RegisterPropertyHelper(@TPOPUPMENUALIGNMENT_R,@TPOPUPMENUALIGNMENT_W,CS_ALIGNMENT);
		RegisterPropertyHelper(@TPOPUPMENUAUTOPOPUP_R,@TPOPUPMENUAUTOPOPUP_W,CS_AUTOPOPUP);
		RegisterPropertyHelper(@TPOPUPMENUHELPCONTEXT_R,@TPOPUPMENUHELPCONTEXT_W,CS_HELPCONTEXT);
		RegisterPropertyHelper(@TPOPUPMENUMENUANIMATION_R,@TPOPUPMENUMENUANIMATION_W,CS_MENUANIMATION);
		RegisterPropertyHelper(@TPOPUPMENUTRACKBUTTON_R,@TPOPUPMENUTRACKBUTTON_W,CS_TRACKBUTTON);
{$ENDIF}
	end;
end;

procedure RIRegisterTMAINMENU(Cl: TPSRuntimeClassImporter);
begin
	with Cl.Add(TMAINMENU) do
	begin
{$IFNDEF FPC}
		RegisterMethod(@TMAINMENU.MERGE, CS_MERGE);
		RegisterMethod(@TMAINMENU.UNMERGE, CS_UNMERGE);
		RegisterMethod(@TMAINMENU.POPULATEOLE2MENU, CS_POPULATEOLE2MENU);
		RegisterMethod(@TMAINMENU.GETOLE2ACCELERATORTABLE, CS_GETOLE2ACCELERATORTABLE);
		RegisterMethod(@TMAINMENU.SETOLE2MENUHANDLE, CS_SETOLE2MENUHANDLE);
		RegisterPropertyHelper(@TMAINMENUAUTOMERGE_R,@TMAINMENUAUTOMERGE_W,CS_AUTOMERGE);
{$ENDIF}		
	end;
end;


procedure RIRegisterTMENU(Cl: TPSRuntimeClassImporter);
begin
	with Cl.Add(TMENU) do
	begin
		RegisterConstructor(@TMENU.CREATE, CS_CREATE);
		RegisterMethod(@TMENU.DISPATCHCOMMAND, CS_DISPATCHCOMMAND);
		RegisterMethod(@TMENU.FINDITEM, CS_FINDITEM);
		RegisterPropertyHelper(@TMENUIMAGES_R,@TMENUIMAGES_W,CS_IMAGES);
		RegisterMethod(@TMENU.ISRIGHTTOLEFT, CS_ISRIGHTTOLEFT);
		RegisterPropertyHelper(@TMENUHANDLE_R,nil,CS_HANDLE);
		RegisterPropertyHelper(@TMENUITEMS_R,nil,CS_ITEMS);
{$IFNDEF FPC}
		RegisterMethod(@TMENU.DISPATCHPOPUP, CS_DISPATCHPOPUP);
		RegisterMethod(@TMENU.PARENTBIDIMODECHANGED, CS_PARENTBIDIMODECHANGED);
		RegisterMethod(@TMENU.PROCESSMENUCHAR, CS_PROCESSMENUCHAR);
		RegisterPropertyHelper(@TMENUAUTOHOTKEYS_R,@TMENUAUTOHOTKEYS_W,CS_AUTOHOTKEYS);
		RegisterPropertyHelper(@TMENUAUTOLINEREDUCTION_R,@TMENUAUTOLINEREDUCTION_W,CS_AUTOLINEREDUCTION);
		RegisterPropertyHelper(@TMENUBIDIMODE_R,@TMENUBIDIMODE_W,CS_BIDIMODE);
		RegisterMethod(@TMENU.GETHELPCONTEXT, CS_GETHELPCONTEXT);
		RegisterPropertyHelper(@TMENUOWNERDRAW_R,@TMENUOWNERDRAW_W,CS_OWNERDRAW);
		RegisterPropertyHelper(@TMENUPARENTBIDIMODE_R,@TMENUPARENTBIDIMODE_W,CS_PARENTBIDIMODE);
		RegisterPropertyHelper(@TMENUWINDOWHANDLE_R,@TMENUWINDOWHANDLE_W,CS_WINDOWHANDLE);
{$ENDIF}
	end;
end;

procedure RIRegisterTMENUITEM(Cl: TPSRuntimeClassImporter);
begin
	with Cl.Add(TMENUITEM) do
	begin
		RegisterConstructor(@TMENUITEM.CREATE, CS_CREATE);
		RegisterVirtualMethod(@TMENUITEM.INITIATEACTION, CS_INITIATEACTION);
		RegisterMethod(@TMENUITEM.INSERT, CS_INSERT);
		RegisterMethod(@TMENUITEM.DELETE, CS_DELETE);
		RegisterMethod(@TMENUITEM.CLEAR, CS_CLEAR);
		RegisterVirtualMethod(@TMENUITEM.CLICK, CS_CLICK);
{$IFNDEF FPC}
		RegisterMethod(@TMENUITEM.FIND, CS_FIND);
		RegisterMethod(@TMENUITEM.NEWTOPLINE, CS_NEWTOPLINE);
		RegisterMethod(@TMENUITEM.NEWBOTTOMLINE, CS_NEWBOTTOMLINE);
		RegisterMethod(@TMENUITEM.INSERTNEWLINEBEFORE, CS_INSERTNEWLINEBEFORE);
		RegisterMethod(@TMENUITEM.INSERTNEWLINEAFTER, CS_INSERTNEWLINEAFTER);
		RegisterMethod(@TMENUITEM.RETHINKHOTKEYS, CS_RETHINKHOTKEYS);
		RegisterMethod(@TMENUITEM.RETHINKLINES, CS_RETHINKLINES);
		RegisterMethod(@TMENUITEM.ISLINE, CS_ISLINE);
{$ENDIF}
		RegisterMethod(@TMENUITEM.INDEXOF, CS_INDEXOF);
		RegisterMethod(@TMENUITEM.GETIMAGELIST, CS_GETIMAGELIST);
		RegisterMethod(@TMENUITEM.GETPARENTCOMPONENT, CS_GETPARENTCOMPONENT);
		RegisterMethod(@TMENUITEM.GETPARENTMENU, CS_GETPARENTMENU);
		RegisterMethod(@TMENUITEM.HASPARENT, CS_HASPARENT);
		RegisterMethod(@TMENUITEM.ADD, CS_ADD);
		RegisterMethod(@TMENUITEM.REMOVE, CS_REMOVE);
{$IFNDEF FPC}
		RegisterPropertyHelper(@TMENUITEMAUTOHOTKEYS_R,@TMENUITEMAUTOHOTKEYS_W,CS_AUTOHOTKEYS);
		RegisterPropertyHelper(@TMENUITEMAUTOLINEREDUCTION_R,@TMENUITEMAUTOLINEREDUCTION_W,CS_AUTOLINEREDUCTION);
		RegisterEventPropertyHelper(@TMENUITEMONDRAWITEM_R,@TMENUITEMONDRAWITEM_W,CS_ONDRAWITEM);
		RegisterEventPropertyHelper(@TMENUITEMONADVANCEDDRAWITEM_R,@TMENUITEMONADVANCEDDRAWITEM_W,CS_ONADVANCEDDRAWITEM);
		RegisterEventPropertyHelper(@TMENUITEMONMEASUREITEM_R,@TMENUITEMONMEASUREITEM_W,CS_ONMEASUREITEM);
{$ENDIF}
		RegisterPropertyHelper(@TMENUITEMCOMMAND_R,nil,CS_COMMAND);
		RegisterPropertyHelper(@TMENUITEMHANDLE_R,nil,CS_HANDLE);
		RegisterPropertyHelper(@TMENUITEMCOUNT_R,nil,CS_COUNT);
		RegisterPropertyHelper(@TMENUITEMITEMS_R,nil,CS_ITEMS);
		RegisterPropertyHelper(@TMENUITEMMENUINDEX_R,@TMENUITEMMENUINDEX_W,CS_MENUINDEX);
		RegisterPropertyHelper(@TMENUITEMPARENT_R,nil,CS_PARENT);
		RegisterPropertyHelper(@TMENUITEMACTION_R,@TMENUITEMACTION_W,CS_ACTION);
		RegisterPropertyHelper(@TMENUITEMBITMAP_R,@TMENUITEMBITMAP_W,CS_BITMAP);
		RegisterPropertyHelper(@TMENUITEMCAPTION_R,@TMENUITEMCAPTION_W,CS_CAPTION);
		RegisterPropertyHelper(@TMENUITEMCHECKED_R,@TMENUITEMCHECKED_W,CS_CHECKED);
		RegisterPropertyHelper(@TMENUITEMSUBMENUIMAGES_R,@TMENUITEMSUBMENUIMAGES_W,CS_SUBMENUIMAGES);
		RegisterPropertyHelper(@TMENUITEMDEFAULT_R,@TMENUITEMDEFAULT_W,CS_DEFAULT);
		RegisterPropertyHelper(@TMENUITEMENABLED_R,@TMENUITEMENABLED_W,CS_ENABLED);
		RegisterPropertyHelper(@TMENUITEMGROUPINDEX_R,@TMENUITEMGROUPINDEX_W,CS_GROUPINDEX);
		RegisterPropertyHelper(@TMENUITEMHELPCONTEXT_R,@TMENUITEMHELPCONTEXT_W,CS_HELPCONTEXT);
		RegisterPropertyHelper(@TMENUITEMHINT_R,@TMENUITEMHINT_W,CS_HINT);
		RegisterPropertyHelper(@TMENUITEMIMAGEINDEX_R,@TMENUITEMIMAGEINDEX_W,CS_IMAGEINDEX);
		RegisterPropertyHelper(@TMENUITEMRADIOITEM_R,@TMENUITEMRADIOITEM_W,CS_RADIOITEM);
		RegisterPropertyHelper(@TMENUITEMSHORTCUT_R,@TMENUITEMSHORTCUT_W,CS_SHORTCUT);
		RegisterPropertyHelper(@TMENUITEMVISIBLE_R,@TMENUITEMVISIBLE_W,CS_VISIBLE);
		RegisterEventPropertyHelper(@TMENUITEMONCLICK_R,@TMENUITEMONCLICK_W,CS_ONCLICK);
	end;
end;

procedure RIRegister_Menus(CL: TPSRuntimeClassImporter);
begin
	RIRegisterTMENUITEM(Cl);
	RIRegisterTMENU(Cl);
	RIRegisterTPOPUPMENU(Cl);
	RIRegisterTMAINMENU(Cl);
	{$IFNDEF FPC}
	RIRegisterTPOPUPLIST(Cl);
	RIRegisterTMENUITEMSTACK(Cl);
	{$ENDIF}
end;

end.
