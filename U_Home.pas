unit U_Home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SUIButton, ExtCtrls, ImgList, U_Login, jpeg, U_Anuncio, U_Funcoes,
  DBCtrls, SUIDBCtrls;

type
  TF_Home = class(TForm)
    BtnPesquisar: TsuiButton;
    BtnCadastrar: TsuiButton;
    EditPesquisar: TEdit;
    BtnLogin: TsuiButton;
    BtnLogoff: TsuiButton;
    LblProximo: TLabel;
    Shape1: TShape;
    Img1: TImage;
    Lbl1: TLabel;
    LblP1: TLabel;
    Mm1: TMemo;
    Shape2: TShape;
    Img2: TImage;
    Lbl2: TLabel;
    LblP2: TLabel;
    Mm2: TMemo;
    Shape3: TShape;
    Img3: TImage;
    Lbl3: TLabel;
    LblP3: TLabel;
    Mm3: TMemo;
    Shape4: TShape;
    Img4: TImage;
    Lbl4: TLabel;
    LblP4: TLabel;
    Mm4: TMemo;
    Shape5: TShape;
    Img5: TImage;
    Lbl5: TLabel;
    LblP5: TLabel;
    Mm5: TMemo;
    Shape6: TShape;
    Img6: TImage;
    Lbl6: TLabel;
    LblP6: TLabel;
    Mm6: TMemo;
    Shape7: TShape;
    Img7: TImage;
    Lbl7: TLabel;
    LblP7: TLabel;
    Mm7: TMemo;
    Shape8: TShape;
    Img8: TImage;
    Lbl8: TLabel;
    LblP8: TLabel;
    Mm8: TMemo;
    Label18: TLabel;
    LblAnterior: TLabel;
    BtnCriarAnuncio: TsuiButton;
    lblCodAnuncio1: TLabel;
    lblCodAnuncio2: TLabel;
    lblCodAnuncio3: TLabel;
    lblCodAnuncio4: TLabel;
    lblCodAnuncio5: TLabel;
    lblCodAnuncio6: TLabel;
    lblCodAnuncio7: TLabel;
    lblCodAnuncio8: TLabel;
    CBCategoria: TsuiDBLookupComboBox;
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnLogoffClick(Sender: TObject);
    procedure BtnCriarAnuncioClick(Sender: TObject);
    procedure LblProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LblAnteriorClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure Label18Click(Sender: TObject);
  private
    { Private declarations }
    _labeldm : TLabel;
  public
    { Public declarations }
    ultimoID: integer;
    PrimeiroCardId: integer;
    PaginaIndex: integer;
    procedure AtualizarPagina(ultimoId: Integer = -1; pesquisaPorNomeAnuncio: string = '');
    procedure AtualizarLogin(Logado: Boolean);
    procedure CardVisibilidade(Card: integer = 0);
    procedure VoltarPagina;
    procedure AtualizarInfoTela;
    procedure AbreTelaAnuncio(Sender: TObject);
  end;

  const
  	_lblTitulo: Array[0..7] Of String = ('Lbl1', 'Lbl2', 'Lbl3', 'Lbl4', 'Lbl5', 'Lbl6', 'Lbl7', 'Lbl8');

var
  F_Home: TF_Home;

implementation

uses
  U_Cadastro, U_Aux, U_Produto, U_MinhaConta;

{$R *.dfm}

procedure TF_Home.AtualizarLogin(Logado: Boolean);
begin
  BtnLogoff.visible := Logado;
  BtnCriarAnuncio.Visible := Logado;
  BtnLogin.visible := not Logado;
  BtnCadastrar.visible := not Logado;
end;

procedure TF_Home.AtualizarPagina(ultimoId: Integer = -1; pesquisaPorNomeAnuncio: string = '');
var
	CategoriaId : Integer;
