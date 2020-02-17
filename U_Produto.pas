unit U_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, U_Aux, DBCtrls, SUIDBCtrls, DB, DBClient;

type
  TF_Produto = class(TForm)
    lblLogin: TLabel;
    LblPreco: TLabel;
    EditNomeValue: TEdit;
    EditPrecoValue: TEdit;
    BtnCadastrar: TButton;
    Label1: TLabel;
    LblDescricao: TLabel;
    EditQuantValue: TEdit;
    OpBuscarArquivo: TOpenDialog;
    BtnBuscarArquivo: TButton;
    ImgProduto: TImage;
    LblNomeArquivo: TLabel;
    MmDescricao: TMemo;
    Shape1: TShape;
    cbCategoria: TsuiDBLookupComboBox;
    cdteste: TClientDataSet;
    DataSource1: TDataSource;
    cdtestedescricao: TStringField;
    procedure BtnBuscarArquivoClick(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Caminho: String;
  public
    { Public declarations }
    function VerificarCampos: Boolean;
  end;

var
  F_Produto: TF_Produto;

implementation

uses U_Home;

{$R *.dfm}

procedure TF_Produto.BtnBuscarArquivoClick(Sender: TObject);
begin
  OpBuscarArquivo.Filter := 'Arquivos de imagem|*.JPG;*.PNG;*.BMP';

  if(OpBuscarArquivo.Execute) then
  begin
  	LblNomeArquivo.Caption := Copy(OpBuscarArquivo.FileName, 1, 30);
    ImgProduto.Picture.LoadFromFile(OpBuscarArquivo.FileName);
    Caminho := OpBuscarArquivo.FileName;
  end;
end;

procedure TF_Produto.BtnCadastrarClick(Sender: TObject);
begin
	if(VerificarCampos) then
  	exit;

  DmAux.SPAnuncio.close;
  DmAux.SPAnuncio.prepare;
  DmAux.SpAnuncio.parambyName('@flagcont').AsInteger := 1;
  DmAux.SPAnuncio.ParambyName('@NOME').AsString := EditNomeValue.text;
  DmAux.SPAnuncio.ParambyName('@PRECO').AsString := EditPrecoValue.text;
  DmAux.SPAnuncio.ParambyName('@QUANTIDADE').AsString := EditQuantValue.text;
  DmAux.SPAnuncio.ParambyName('@CAMINHO').AsString := Caminho;
  DmAux.SPAnuncio.ParambyName('@DESCRICAO').AsString := MmDescricao.Lines.Text;
  DmAux.SPAnuncio.ParambyName('@VENDEDORID').AsString := DMAux.Qry_Login.FieldByName('UsuarioId').AsString;

  DMAux.Qry_Aux.Close;
  DMAux.Qry_Aux.Sql.Clear;
  DMAux.Qry_Aux.Sql.Add('Select * from Categoria where descricao = :desc');
  DMAux.Qry_Aux.ParamByName('desc').AsString := CBCategoria.Text;
  DMAux.Qry_Aux.Open;

  DmAux.SPAnuncio.ParambyName('@CATEGORIAID').AsString := DMAux.Qry_Aux.FieldByName('CATEGORIAID').AsString;
  DmAux.SPAnuncio.ExecProc;
  DmAux.SPAnuncio.unPrepare;

  ShowMessage('Anuncio criado com sucesso');

  F_Home.AtualizarPagina();

  Close;
end;

procedure TF_Produto.FormShow(Sender: TObject);
begin
	cdteste.CreateDataset;
  while not DMAux.Qry_Categoria.Eof do
  begin
    if(DMAux.Qry_Categoria.FieldByName('CATEGORIAID').AsString = '1')then
    begin
   	  DMAux.Qry_Categoria.next;
    	continue;
    end;
    cdteste.Append;
    cdteste.FieldByName('descricao').AsString := DMAux.Qry_Categoria.FieldByName('descricao').AsString;
    cdteste.Post;

    DMAux.Qry_Categoria.next;
  end;
end;

function TF_Produto.VerificarCampos: Boolean;
begin
Result := false;
  if (EditNomeValue.text = '') then
  begin
    showmessage('Campo Nome está vazio. Preencha e tente novamente.');
    EditNomeValue.SetFocus;
    Result := true;
    exit;
  end;

   if (EditPrecoValue.text = '') then
  begin
    showmessage('Campo Preço está vazio. Preencha e tente novamente.');
    EditPrecoValue.SetFocus;
    Result := true;
    exit;
  end;

   if (EditQuantValue.text = '') then
  begin
    showmessage('Campo Quantidade está vazio. Preencha e tente novamente.');
    EditQuantValue.SetFocus;
    Result := true;
    exit;
  end;

   if (Mmdescricao.Lines.Text = '') then
  begin
    showmessage('Campo Descrição está vazio. Preencha e tente novamente.');
    Mmdescricao.SetFocus;
    Result := true;
    exit;
  end;

  if (LblNomeArquivo.Caption = '') then
  begin
    showmessage('Selecione uma imagem.');
    Result := true;
    exit;
  end;
end;

end.
