object FormConfiguracion: TFormConfiguracion
  Left = 323
  Top = 151
  Width = 555
  Height = 486
  Caption = 'Configuración'
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
    Left = 448
    Top = 0
    Width = 91
    Height = 450
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
    Width = 448
    Height = 450
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Directorios'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 440
        Height = 422
        Align = alClient
        Caption = 'Orden de búsqueda de archivos'
        TabOrder = 0
        object OrdenBusquedaMemo: TMemo
          Left = 2
          Top = 15
          Width = 436
          Height = 405
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
