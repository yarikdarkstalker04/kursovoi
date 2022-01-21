unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  nickname:string[20];
  pas_h:integer;
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit5, Unit4;

{$R *.dfm}



procedure TForm8.Button1Click(Sender: TObject);
begin
  pas_h:=0;
  if Edit1.Text='' then
  ShowMessage('Введите хотя бы 1 символ')
  else if Length(Edit1.Text)>20 then
  begin
  ShowMessage('Имя должны быть не длиннее 20 символов');
  Edit1.Text:='';
  end else
  begin
  nickname:=Edit1.Text;
  if (nickname='smoke') or (nickname='смок')or (nickname='смоук') then pas_h:=1;
  form8.Hide;
  form5.Show;
  end;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form4.Show;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
Edit1.Text:='';
end;

end.
