{
  RichOle.pas

  Pascal version of richole.h (version: 2005 platform SDK).

  Version 1.3b - always find the most current version at
  http://flocke.vssd.de/prog/code/pascal/rtflabel/

  Copyright (C) 2001-2007 Volker Siebert <flocke@vssd.de>
  All rights reserved.

  Permission is hereby granted, free of charge, to any person obtaining a
  copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation
  the rights to use, copy, modify, merge, publish, distribute, sublicense,
  and/or sell copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.
}

unit RichOle;

interface

{$WEAKPACKAGEUNIT}
{$MINENUMSIZE 4}

uses
  Windows, ActiveX, RichEdit;

(*
 *      RICHOLE.H
 *
 *      Purpose:
 *              OLE Extensions to the Rich Text Editor
 *
 *      Copyright (c) 1985-1999, Microsoft Corporation
 *)

// Structure passed to GetObject and InsertObject
type
  PReObject = ^TReObject;
  {$EXTERNALSYM _REOBJECT}
  _REOBJECT = packed record
    cbStruct: DWORD;            // [00] Size of structure
    cp: LongInt;                // [04] Character position of object
    clsid: TCLSID;              // [08] Class ID of object
    oleobj: IOleObject;         // [18] OLE object interface
    stg: IStorage;              // [1C] Associated storage interface
    olesite: IOLEClientSite;    // [20] Associated client site interface
    sizel: TSize;               // [24] Size of object (may be 0,0)
    dvaspect: DWORD;            // [2C] Display aspect to use
    dwFlags: DWORD;             // [30] Object status flags
    dwUser: DWORD;              // [34] Dword for user's use
  end;
  {$EXTERNALSYM REOBJECT}
  REOBJECT = _reobject;
  TReObject = _reobject;

const
  // Flags to specify which interfaces should
  // be returned in the structure above
  {$EXTERNALSYM REO_GETOBJ_NO_INTERFACES}
  REO_GETOBJ_NO_INTERFACES  = $00000000;
  {$EXTERNALSYM REO_GETOBJ_POLEOBJ}
  REO_GETOBJ_POLEOBJ        = $00000001;
  {$EXTERNALSYM REO_GETOBJ_PSTG}
  REO_GETOBJ_PSTG           = $00000002;
  {$EXTERNALSYM REO_GETOBJ_POLESITE}
  REO_GETOBJ_POLESITE       = $00000004;
  {$EXTERNALSYM REO_GETOBJ_ALL_INTERFACES}
  REO_GETOBJ_ALL_INTERFACES = $00000007;

  // Place object at selection
  {$EXTERNALSYM REO_CP_SELECTION}
  REO_CP_SELECTION          = -1;  // why? cardinal(-1);

  // Use character position to specify object instead of index
  {$EXTERNALSYM REO_IOB_SELECTION}
  REO_IOB_SELECTION         = -1;  // why? cardinal(-1);
  {$EXTERNALSYM REO_IOB_USE_CP}
  REO_IOB_USE_CP            = -2;  // why? cardinal(-2);

  // Object flags
  {$EXTERNALSYM REO_NULL}
  REO_NULL                  = $00000000;  // No flags
  {$EXTERNALSYM REO_READWRITEMASK}
  REO_READWRITEMASK         = $0000003F;  // Mask out RO bits
  {$EXTERNALSYM REO_DONTNEEDPALETTE}
  REO_DONTNEEDPALETTE       = $00000020;  // Object doesn't need palette
  {$EXTERNALSYM REO_BLANK}
  REO_BLANK                 = $00000010;  // Object is blank
  {$EXTERNALSYM REO_DYNAMICSIZE}
  REO_DYNAMICSIZE           = $00000008;  // Object defines size always
  {$EXTERNALSYM REO_INVERTEDSELECT}
  REO_INVERTEDSELECT        = $00000004;  // Object drawn all inverted if sel
  {$EXTERNALSYM REO_BELOWBASELINE}
  REO_BELOWBASELINE         = $00000002;  // Object sits below the baseline
  {$EXTERNALSYM REO_RESIZABLE}
  REO_RESIZABLE             = $00000001;  // Object may be resized
  {$EXTERNALSYM REO_LINK}
  REO_LINK                  = $80000000;  // Object is a link (RO)
  {$EXTERNALSYM REO_STATIC}
  REO_STATIC                = $40000000;  // Object is static (RO)
  {$EXTERNALSYM REO_SELECTED}
  REO_SELECTED              = $08000000;  // Object selected (RO)
  {$EXTERNALSYM REO_OPEN}
  REO_OPEN                  = $04000000;  // Object open in its server (RO)
  {$EXTERNALSYM REO_INPLACEACTIVE}
  REO_INPLACEACTIVE         = $02000000;  // Object in place active (RO)
  {$EXTERNALSYM REO_HILITED}
  REO_HILITED               = $01000000;  // Object is to be hilited (RO)
  {$EXTERNALSYM REO_LINKAVAILABLE}
  REO_LINKAVAILABLE         = $00800000;  // Link believed available (RO)
  {$EXTERNALSYM REO_GETMETAFILE}
  REO_GETMETAFILE           = $00400000;  // Object requires metafile (RO)

  // flags for IRichEditOle::GetClipboardData(),
  // IRichEditOleCallback::GetClipboardData() and
  // IRichEditOleCallback::QueryAcceptData()
  {$EXTERNALSYM RECO_PASTE}
  RECO_PASTE                = $00000000;  // paste from clipboard
  {$EXTERNALSYM RECO_DROP}
  RECO_DROP                 = $00000001;  // drop
  {$EXTERNALSYM RECO_COPY}
  RECO_COPY                 = $00000002;  // copy to the clipboard
  {$EXTERNALSYM RECO_CUT}
  RECO_CUT                  = $00000003;  // cut to the clipboard
  {$EXTERNALSYM RECO_DRAG}
  RECO_DRAG                 = $00000004;  // drag

