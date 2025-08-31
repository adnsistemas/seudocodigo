object AyudaForm: TAyudaForm
  Left = 0
  Top = 0
  Caption = 'Ayuda'
  ClientHeight = 311
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 201
    Top = 0
    Height = 311
    ExplicitLeft = 400
    ExplicitTop = -8
  end
  inline ArbolEstructuraFrame1: TArbolEstructuraFrame
    Left = 0
    Top = 0
    Width = 201
    Height = 311
    Align = alLeft
    TabOrder = 0
    ExplicitWidth = 201
    ExplicitHeight = 311
    inherited TreeView: TTreeView
      Width = 201
      Height = 311
      OnDblClick = TreeView1DblClick
      OnKeyDown = TreeView1KeyDown
      ExplicitTop = 0
      ExplicitWidth = 201
    end
  end
  inline ContenidoAyudaFrame1: TContenidoAyudaFrame
    Left = 204
    Top = 0
    Width = 310
    Height = 311
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 204
    ExplicitWidth = 310
    ExplicitHeight = 311
    inherited RichEdit: TRichEdit
      Width = 310
      Height = 311
      ScrollBars = ssVertical
      ExplicitWidth = 310
      ExplicitHeight = 311
    end
  end
end
