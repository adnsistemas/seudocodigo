object LocalizarForm: TLocalizarForm
  Left = 266
  Top = 122
  Width = 321
  Height = 155
  ActiveControl = Edit1
  Caption = 'Localizar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 305
    Height = 119
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      'Texto'
      'Línea')
    TabIndex = 0
    OnChange = TabControl1Change
    object Panel2: TPanel
      Left = 4
      Top = 24
      Width = 185
      Height = 91
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 40
        Width = 185
        Height = 51
        Align = alBottom
        Caption = 'Dirección'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Arriba'
          'Abajo')
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 8
        Top = 8
        Width = 159
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 189
      Top = 24
      Width = 112
      Height = 91
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Button2: TButton
        Left = 24
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Siguiente'
        Default = True
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 24
        Top = 59
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Cancel = True
        Caption = '&Cerrar'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
end
