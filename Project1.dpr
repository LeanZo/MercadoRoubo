program Project1;

uses
  Forms,
  U_Home in 'U_Home.pas' {F_Home},
  U_Login in 'U_Login.pas' {v},
  U_Cadastro in 'U_Cadastro.pas' {F_Cadastro},
  U_Produto in 'U_Produto.pas' {F_Produto},
  U_Aux in 'U_Aux.pas' {DmAux: TDataModule},
  U_Funcoes in 'U_Funcoes.pas',
  U_Anuncio in 'U_Anuncio.pas' {t},
  U_MinhaConta in 'U_MinhaConta.pas' {F_MinhaConta};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDmAux, DmAux);
  Application.CreateForm(TF_Home, F_Home);
  Application.Run;
end.