type
  (*
   * IRichEditOle
   *
   * Purpose:
   *   Interface used by the client of RichEdit to perform OLE-related
   *   operations.
   *
   * //$ REVIEW:
   *   The methods herein may just want to be regular Windows messages.
   *)
  {$EXTERNALSYM IRichEditOle}
  IRichEditOle = interface(IUnknown)
    ['{00020D00-0000-0000-C000-000000000046}']
    // *** IRichEditOle methods ***
    function GetClientSite(out clientSite: IOleClientSite): HRESULT; stdcall;
    function GetObjectCount: LongInt; stdcall;
    function GetLinkCount: LongInt; stdcall;
    function GetObject(iob: LongInt; out ReObject: TReObject;
      dwFlags: DWORD): HRESULT; stdcall;
    function InsertObject(var ReObject: TReObject): HRESULT; stdcall;
    function ConvertObject(iob: LongInt; const clsidNew: TCLSID;
      lpStrUserTypeNew: LPCSTR): HRESULT; stdcall;
    function ActivateAs(const clsid, clsidAs: TCLSID): HRESULT; stdcall;
    function SetHostNames(lpstrContainerApp: LPCSTR;
      lpstrContainerObj: LPCSTR): HRESULT; stdcall;
    function SetLinkAvailable(iob: LongInt; fAvailable: BOOL): HRESULT; stdcall;
    function SetDvaspect(iob: LongInt; dvaspect: DWORD): HRESULT; stdcall;
    function HandsOffStorage(iob: LongInt): HRESULT; stdcall;
    function SaveCompleted(iob: LongInt; const stg: IStorage): HRESULT; stdcall;
    function InPlaceDeactivate: HRESULT; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HRESULT; stdcall;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
      out dataobj: IDataObject): HRESULT; stdcall;
    function ImportDataObject(const dataobj: IDataObject; cf: TClipFormat;
      hMetaPict: HGLOBAL): HRESULT; stdcall;
  end;

  (*
   * IRichEditOleCallback
   *
   * Purpose:
   *   Interface used by the RichEdit to get OLE-related stuff from the
   *   application using RichEdit.
   *)
  {$EXTERNALSYM IRichEditOleCallback}
  IRichEditOleCallback = interface(IUnknown)
    ['{00020D03-0000-0000-C000-000000000046}']
    // *** IRichEditOleCallback methods ***
    function GetNewStorage(out stg: IStorage): HRESULT; stdcall;
    function GetInPlaceContext(out Frame: IOleInPlaceFrame;
      out Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HRESULT; stdcall;
    function ShowContainerUI(fShow: BOOL): HRESULT; stdcall;
    function QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
      cp: LongInt): HRESULT; stdcall;
    function DeleteObject(const oleobj: IOleObject): HRESULT; stdcall;
    function QueryAcceptData(const dataobj: IDataObject;
      var cfFormat: TClipFormat; reco: DWORD; fReally: BOOL;
      hMetaPict: HGLOBAL): HRESULT; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HRESULT; stdcall;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
      out dataobj: IDataObject): HRESULT; stdcall;
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
      var dwEffect: DWORD): HRESULT; stdcall;
    function GetContextMenu(seltype: Word; oleobj: IOleObject;
      const chrg: TCharRange; var menu: HMENU): HRESULT; stdcall;
  end;

const
  IID_IRichEditOle: TGUID = '{00020D00-0000-0000-C000-000000000046}';
  IID_IRichEditOleCallback: TGUID = '{00020D03-0000-0000-C000-000000000046}';

{$EXTERNALSYM RichEdit_SetOleCallback}
function RichEdit_SetOleCallback(Wnd: HWND;
  const Intf: IRichEditOleCallback): Boolean;
{$EXTERNALSYM RichEdit_GetOleInterface}
function RichEdit_GetOleInterface(Wnd: HWND; out Intf: IRichEditOle): Boolean;

implementation

function RichEdit_SetOleCallback(Wnd: HWND;
  const Intf: IRichEditOleCallback): Boolean;
begin
  Result := SendMessage(Wnd, EM_SETOLECALLBACK, 0, LongInt(Intf)) <> 0;
end;

function RichEdit_GetOleInterface(Wnd: HWND; out Intf: IRichEditOle): Boolean;
begin
  Result := SendMessage(Wnd, EM_GETOLEINTERFACE, 0, LongInt(@Intf)) <> 0;
end;

end.
