unit U_MinhaConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TF_MinhaConta = class(TForm)
    ScrollBox1: TScrollBox;
    LblNome1: TLabel;
    LblNome2: TLabel;
    LblNome3: TLabel;
    LblNome4: TLabel;
    LblNome5: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    procedure FormShow(Sender: TObject);
    procedure ScrollBox1CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
    function IsScrollBarAtBottom(Box: TScrollBox): Boolean;
  public
    { Public declarations }
  end;

var
  F_MinhaConta: TF_MinhaConta;

implementation

{$R *.dfm}

procedure TF_MinhaConta.FormShow(Sender: TObject);
begin
  showmessage(IntToStr(GetScrollPos(ScrollBox1.Handle,SB_VERT)));
end;

function TF_MinhaConta.IsScrollBarAtBottom(Box: TScrollBox): Boolean;
var
  Info: TScrollInfo;
begin
  Info.cbSize := SizeOf(Info);
  Info.fMask := SIF_POS or SIF_RANGE or SIF_PAGE;
  Win32Check(GetScrollInfo(Box.Handle, SB_VERT, Info));
  Result := Info.nPos >=  Info.nMax - Info.nMin - Info.nPage;
end;

procedure TF_MinhaConta.ScrollBox1CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if(IsScrollBarAtBottom(ScrollBox1)) then
    showmessage('bottom');

end;

end.