begin
	DmAux.Qry_MaisBraba.Close;
  DmAux.Qry_MaisBraba.sql.clear;

  DmAux.Qry_MaisBraba.sql.text := 'Select CategoriaId from CATEGORIA where descricao = :DescCategoria';
  DmAux.Qry_MaisBraba.ParamByName('DescCategoria').AsString := CBCategoria.Text;

  DmAux.Qry_MaisBraba.open;

	CategoriaId := DmAux.Qry_MaisBraba.FieldByName('CategoriaId').AsInteger;

  DmAux.Qry_MaisBraba.Close;
  DmAux.Qry_MaisBraba.sql.clear;

	IF(ULTIMOID = -1)THEN
  BEGIN

    DmAux.Qry_MaisBraba.sql.text := 'SELECT TOP 9               ' +
  																  '	*                         ' +
                                    'FROM                       ' +
                                    '	ANUNCIO (NOLOCK) 					' +
                                    'WHERE NOME LIKE ' + QuotedStr('%'+pesquisaPorNomeAnuncio+'%');
    LblAnterior.Enabled := false;
  END
  ELSE
  BEGIN
  	DmAux.Qry_MaisBraba.sql.Add('SELECT TOP 9 * FROM ANUNCIO');
    DmAux.Qry_MaisBraba.sql.Add('WHERE ANUNCIOID <= :UltimoId' +
    														' AND NOME LIKE ' + QuotedStr('%'+pesquisaPorNomeAnuncio+'%'));


  	DmAux.Qry_MaisBraba.ParamByName('UltimoId').AsInteger := UltimoId;
  END;

  IF (CBCategoria.Text <> 'Categorias') and (CBCategoria.Text <> '') then
  BEGIN
  	DmAux.Qry_MaisBraba.sql.Add(' AND CategoriaId = ' + IntToStr(CategoriaId));
  END;


  DmAux.Qry_MaisBraba.sql.Add('ORDER BY ANUNCIOID DESC');

  DmAux.Qry_MaisBraba.open;

  AtualizarInfoTela;
end;

procedure TF_Home.AbreTelaAnuncio(Sender: TObject);
var
  num : String;
begin
  num := Filtro(TLabel(Sender).Name, ['0'..'9']);
  _labeldm := TLabel(FindComponent('lblCodAnuncio'+num));

	try
    Application.CreateForm(TF_Anuncio, F_Anuncio);
    F_Anuncio.anuncioid := Filtro(_labeldm.Caption, ['0'..'9']);
    F_Anuncio.showmodal;
  finally
    F_Anuncio.release;
  end;
end;

procedure TF_Home.AtualizarInfoTela;
var
	Card: Integer;
begin
  Card := 1;

  CardVisibilidade;

  DmAux.Qry_MaisBraba.first;

  while not DmAux.Qry_MaisBraba.Eof do
  begin

    case Card of
      1:
      begin
        Lbl1.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm1.Lines.Clear;
        Mm1.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP1.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img1.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        PrimeiroCardId := DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsInteger;
        lblCodAnuncio1.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(1);
      end;
      2:
      begin
        Lbl2.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm2.Lines.Clear;
        Mm2.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP2.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img2.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio2.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(2);

      end;
      3:
      begin
        Lbl3.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm3.Lines.Clear;
        Mm3.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP3.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img3.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio3.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(3);
      end;

      4:
      begin
        Lbl4.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm4.Lines.Clear;
        Mm4.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP4.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img4.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio4.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(4);
      end;

      5:
      begin
        Lbl5.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm5.Lines.Clear;
        Mm5.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP5.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img5.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio5.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(5);
      end;

      6:
      begin
        Lbl6.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm6.Lines.Clear;
        Mm6.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP6.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img6.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio6.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(6);
      end;

      7:
      begin
        Lbl7.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm7.Lines.Clear;
        Mm7.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP7.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img7.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio7.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(7);
      end;

      8:
      begin
        Lbl8.Caption := DmAux.Qry_MaisBraba.FieldByName('NOME').AsString;
        Mm8.Lines.Clear;
        Mm8.Lines.Add(DmAux.Qry_MaisBraba.FieldByName('DESCRICAO').AsString);
        LblP8.Caption := 'R$ ' + DmAux.Qry_MaisBraba.FieldByName('PRECO').AsString;
        Img8.Picture.LoadFromFile(DmAux.Qry_MaisBraba.FieldByName('CAMINHO').AsString);
        lblCodAnuncio8.Caption := 'Cod. Anuncio: ' + DmAux.Qry_MaisBraba.FieldByName('ANUNCIOID').AsString;
        CardVisibilidade(8);
      end;
      9:
      begin
      	F_Home.UltimoId := DmAux.Qry_MaisBraba.fieldbyName('anuncioid').AsInteger;
        CardVisibilidade(9);
      end;
    end;

    Inc(Card);
    DmAux.Qry_MaisBraba.Next;
  end;
