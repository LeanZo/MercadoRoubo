unit U_Funcoes;

interface

uses
	IdHashMessageDigest, Windows;
  
type
	TChars = set of Char;

function MD5(Texto: String): string;
function Filtro(txt: String; Const valores: TChars): String;

implementation

uses IdHash;

function MD5(Texto: string): string;
var
  md5: TIdHashMessageDigest5;
begin
  md5 := TIdHashMessageDigest5.Create;
  try
    Result := md5.AsHex(md5.HashValue(texto));
  finally
    md5.Free;
  end;

end;

function Filtro(txt: String; Const valores: TChars): String;
var
	i: integer;
begin
	for i := 0 to Length(txt) do
  	if(txt[i] in valores)then
    	result := result + txt[i];
end;

end.
