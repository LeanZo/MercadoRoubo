object DmAux: TDmAux
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 150
  Width = 450
  object Qry_Cadastro: TQuery
    Left = 112
    Top = 8
  end
  object DtUruguaiana: TDatabase
    AliasName = 'NewSrc'
    Connected = True
    DatabaseName = 'uruguaiana'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'USER NAME= '
      'PASSWORD=')
    SessionName = 'Default'
    Left = 32
    Top = 8
  end
  object StpCadastro: TStoredProc
    DatabaseName = 'uruguaiana'
    StoredProcName = 'Sp_CadastraUsuario'
    Left = 184
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = '@SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = '@EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = '@TELEFONE'
        ParamType = ptInput
      end>
  end
  object Qry_Login: TQuery
    DatabaseName = 'uruguaiana'
    Left = 248
    Top = 8
  end
  object Qry_MaisBraba: TQuery
    DatabaseName = 'uruguaiana'
    Left = 320
    Top = 8
  end
  object Qry_Categoria: TQuery
    Active = True
    DatabaseName = 'uruguaiana'
    SQL.Strings = (
      'Select * from CATEGORIA')
    Left = 400
    Top = 8
  end
  object DS_Categoria: TDataSource
    DataSet = Qry_Categoria
    Left = 32
    Top = 72
  end
  object SPAnuncio: TStoredProc
    DatabaseName = 'uruguaiana'
    StoredProcName = 'SP_Anuncio'
    Left = 112
    Top = 72
  end
  object Qry_Aux: TQuery
    DatabaseName = 'uruguaiana'
    Left = 184
    Top = 72
  end
end