end;

procedure TF_Home.BtnCadastrarClick(Sender: TObject);
begin
  try
    Application.CreateForm(TF_Cadastro, F_Cadastro);
    F_Cadastro.showmodal;
  finally
    F_Cadastro.release;
  end;
end;

procedure TF_Home.BtnCriarAnuncioClick(Sender: TObject);
begin
	try
    Application.CreateForm(TF_Produto, F_Produto);
    F_Produto.showmodal;
  finally
    F_Produto.release;
  end;
end;

procedure TF_Home.BtnLoginClick(Sender: TObject);
begin
  try
    Application.CreateForm(TF_Login, F_Login);
    F_Login.showmodal;
  finally
    ;
    F_Login.release;
  end;
end;

procedure TF_Home.BtnLogoffClick(Sender: TObject);
begin
  AtualizarLogin(False);
  DmAux.Qry_Login.Close;
  AtualizarPagina;
end;

procedure TF_Home.BtnPesquisarClick(Sender: TObject);
begin
  AtualizarPagina(-1, EditPesquisar.Text)

end;

procedure TF_Home.CardVisibilidade(Card: integer = 0);
begin
	case Card of
    0:
    begin
      Shape1.Visible := false;
      Shape2.Visible := false;
      Shape3.Visible := false;
      Shape4.Visible := false;
      Shape5.Visible := false;
      Shape6.Visible := false;
      Shape7.Visible := false;
      Shape8.Visible := false;

      Img1.Visible := false;
      Img2.Visible := false;
      Img3.Visible := false;
      Img4.Visible := false;
      Img5.Visible := false;
      Img6.Visible := false;
      Img7.Visible := false;
      Img8.Visible := false;

      Lbl1.Visible := false;
      Lbl2.Visible := false;
      Lbl3.Visible := false;
      Lbl4.Visible := false;
      Lbl5.Visible := false;
      Lbl6.Visible := false;
      Lbl7.Visible := false;
      Lbl8.Visible := false;

      Mm1.Visible := false;
      Mm2.Visible := false;
      Mm3.Visible := false;
      Mm4.Visible := false;
      Mm5.Visible := false;
      Mm6.Visible := false;
      Mm7.Visible := false;
      Mm8.Visible := false;

      LblP1.Visible := false;
      LblP2.Visible := false;
      LblP3.Visible := false;
      LblP4.Visible := false;
      LblP5.Visible := false;
      LblP6.Visible := false;
      LblP7.Visible := false;
      LblP8.Visible := false;

      lblCodAnuncio1.Visible := false;
      lblCodAnuncio2.Visible := false;
      lblCodAnuncio3.Visible := false;
      lblCodAnuncio4.Visible := false;
      lblCodAnuncio5.Visible := false;
      lblCodAnuncio6.Visible := false;
      lblCodAnuncio7.Visible := false;
      lblCodAnuncio8.Visible := false;



      LblProximo.enabled := false;
      if(PaginaIndex = 1) then
      	LblAnterior.enabled := false;
    end;
    1:
    begin
    	Shape1.Visible := true;
      Img1.Visible := true;
      Lbl1.visible := true;
      Mm1.Visible := true;
			LblP1.Visible := true;
      lblCodAnuncio1.Visible := true;
    end;
    2:
    begin
      Shape2.Visible := true;
      Img2.Visible := true;
      Lbl2.visible := true;
      Mm2.Visible := true;
			LblP2.Visible := true;
      lblCodAnuncio2.Visible := true;
    end;

    3:
    begin
      Shape3.Visible := true;
      Img3.Visible := true;
      Lbl3.visible := true;
      Mm3.Visible := true;
			LblP3.Visible := true;
      lblCodAnuncio3.Visible := true;
    end;

    4:
    begin
      Shape4.Visible := true;
      Img4.Visible := true;
      Lbl4.visible := true;
      Mm4.Visible := true;
			LblP4.Visible := true;
      lblCodAnuncio4.Visible := true;
    end;

    5:
    begin
      Shape5.Visible := true;
      Img5.Visible := true;
      Lbl5.visible := true;
      Mm5.Visible := true;
			LblP5.Visible := true;
      lblCodAnuncio5.Visible := true;
    end;

    6:
    begin
      Shape6.Visible := true;
      Img6.Visible := true;
      Lbl6.visible := true;
      Mm6.Visible := true;
			LblP6.Visible := true;
      lblCodAnuncio6.Visible := true;
    end;

    7:
    begin
      Shape7.Visible := true;
      Img7.Visible := true;
      Lbl7.visible := true;
      Mm7.Visible := true;
			LblP7.Visible := true;
      lblCodAnuncio7.Visible := true;
    end;

    8:
    begin
      Shape8.Visible := true;
      Img8.Visible := true;
      Lbl8.visible := true;
      Mm8.Visible := true;
			LblP8.Visible := true;
      lblCodAnuncio8.Visible := true;
    end;
    9:
    begin
    lblProximo.enabled := true;
    end;
	end;
