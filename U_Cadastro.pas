unit U_Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TF_Cadastro = class(TForm)
    lblLogin: TLabel;
    LblSenha: TLabel;
    EditNomeValue: TEdit;
    EditCpfValue: TEdit;
    BtnCadastrar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditEmailValue: TEdit;
    EditTelefoneValue: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditLoginValue: TEdit;
    EditSenhaValue: TEdit;
    Shape1: TShape;
    procedure BtnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function VerificarCampos: Boolean;
  end;

var
  F_Cadastro: TF_Cadastro;

implementation

uses
  U_Aux, U_Funcoes;

{$R *.dfm}

procedure TF_Cadastro.BtnCadastrarClick(Sender: TObject);
begin

	if(VerificarCampos) then
  	exit;

  DmAux.StpCadastro.close;
  DmAux.StpCadastro.prepare;
  DmAux.StpCadastro.ParambyName('@NOME').AsString := EditNomeValue.text;
  DmAux.StpCadastro.ParambyName('@CPF').AsString := EditCpfValue.text;
  DmAux.StpCadastro.ParambyName('@LOGIN').AsString := EditLoginValue.text;
  DmAux.StpCadastro.ParambyName('@SENHA').AsString := Md5(EditSenhaValue.text);
  DmAux.StpCadastro.ParambyName('@EMAIL').AsString := EditEmailValue.text;
  DmAux.StpCadastro.ParambyName('@TELEFONE').AsString := EditTelefoneValue.text;
  DmAux.StpCadastro.ExecProc;
  DmAux.StpCadastro.unPrepare;

  if (DmAux.StpCadastro.Parambyname('@RETURN_VALUE').AsString = '0') then
  begin
    showmessage('Login já cadastrado. Altere o Login e tente novamente.');
    exit;
  end;

  F_Cadastro.close;
  showmessage('Usuário cadastrado.');
   //F_Atendimento.BtnEscrCpfClick(self);
end;

function TF_Cadastro.VerificarCampos: boolean;
begin
  Result := false;
  if (EditNomeValue.text = '') then
  begin
    showmessage('Campo Nome está vazio. Preencha e tente novamente.');
    EditNomeValue.SetFocus;
    Result := true;
    exit;
  end;

   if (EditCpfValue.text = '') then
  begin
    showmessage('Campo Cpf está vazio. Preencha e tente novamente.');
    EditCpfValue.SetFocus;
    Result := true;
    Shape1.Visible := true;
    exit;
  end;

   if (EditloginValue.text = '') then
  begin
    showmessage('Campo Login está vazio. Preencha e tente novamente.');
    EditloginValue.SetFocus;
    Result := true;
    exit;
  end;

   if (EditSenhaValue.text = '') then
  begin
    showmessage('Campo Senha está vazio. Preencha e tente novamente.');
    EditSenhaValue.SetFocus;
    Result := true;
    exit;
  end;

  if (EditTelefoneValue.text = '') then
  begin
    showmessage('Campo Nome está vazio. Preencha e tente novamente.');
    EditTelefoneValue.SetFocus;
    Result := true;
    exit;
  end;
end;

end.

