object AyudaForm: TAyudaForm
  Left = 0
  Top = 0
  Caption = 'Ayuda Seudoc'#243'digo'
  ClientHeight = 311
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 177
    Top = 0
    Height = 311
    ExplicitLeft = 256
    ExplicitTop = 200
    ExplicitHeight = 100
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 177
    Height = 311
    Align = alLeft
    Indent = 19
    TabOrder = 0
  end
  object RichEdit1: TRichEdit
    Left = 180
    Top = 0
    Width = 334
    Height = 311
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    Zoom = 100
  end
end
