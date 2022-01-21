unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, jpeg;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  n:integer;
implementation

uses Unit1, Unit4;

{$R *.dfm}
procedure TForm3.FormCreate(Sender: TObject);
begin
 n:=1;
end;
procedure TForm3.Timer1Timer(Sender: TObject);
var dviz, x,y:integer; 
begin
 randomize;
 dviz:=random(20);

 y:=n mod 4;
 Form3.Caption:='Подождите немного';
 for x:=1 to y do
  Form3.Caption:=Form3.Caption+'.';


 if (ProgressBar1.Position < ProgressBar1.Max) then
   ProgressBar1.Position:=ProgressBar1.Position+dviz
  else
    begin
        Form3.hide;
        Form4.Show;
        Timer1.Enabled:=False;
    end;
 n:=n+1;
end;



end.
