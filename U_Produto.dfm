object F_Produto: TF_Produto
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de produto'
  ClientHeight = 382
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 248
    Top = 19
    Width = 182
    Height = 130
    Brush.Style = bsClear
  end
  object lblLogin: TLabel
    Left = 24
    Top = 22
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object LblPreco: TLabel
    Left = 24
    Top = 49
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
  end
  object Label1: TLabel
    Left = 24
    Top = 76
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object LblDescricao: TLabel
    Left = 24
    Top = 221
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object ImgProduto: TImage
    Left = 248
    Top = 19
    Width = 182
    Height = 130
    Stretch = True
  end
  object LblNomeArquivo: TLabel
    Left = 248
    Top = 192
    Width = 3
    Height = 13
  end
  object EditNomeValue: TEdit
    Left = 89
    Top = 19
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EditPrecoValue: TEdit
    Left = 90
    Top = 46
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnCadastrar: TButton
    Left = 355
    Top = 341
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = BtnCadastrarClick
  end
  object EditQuantValue: TEdit
    Left = 90
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BtnBuscarArquivo: TButton
    Left = 341
    Top = 160
    Width = 89
    Height = 25
    Caption = 'Buscar imagem'
    TabOrder = 4
    OnClick = BtnBuscarArquivoClick
  end
  object MmDescricao: TMemo
    Left = 90
    Top = 218
    Width = 340
    Height = 117
    TabOrder = 5
  end
  object cbCategoria: TsuiDBLookupComboBox
    Left = 89
    Top = 100
    Width = 121
    Height = 21
    KeyField = 'descricao'
    ListField = 'descricao'
    ListSource = DataSource1
    TabOrder = 6
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object OpBuscarArquivo: TOpenDialog
    Title = 'Selecione a imagem do anuncio'
    Left = 40
    Top = 306
  end
  object cdteste: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 176
    object cdtestedescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = cdteste
    Left = 304
    Top = 184
  end
end
