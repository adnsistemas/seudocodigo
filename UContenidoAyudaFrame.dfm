object ContenidoAyudaFrame: TContenidoAyudaFrame
  Left = 0
  Top = 0
  Width = 454
  Height = 318
  TabOrder = 0
  object RichEdit: TRichEdit
    Left = 0
    Top = 0
    Width = 454
    Height = 318
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    Zoom = 100
  end
  object OleContainer1: TOleContainer
    Left = 248
    Top = 24
    Width = 121
    Height = 121
    AutoActivate = aaManual
    BorderStyle = bsNone
    Caption = 'OleContainer1'
    Ctl3D = False
    ParentCtl3D = False
    SizeMode = smAutoSize
    TabOrder = 1
    Visible = False
  end
  object CDSContenidos: TClientDataSet
    Aggregates = <>
    FileName = 'contenidos.cds'
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 208
    Top = 144
    object CDSContenidosnumero: TIntegerField
      FieldName = 'numero'
    end
    object CDSContenidoscontenido: TMemoField
      FieldName = 'contenido'
      BlobType = ftMemo
    end
  end
  object CDSImagenes: TClientDataSet
    Aggregates = <>
    FileName = 'imagenes.cds'
    Params = <>
    Left = 336
    Top = 152
    object CDSImagenescontenido: TIntegerField
      FieldName = 'contenido'
    end
    object CDSImagenesnumero: TIntegerField
      FieldName = 'numero'
    end
    object CDSImagenesimagen: TBlobField
      FieldName = 'imagen'
    end
  end
end
