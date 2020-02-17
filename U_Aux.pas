unit U_Aux;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDmAux = class(TDataModule)
    Qry_Cadastro: TQuery;
    DtUruguaiana: TDatabase;
    StpCadastro: TStoredProc;
    Qry_Login: TQuery;
    Qry_MaisBraba: TQuery;
    Qry_Categoria: TQuery;
    DS_Categoria: TDataSource;
    SPAnuncio: TStoredProc;
    Qry_Aux: TQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmAux: TDmAux;

implementation

{$R *.dfm}

procedure TDmAux.DataModuleCreate(Sender: TObject);
begin
	Qry_Categoria.Open;
end;

end.
