object evaluator: Tevaluator
  Left = 192
  Top = 122
  Width = 323
  Height = 293
  Caption = 'Evaluador de Expresiones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 152
    Width = 307
    Height = 105
    Align = alBottom
    Caption = 'Nuevo valor'
    TabOrder = 0
    object MemoNuevo: TMemo
      Left = 2
      Top = 15
      Width = 303
      Height = 88
      Align = alClient
      Lines.Strings = (
        'MemoNuevo')
      TabOrder = 0
      WantReturns = False
      OnKeyDown = MemoNuevoKeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 307
    Height = 49
    Align = alTop
    Caption = 'Expresión'
    TabOrder = 1
    object EditVariable: TEdit
      Left = 8
      Top = 16
      Width = 217
      Height = 21
      TabOrder = 0
      Text = 'EditVariable'
      OnKeyDown = EditVariableKeyDown
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 49
    Width = 307
    Height = 103
    Align = alClient
    Caption = 'Valor actual'
    TabOrder = 2
    object MemoActual: TMemo
      Left = 2
      Top = 15
      Width = 303
      Height = 86
      TabStop = False
      Align = alClient
      Lines.Strings = (
        'MemoActual')
      ReadOnly = True
      TabOrder = 0
    end
  end
end
