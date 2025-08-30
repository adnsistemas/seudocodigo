object ArbolEstructuraFrame: TArbolEstructuraFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object TreeView: TTreeView
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnEdited = TreeViewEdited
    ExplicitTop = -71
    ExplicitWidth = 177
    ExplicitHeight = 311
  end
  object CDSEstructura: TClientDataSet
    Aggregates = <>
    FileName = 'estructura.cds'
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 120
    object CDSEstructuranumero: TIntegerField
      FieldName = 'numero'
    end
    object CDSEstructurapadre: TIntegerField
      FieldName = 'padre'
    end
    object CDSEstructuraorden: TIntegerField
      FieldName = 'orden'
    end
    object CDSEstructuratitulo: TStringField
      FieldName = 'titulo'
      Size = 180
    end
    object CDSEstructuracontenido: TIntegerField
      FieldName = 'contenido'
    end
  end
end
