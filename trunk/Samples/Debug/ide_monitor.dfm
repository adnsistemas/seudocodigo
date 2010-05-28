object VMonitorForm: TVMonitorForm
  Left = 555
  Top = 38
  AutoScroll = False
  Caption = 'Monitor'
  ClientHeight = 447
  ClientWidth = 585
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TSynMemo
    Left = 0
    Top = 0
    Width = 585
    Height = 447
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Pitch = fpFixed
    Font.Style = []
    TabOrder = 1
    OnEnter = Memo1Enter
    BookMarkOptions.DrawBookmarksFirst = False
    BookMarkOptions.EnableKeys = False
    BookMarkOptions.GlyphsVisible = False
    BorderStyle = bsNone
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.Visible = False
    Options = [eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol]
    ReadOnly = True
    RightEdgeColor = clNone
    ScrollBars = ssVertical
    WantReturns = False
  end
  object Edit1: TEdit
    Left = 32
    Top = 8
    Width = 121
    Height = 13
    BorderStyle = bsNone
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 75
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
    OnKeyDown = Edit1KeyDown
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object MoveTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = MoveTimerTimer
    Left = 144
    Top = 56
  end
  object DelayTimer: TTimer
    Enabled = False
    OnTimer = DelayTimerTimer
    Left = 120
    Top = 120
  end
end
