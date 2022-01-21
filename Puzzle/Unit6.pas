unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1, Unit5;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var vedRaz:integer;
begin
 if edit1.Text='' then showmessage('¬ведите целое число')
 else if TryStrToInt(edit1.Text,vedRaz) then
 begin
     if vedRaz>32 then showmessage('„исло должны быть меньше 32')else
     if vedRaz=0 then showmessage('„исло должно быть не равно нулю') else
     if vedRaz<0 then
     begin
      vedraz:=vedRaz*(-1);
      razmer:=vedRaz;
      edit1.Text:='';
      pazlgo;
      form6.Hide;
      form5.Hide;
      form1.Show;
     end else
      begin
      razmer:=vedRaz;
      edit1.Text:='';
      pazlgo;
      form6.Hide;
      form5.Hide;
      form1.Show;
 end
 end
 else showmessage('¬ведите целое цисло');
 edit1.Text:='';
end;
end.
