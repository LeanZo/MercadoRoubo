unit U_Anuncio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIButton, StdCtrls, jpeg, ExtCtrls;

type
  TF_Anuncio = class(TForm)
    Img1: TImage;
    Lbl1: TLabel;
    LblP1: TLabel;
    Mm1: TMemo;
    RbCartao: TRadioButton;
    RbBoleto: TRadioButton;
    BtnIrCompra: TsuiButton;
    LblAdicionarCarrinho: TLabel;
    ShapeComentario: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  anuncioid: string;
    { Public declarations }
  end;

var
  F_Anuncio: TF_Anuncio;

implementation

uses U_Aux;

{$R *.dfm}

procedure TF_Anuncio.FormShow(Sender: TObject);
begin
	with DmAux.Qry_Aux do
  begin
		Close;
    Sql.Clear;
    Sql.Add('select * from anuncio where anuncioid = :anuncioid');
    ParamByName('anuncioid').AsInteger := StrToInt(anuncioid);

    Open;
  end;
  Lbl1.Caption := DmAux.Qry_Aux.FieldByName('NOME').AsString;
  Mm1.Lines.Clear;
  Mm1.Lines.Add(DmAux.Qry_Aux.FieldByName('DESCRICAO').AsString);
  LblP1.Caption := 'R$ ' + DmAux.Qry_Aux.FieldByName('PRECO').AsString;
  Img1.Picture.LoadFromFile(DmAux.Qry_Aux.FieldByName('CAMINHO').AsString);
end;

end.
