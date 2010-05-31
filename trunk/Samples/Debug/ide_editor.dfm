object editor: Teditor
  Left = 150
  Top = 98
  Width = 718
  Height = 498
  Caption = 
    'Seudocódigo  - Universidad Tecnológica Nacional - Facultad Regio' +
    'nal Mendoza'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 319
    Width = 710
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Splitter2: TSplitter
    Left = 185
    Top = 0
    Width = 3
    Height = 319
    Cursor = crHSplit
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 433
    Width = 710
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 400
      end>
    SimplePanel = False
    OnResize = StatusBar1Resize
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 322
    Width = 710
    Height = 111
    ActivePage = TabSheet1
    Align = alBottom
    DockSite = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Información'
      object messages: TListBox
        Left = 0
        Top = 0
        Width = 702
        Height = 83
        TabStop = False
        Align = alClient
        ItemHeight = 13
        PopupMenu = PopupMenu4
        TabOrder = 0
        OnDblClick = messagesDblClick
        OnKeyDown = messagesKeyDown
      end
    end
  end
  object PageControl: TPageControl
    Left = 188
    Top = 0
    Width = 522
    Height = 319
    Align = alClient
    PopupMenu = PopupMenu3
    TabOrder = 2
    OnChange = PageControlChange
  end
  object ed: TSynEdit
    Left = 236
    Top = 72
    Width = 349
    Height = 209
    HelpContext = 102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    PopupMenu = PopupMenu1
    TabOrder = 3
    Visible = False
    OnEnter = edEnter
    OnKeyDown = edKeyDown
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Terminal'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 8
    Gutter.ShowLineNumbers = True
    Highlighter = SynSeudocSyn1
    Lines.Strings = (
      'programa Ejemplo'
      'inicio'
      'fin_programa.')
    Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
    SearchEngine = SynEditSearch1
    TabWidth = 2
    WantTabs = True
    OnGutterClick = edGutterClick
    OnSpecialLineColors = edSpecialLineColors
    OnStatusChange = edStatusChange
    RemovedKeystrokes = <
      item
        Command = ecContextHelp
        ShortCut = 112
      end>
    AddedKeystrokes = <
      item
        Command = ecContextHelp
        ShortCut = 16496
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 319
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 4
    object WatchPanel: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 319
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      OnResize = WatchPanelResize
      object Splitter3: TSplitter
        Left = 0
        Top = 211
        Width = 185
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Splitter4: TSplitter
        Left = 0
        Top = 103
        Width = 185
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object ListBox1: TListBox
        Left = 0
        Top = 49
        Width = 185
        Height = 54
        Align = alClient
        ItemHeight = 13
        PopupMenu = PopupMenu2
        TabOrder = 0
        OnDblClick = ListBox1DblClick
        OnKeyDown = ListBox1KeyDown
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 49
        Align = alTop
        Caption = 'Inspección'
        TabOrder = 1
        object Edit1: TEdit
          Left = 8
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyDown = Edit1KeyDown
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 106
        Width = 185
        Height = 105
        Align = alBottom
        Caption = 'Variables locales'
        TabOrder = 2
        object MemoLocales: TMemo
          Left = 2
          Top = 33
          Width = 181
          Height = 70
          Align = alClient
          BorderStyle = bsNone
          Lines.Strings = (
            'No disponibles')
          ParentColor = True
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          OnDblClick = MemoLocalesDblClick
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 181
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object CheckBox1: TCheckBox
            Left = 8
            Top = 1
            Width = 161
            Height = 17
            Action = MLocales
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 214
        Width = 185
        Height = 105
        Align = alBottom
        Caption = 'Variables globales'
        TabOrder = 3
        object MemoGlobales: TMemo
          Left = 2
          Top = 33
          Width = 181
          Height = 70
          Align = alClient
          BorderStyle = bsNone
          Lines.Strings = (
            'No disponibles')
          ParentColor = True
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          OnDblClick = MemoGlobalesDblClick
        end
        object Panel3: TPanel
          Left = 2
          Top = 15
          Width = 181
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object CheckBox2: TCheckBox
            Left = 8
            Top = 1
            Width = 161
            Height = 17
            Action = MGlobales
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
        end
      end
    end
  end
  object ce: TPSScriptDebugger
    CompilerOptions = [icAllowNoBegin, icAllowUnit, icAllowNoEnd, icBooleanShortCircuit]
    OnCompile = ceCompile
    OnExecute = ceExecute
    OnAfterExecute = ceAfterExecute
    Plugins = <
      item
        Plugin = IFPS3CE_DateUtils1
      end
      item
        Plugin = IFPS3CE_Std1
      end
      item
        Plugin = IFPS3CE_Controls1
      end
      item
        Plugin = IFPS3CE_StdCtrls1
      end
      item
        Plugin = IFPS3CE_Forms1
      end
      item
        Plugin = IFPS3DllPlugin1
      end
      item
        Plugin = IFPS3CE_ComObj1
      end>
    MainFileName = 'Sin Nombre'
    UsePreProcessor = False
    OnNeedFile = ceNeedFile
    OnFindUnknownFile = ceFindUnknownFile
    OnIntegerRead = ceIntegerRead
    OnRealRead = ceRealRead
    OnStringRead = ceStringRead
    OnCharRead = ceCharRead
    OnBooleanRead = ceBooleanRead
    OnCurrencyRead = ceCurrencyRead
    OnIntegerShow = ceIntegerShow
    OnRealShow = ceRealShow
    OnStringShow = ceStringShow
    OnCharShow = ceCharShow
    OnListShow = ceListShow
    OnBooleanShow = ceBooleanShow
    OnCurrencyShow = ceCurrencyShow
    OnReadShow = ceReadShow
    OnIdle = ceIdle
    OnLineInfo = ceLineInfo
    OnBreakpoint = ceBreakpoint
    Left = 592
    Top = 112
  end
  object IFPS3DllPlugin1: TPSDllPlugin
    Left = 560
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 592
    Top = 16
    object BreakPointMenu: TMenuItem
      Caption = 'Establecer/Quitar &Interrupción'
      ShortCut = 116
      OnClick = BreakPointMenuClick
    end
    object MostrarOcultarnmerosdelnea1: TMenuItem
      Caption = '&Mostrar/Ocultar números de línea'
      ShortCut = 123
      OnClick = MostrarOcultarnmerosdelnea1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Localizar1: TMenuItem
      Action = ABuscar
    end
  end
  object MainMenu1: TMainMenu
    Left = 592
    Top = 160
    object File1: TMenuItem
      Caption = '&Archivo'
      HelpContext = 101
      object New1: TMenuItem
        Caption = '&Nuevo'
        ShortCut = 16462
        OnClick = New1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Open1: TMenuItem
        Caption = '&Abrir'
        ShortCut = 16449
        OnClick = Open1Click
      end
      object Cerrar2: TMenuItem
        Caption = '&Cerrar'
        ShortCut = 16499
        OnClick = Cerrar1Click
      end
      object Save1: TMenuItem
        Caption = '&Guardar'
        ShortCut = 16455
        OnClick = Save1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Guardar &como'
        OnClick = Saveas1Click
      end
    end
    object Configuracin1: TMenuItem
      Caption = '&Configuración'
      HelpContext = 101
      OnClick = Configuracin1Click
    end
    object Run1: TMenuItem
      Caption = 'E&jecutar'
      HelpContext = 101
      object Run2: TMenuItem
        Action = AETodo
      end
      object Detener1: TMenuItem
        Action = ADetener
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object StepOver1: TMenuItem
        Action = AELinea
      end
      object StepInto1: TMenuItem
        Action = AEInstruccion
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Reset1: TMenuItem
        Action = AReiniciar
      end
    end
    object V1: TMenuItem
      Caption = 'V&er'
      HelpContext = 101
      object VariablesLocales1: TMenuItem
        Action = MLocales
      end
      object VariablesGlobales1: TMenuItem
        Tag = 1
        Action = MGlobales
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Evaluador1: TMenuItem
        Action = EVP
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SalidaDepuracin1: TMenuItem
        Tag = 2
        Action = ASalida
      end
      object Cortarlneaslargas1: TMenuItem
        Action = AWordWrap
      end
    end
    object Verificar1: TMenuItem
      Caption = '&Verificar'
      HelpContext = 101
      ShortCut = 117
      OnClick = Verificar1Click
    end
    object Ayuda1: TMenuItem
      Caption = 'A&yuda'
      HelpContext = 101
      object Seudocdigo1: TMenuItem
        Caption = '&Contenidos'
        OnClick = Seudocdigo1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Acercade1: TMenuItem
        Caption = 'A&cerca de ..'
        OnClick = Acercade1Click
      end
    end
    object Salir1: TMenuItem
      Caption = 'Sa&lir'
      HelpContext = 101
      OnClick = Salir1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'sdc'
    Filter = 'Seudocódigo|*.sdc'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 200
    Top = 104
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sdc'
    Filter = 'Seudocódigo|*.sdc|Cualquiera|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 168
    Top = 104
  end
  object IFPS3CE_Controls1: TPSImport_Controls
    EnableStreams = True
    EnableGraphics = True
    EnableControls = True
    Left = 328
    Top = 40
  end
  object IFPS3CE_DateUtils1: TPSImport_DateUtils
    Left = 328
    Top = 72
  end
  object IFPS3CE_Std1: TPSImport_Classes
    EnableStreams = True
    EnableClasses = True
    Left = 328
    Top = 104
  end
  object IFPS3CE_Forms1: TPSImport_Forms
    EnableForms = True
    EnableMenus = True
    Left = 328
    Top = 136
  end
  object IFPS3CE_StdCtrls1: TPSImport_StdCtrls
    EnableExtCtrls = True
    EnableButtons = True
    Left = 328
    Top = 168
  end
  object IFPS3CE_ComObj1: TPSImport_ComObj
    Left = 328
    Top = 200
  end
  object PSImport_DB1: TPSImport_DB
    Left = 328
    Top = 232
  end
  object SynSeudocSyn1: TSynSeudocSyn
    DefaultFilter = 
      'Pascal Files (*.pas;*.pp;*.dpr;*.dpk;*.inc)|*.pas;*.pp;*.dpr;*.d' +
      'pk;*.inc'
    CommentAttri.Foreground = clGray
    KeyAttri.Foreground = clNavy
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clPurple
    SymbolAttri.Foreground = clGreen
    InnerRoutineAttri.Foreground = clBlack
    InnerRoutineAttri.Style = [fsBold]
    AssignmentAttri.Foreground = clMaroon
    AssignmentAttri.Style = [fsBold]
    Left = 592
    Top = 64
  end
  object PopupMenu2: TPopupMenu
    Left = 56
    Top = 112
    object Quitar1: TMenuItem
      Caption = '&Quitar'
      OnClick = Quitar1Click
    end
    object Q1: TMenuItem
      Caption = 'Quitar &Todos'
      OnClick = Q1Click
    end
  end
  object ActionList1: TActionList
    Left = 384
    Top = 64
    object MLocales: TAction
      Caption = 'Variables &Locales'
      OnExecute = MLocalesExecute
    end
    object MGlobales: TAction
      Caption = 'Variables &Globales'
      OnExecute = MGlobalesExecute
    end
    object AWordWrap: TAction
      Caption = '&Cortar líneas largas'
      ShortCut = 49219
      OnExecute = AWordWrapExecute
      OnUpdate = AWordWrapUpdate
    end
    object AETodo: TAction
      Category = 'Ejecutar'
      Caption = '&Todo'
      ShortCut = 120
      OnExecute = AETodoExecute
      OnUpdate = AETodoUpdate
    end
    object AELinea: TAction
      Category = 'Ejecutar'
      Caption = '&Línea'
      ShortCut = 119
      OnExecute = AELineaExecute
      OnUpdate = AETodoUpdate
    end
    object AEInstruccion: TAction
      Tag = 1
      Category = 'Ejecutar'
      Caption = '&Instrucción'
      ShortCut = 118
      OnExecute = AELineaExecute
      OnUpdate = AETodoUpdate
    end
    object AReiniciar: TAction
      Category = 'Ejecutar'
      Caption = '&Reiniciar'
      ShortCut = 16497
      OnExecute = AReiniciarExecute
      OnUpdate = AReiniciarUpdate
    end
    object ASalida: TAction
      Caption = '&Salida'
      ShortCut = 16461
      OnExecute = ASalidaExecute
      OnUpdate = ASalidaUpdate
    end
    object ALimpiarMensajes: TAction
      Category = 'Mensajes'
      Caption = '&Limpiar'
      Enabled = False
      OnExecute = ALimpiarMensajesExecute
      OnUpdate = ALimpiarMensajesUpdate
    end
    object ABuscar: TAction
      Caption = '&Localizar'
      ShortCut = 114
      OnExecute = ABuscarExecute
    end
    object ADetener: TAction
      Category = 'Ejecutar'
      Caption = '&Detener'
      OnExecute = ADetenerExecute
      OnUpdate = AReiniciarUpdate
    end
    object EVP: TAction
      Caption = '&Editor Var. / Par.'
      ShortCut = 16502
      OnExecute = EVPExecute
      OnUpdate = EVPUpdate
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 248
    Top = 64
    object Cerrar1: TMenuItem
      Caption = '&Cerrar'
      ShortCut = 16499
      OnClick = Cerrar1Click
    end
    object CerrarTodas1: TMenuItem
      Caption = 'Cerrar &Todas'
      OnClick = CerrarTodas1Click
    end
  end
  object SynEditSearch1: TSynEditSearch
    Left = 408
    Top = 144
  end
  object PopupMenu4: TPopupMenu
    Left = 180
    Top = 360
    object Limpiar1: TMenuItem
      Action = ALimpiarMensajes
    end
  end
end
