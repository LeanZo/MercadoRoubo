object F_Cadastro: TF_Cadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 210
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblLogin: TLabel
    Left = 32
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object LblSenha: TLabel
    Left = 32
    Top = 83
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label1: TLabel
    Left = 32
    Top = 120
    Width = 28
    Height = 13
    Caption = 'Email:'
  end
  object Label2: TLabel
    Left = 248
    Top = 48
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object Label3: TLabel
    Left = 248
    Top = 85
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label4: TLabel
    Left = 248
    Top = 120
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Shape1: TShape
    Left = 88
    Top = 44
    Width = 122
    Height = 23
    Pen.Color = clRed
    Visible = False
  end
  object EditNomeValue: TEdit
    Left = 89
    Top = 45
    Width = 120
    Height = 21
    Color = clWhite
    TabOrder = 0
  end
  object EditCpfValue: TEdit
    Left = 88
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnCadastrar: TButton
    Left = 198
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = BtnCadastrarClick
  end
  object EditEmailValue: TEdit
    Left = 88
    Top = 117
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EditTelefoneValue: TEdit
    Left = 304
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object EditLoginValue: TEdit
    Left = 304
    Top = 82
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object EditSenhaValue: TEdit
    Left = 304
    Top = 117
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 6
  end
end