end;

procedure TF_Home.FormCreate(Sender: TObject);
var
	i, k: Integer;
begin
  BtnLogoff.visible := false;
  BtnCriarAnuncio.Visible := false;
  PaginaIndex := 0;
  
  for i:=0 to (ComponentCount-1) do
  begin
  	if Components[I] is TLabel then
    begin
    	k := 0;
      while(k <= 7) do
      begin
        if(TLabel(Components[I]).Name = _lblTitulo[k]) then
    	  	TLabel(Components[I]).OnClick := AbreTelaAnuncio;
        inc(k);
      end;

    end;
  end;


end;
procedure TF_Home.FormShow(Sender: TObject);
begin
  AtualizarPagina;

  CBCategoria.ListSource.DataSet.Locate('DESCRICAO', 'Categorias', []);
	CBCategoria.KeyValue := CBCategoria.ListSource.DataSet.FieldByName(CBCategoria.KeyField).Value;
end;

procedure TF_Home.Label18Click(Sender: TObject);
begin
  Application.CreateForm(TF_MinhaConta, F_MinhaConta);
  F_MinhaConta.showmodal;
end;

procedure TF_Home.LblAnteriorClick(Sender: TObject);
begin
  VoltarPagina;
  Dec(PaginaIndex);
end;

procedure TF_Home.LblProximoClick(Sender: TObject);
begin
	AtualizarPagina(ultimoId, EditPesquisar.Text);
    
  LblAnterior.Enabled := true;
  Inc(PaginaIndex);
end;

procedure TF_Home.VoltarPagina;
begin
  DmAux.Qry_MaisBraba.Close;
  DmAux.Qry_MaisBraba.Sql.Clear;
  DmAux.Qry_MaisBraba.sql.Add('SELECT top 9                        ' +
                              '	*                                  ' +
                              'FROM  ANUNCIO                       ' +
                              '	where anuncioID >= :PrimeiroCardId ' +
                              ' AND NOME LIKE '+ QuotedStr('%'+EditPesquisar.Text+'%'));

  DmAux.Qry_MaisBraba.Sql.Add('order by anuncioid Asc');

  DmAux.Qry_MaisBraba.paramByName('PrimeiroCardId').AsString := IntToStr(PrimeiroCardId);

  DmAux.Qry_MaisBraba.Open;
  DmAux.Qry_MaisBraba.Last;

  AtualizarPagina(DmAux.Qry_MaisBraba.FieldByName('AnuncioId').AsInteger, EditPesquisar.Text);
end;

end.

