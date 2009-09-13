
unit uPSR_graphics;
{$I PascalScript.inc}
interface
uses
  uPSRuntime, uPSUtils;



procedure RIRegisterTGRAPHICSOBJECT(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTFont(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPEN(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTBRUSH(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCanvas(cl: TPSRuntimeClassImporter);
procedure RIRegisterTGraphic(CL: TPSRuntimeClassImporter);
procedure RIRegisterTBitmap(CL: TPSRuntimeClassImporter; Streams: Boolean);

procedure RIRegister_Graphics(Cl: TPSRuntimeClassImporter; Streams: Boolean);

implementation

uses langdef
{$IFNDEF FPC}
  ,Classes{$IFDEF CLX}, QGraphics{$ELSE}, Windows, Graphics{$ENDIF}
{$ELSE}
  ,Classes, Graphics,LCLType
{$ENDIF};

{$IFNDEF CLX}
procedure TFontHandleR(Self: TFont; var T: Longint); begin T := Self.Handle; end;
procedure TFontHandleW(Self: TFont; T: Longint); begin Self.Handle := T; end;
{$ENDIF}
procedure TFontPixelsPerInchR(Self: TFont; var T: Longint); begin T := Self.PixelsPerInch; end;
procedure TFontPixelsPerInchW(Self: TFont; T: Longint); begin {$IFNDEF FPC} Self.PixelsPerInch := T;{$ENDIF} end;
procedure TFontStyleR(Self: TFont; var T: TFontStyles); begin T := Self.Style; end;
procedure TFontStyleW(Self: TFont; T: TFontStyles); begin Self.Style:= T; end;

procedure RIRegisterTFont(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TFont) do
  begin
    RegisterConstructor(@TFont.Create, CS_CREATE);
{$IFNDEF CLX}
    RegisterPropertyHelper(@TFontHandleR, @TFontHandleW, CS_HANDLE);
{$ENDIF}
    RegisterPropertyHelper(@TFontPixelsPerInchR, @TFontPixelsPerInchW, CS_PIXELSPERINCH);
    RegisterPropertyHelper(@TFontStyleR, @TFontStyleW, CS_STYLE);
  end;
end;
{$IFNDEF CLX}
procedure TCanvasHandleR(Self: TCanvas; var T: Longint); begin T := Self.Handle; end;
procedure TCanvasHandleW(Self: TCanvas; T: Longint); begin Self.Handle:= T; end;
{$ENDIF}

procedure TCanvasPixelsR(Self: TCanvas; var T: Longint; X,Y: Longint); begin T := Self.Pixels[X,Y]; end;
procedure TCanvasPixelsW(Self: TCanvas; T, X, Y: Longint); begin Self.Pixels[X,Y]:= T; end;

procedure RIRegisterTCanvas(cl: TPSRuntimeClassImporter); // requires TPersistent
begin
  with Cl.Add(TCanvas) do
  begin
{$IFNDEF FPC}
    RegisterMethod(@TCanvas.Arc, CS_ARC);
    RegisterMethod(@TCanvas.Chord, CS_CHORD);
    RegisterMethod(@TCanvas.Rectangle, CS_RECTANGLE);
    RegisterMethod(@TCanvas.RoundRect, CS_ROUNDRECT);
    RegisterMethod(@TCanvas.Ellipse, CS_ELLIPSE);
    RegisterMethod(@TCanvas.FillRect, CS_FILLRECT);
{$ENDIF}
    RegisterMethod(@TCanvas.Draw, CS_DRAW);
{$IFNDEF CLX}
    RegisterMethod(@TCanvas.FloodFill, CS_FLOODFILL);
{$ENDIF}
    RegisterMethod(@TCanvas.Lineto, CS_LINETO);
    RegisterMethod(@TCanvas.Moveto, CS_MOVETO);
    RegisterMethod(@TCanvas.Pie, CS_PIE);
    RegisterMethod(@TCanvas.Refresh, CS_REFRESH);
    RegisterMethod(@TCanvas.TextHeight, CS_TEXTHEIGHT);
    RegisterMethod(@TCanvas.TextOut, CS_TEXTOUT);
    RegisterMethod(@TCanvas.TextWidth, CS_TEXTWIDTH);
{$IFNDEF CLX}
    RegisterPropertyHelper(@TCanvasHandleR, @TCanvasHandleW, CS_HANDLE);
{$ENDIF}
    RegisterPropertyHelper(@TCanvasPixelsR, @TCanvasPixelsW, CS_PIXELS);
  end;
end;


procedure TGRAPHICSOBJECTONCHANGE_W(Self: TGraphicsObject; T: TNotifyEvent); begin Self.OnChange := t; end;
procedure TGRAPHICSOBJECTONCHANGE_R(Self: TGraphicsObject; var T: TNotifyEvent); begin T :=Self.OnChange; end;


procedure RIRegisterTGRAPHICSOBJECT(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TGRAPHICSOBJECT) do
  begin
    RegisterPropertyHelper(@TGRAPHICSOBJECTONCHANGE_R, @TGRAPHICSOBJECTONCHANGE_W, CS_ONCHANGE);
  end;
end;

procedure RIRegisterTPEN(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPEN) do
  begin
    RegisterConstructor(@TPEN.CREATE, CS_CREATE);
  end;
end;

procedure RIRegisterTBRUSH(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBRUSH) do
  begin
    RegisterConstructor(@TBRUSH.CREATE, CS_CREATE);
  end;
end;

procedure TGraphicOnChange_W(Self: TGraphic; const T: TNotifyEvent); begin Self.OnChange := T; end;
procedure TGraphicOnChange_R(Self: TGraphic; var T: TNotifyEvent); begin T := Self.OnChange; end;
procedure TGraphicWidth_W(Self: TGraphic; const T: Integer); begin Self.Width := T; end;
procedure TGraphicWidth_R(Self: TGraphic; var T: Integer); begin T := Self.Width; end;
procedure TGraphicModified_W(Self: TGraphic; const T: Boolean); begin Self.Modified := T; end;
procedure TGraphicModified_R(Self: TGraphic; var T: Boolean); begin T := Self.Modified; end;
procedure TGraphicHeight_W(Self: TGraphic; const T: Integer); begin Self.Height := T; end;
procedure TGraphicHeight_R(Self: TGraphic; var T: Integer); begin T := Self.Height; end;
procedure TGraphicEmpty_R(Self: TGraphic; var T: Boolean); begin T := Self.Empty; end;

procedure RIRegisterTGraphic(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TGraphic) do
  begin
    RegisterVirtualConstructor(@TGraphic.Create, CS_Create);
    RegisterVirtualMethod(@TGraphic.LoadFromFile, CS_LoadFromFile);
    RegisterVirtualMethod(@TGraphic.SaveToFile, CS_SaveToFile);
    RegisterPropertyHelper(@TGraphicEmpty_R,nil,CS_Empty);
    RegisterPropertyHelper(@TGraphicHeight_R,@TGraphicHeight_W,CS_Height);
    RegisterPropertyHelper(@TGraphicWidth_R,@TGraphicWidth_W,CS_Width);
    RegisterPropertyHelper(@TGraphicOnChange_R,@TGraphicOnChange_W,CS_OnChange);

    {$IFNDEF PS_MINIVCL}
    RegisterPropertyHelper(@TGraphicModified_R,@TGraphicModified_W,CS_Modified);
    {$ENDIF}
  end;
end;

procedure TBitmapTransparentColor_R(Self: TBitmap; var T: TColor); begin T := Self.TransparentColor; end;
{$IFNDEF CLX}
{$IFNDEF FPC}
procedure TBitmapIgnorePalette_W(Self: TBitmap; const T: Boolean); begin Self.IgnorePalette := T; end;
procedure TBitmapIgnorePalette_R(Self: TBitmap; var T: Boolean); begin T := Self.IgnorePalette; end;
{$ENDIF}
procedure TBitmapPalette_W(Self: TBitmap; const T: HPALETTE); begin Self.Palette := T; end;
procedure TBitmapPalette_R(Self: TBitmap; var T: HPALETTE); begin T := Self.Palette; end;
{$ENDIF}
procedure TBitmapMonochrome_W(Self: TBitmap; const T: Boolean); begin Self.Monochrome := T; end;
procedure TBitmapMonochrome_R(Self: TBitmap; var T: Boolean); begin T := Self.Monochrome; end;
{$IFNDEF CLX}
procedure TBitmapHandle_W(Self: TBitmap; const T: HBITMAP); begin Self.Handle := T; end;
procedure TBitmapHandle_R(Self: TBitmap; var T: HBITMAP); begin T := Self.Handle; end;
{$ENDIF}
procedure TBitmapCanvas_R(Self: TBitmap; var T: TCanvas); begin T := Self.Canvas; end;

procedure RIRegisterTBitmap(CL: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with CL.Add(TBitmap) do
  begin
    if Streams then begin
      RegisterMethod(@TBitmap.LoadFromStream, CS_LoadFromStream);
      RegisterMethod(@TBitmap.SaveToStream, CS_SaveToStream);
    end;
    RegisterPropertyHelper(@TBitmapCanvas_R,nil,CS_Canvas);
{$IFNDEF CLX}
    RegisterPropertyHelper(@TBitmapHandle_R,@TBitmapHandle_W,CS_Handle);
{$ENDIF}

    {$IFNDEF PS_MINIVCL}
{$IFNDEF FPC}
    RegisterMethod(@TBitmap.Dormant, CS_Dormant);
{$ENDIF}
    RegisterMethod(@TBitmap.FreeImage, CS_FreeImage);
{$IFNDEF CLX}
    RegisterMethod(@TBitmap.LoadFromClipboardFormat, CS_LoadFromClipboardFormat);
{$ENDIF}
    RegisterMethod(@TBitmap.LoadFromResourceName, CS_LoadFromResourceName);
    RegisterMethod(@TBitmap.LoadFromResourceID, CS_LoadFromResourceID);
{$IFNDEF CLX}
    RegisterMethod(@TBitmap.ReleaseHandle, CS_ReleaseHandle);
    RegisterMethod(@TBitmap.ReleasePalette, CS_ReleasePalette);
    RegisterMethod(@TBitmap.SaveToClipboardFormat, CS_SaveToClipboardFormat);
    RegisterPropertyHelper(@TBitmapMonochrome_R,@TBitmapMonochrome_W,CS_Monochrome);
    RegisterPropertyHelper(@TBitmapPalette_R,@TBitmapPalette_W,CS_Palette);
{$IFNDEF FPC}
    RegisterPropertyHelper(@TBitmapIgnorePalette_R,@TBitmapIgnorePalette_W,CS_IgnorePalette);
{$ENDIF}
{$ENDIF}
    RegisterPropertyHelper(@TBitmapTransparentColor_R,nil,CS_TransparentColor);
    {$ENDIF}
  end;
end;

procedure RIRegister_Graphics(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  RIRegisterTGRAPHICSOBJECT(cl);
  RIRegisterTFont(Cl);
  RIRegisterTCanvas(cl);
  RIRegisterTPEN(cl);
  RIRegisterTBRUSH(cl);
  RIRegisterTGraphic(CL);
  RIRegisterTBitmap(CL, Streams);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.





