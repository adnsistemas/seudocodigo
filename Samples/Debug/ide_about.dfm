object AcercaForm: TAcercaForm
  Left = 192
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Acerca de Seudocódigo'
  ClientHeight = 242
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 467
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'Programa de distribución libre, bajo licencia Mozilla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 0
    Top = 20
    Width = 467
    Height = 20
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Desarrollado por la cátedra de Algoritmos y Estructuras de Datos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 0
    Top = 40
    Width = 467
    Height = 20
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Universidad Tecnológica Nacional - Facultad Regional Mendoza'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 0
    Top = 60
    Width = 467
    Height = 24
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Argentina - 2009'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Tag = 1
    Left = 0
    Top = 124
    Width = 467
    Height = 20
    Cursor = crHandPoint
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Basado en Rem Objects Pascal Script'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    WordWrap = True
    OnClick = Label7Click
  end
  object Label6: TLabel
    Tag = 2
    Left = 0
    Top = 144
    Width = 467
    Height = 20
    Cursor = crHandPoint
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Basado en SynHighlighterPas de SynEdit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    WordWrap = True
    OnClick = Label7Click
  end
  object Label7: TLabel
    Left = 0
    Top = 84
    Width = 467
    Height = 40
    Cursor = crHandPoint
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'www.frm.utn.edu.ar/algoritmos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    WordWrap = True
    OnClick = Label7Click
  end
  object Label10: TLabel
    Tag = 3
    Left = 0
    Top = 164
    Width = 467
    Height = 20
    Cursor = crHandPoint
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Proyecto Google Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    WordWrap = True
    OnClick = Label7Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 467
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label8: TLabel
      Left = 0
      Top = 0
      Width = 467
      Height = 24
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Versión 1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Panel2: TPanel
      Left = 0
      Top = 24
      Width = 467
      Height = 17
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Contacto:'
      TabOrder = 1
      object Label9: TLabel
        Tag = 3
        Left = 56
        Top = 0
        Width = 153
        Height = 17
        Cursor = crHandPoint
        AutoSize = False
        Caption = 'dabdala@frm.utn.edu.ar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
        WordWrap = True
        OnClick = Label7Click
      end
    end
    object Button1: TButton
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
end
