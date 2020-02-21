object F_Login: TF_Login
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 178
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblLogin: TLabel
    Left = 32
    Top = 48
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object LblSenha: TLabel
    Left = 32
    Top = 83
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object EditLoginValue: TEdit
    Left = 88
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EditSenhaValue: TEdit
    Left = 88
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtnEntrar: TButton
    Left = 88
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = BtnEntrarClick
  end
end
