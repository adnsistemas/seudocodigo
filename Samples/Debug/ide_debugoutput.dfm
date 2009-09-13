object debugoutput: Tdebugoutput
  Left = 192
  Top = 107
  Width = 530
  Height = 366
  Caption = 'Salida de depuración'
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object output: TMemo
    Left = 0
    Top = 0
    Width = 514
    Height = 330
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
end
