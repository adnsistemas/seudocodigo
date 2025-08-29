object FormConfiguracion: TFormConfiguracion
  Left = 86
  Top = 71
  Caption = 'Configuraci'#243'n'
  ClientHeight = 291
  ClientWidth = 547
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
  object Panel1: TPanel
    Left = 456
    Top = 0
    Width = 91
    Height = 291
    Align = alRight
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 456
    Height = 291
    ActivePage = TabSheet2
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = 'General'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CheckBox1: TCheckBox
        Left = 16
        Top = 8
        Width = 401
        Height = 25
        Caption = 'Ocultar Monitor al finalizar la ejecuci'#243'n'
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Directorios'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 448
        Height = 263
        Align = alClient
        Caption = 'Orden de b'#250'squeda de archivos'
        TabOrder = 0
        object OrdenBusquedaMemo: TMemo
          Left = 2
          Top = 15
          Width = 444
          Height = 246
          Align = alClient
          Lines.Strings = (
            'subprogramas'
            'te')
          TabOrder = 0
        end
      end
    end
  end
end
