unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

   type TPlayer = record
   nickname:string[20];
   time:string[8];
   timer:integer;
   end;
var
  Form7: TForm7;
  player:file of TPlayer;
  playerRead:TPlayer;
implementation

uses Unit4;

{$R *.dfm}

procedure TForm7.FormShow(Sender: TObject);
var n:integer;
begin
 assignFile(player,'Players.txt');
 reset(player);
 n:=1;
 while(not eof(player)) do
 begin
 read(player,playerRead);
 Memo1.Lines.Add(IntToStr(n)+'. '+playerRead.nickname+' - '+playerRead.time);
 n:=n+1;
 end;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Form4.Show;
     Memo1.Clear;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
     Form7.Close;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  assignFile(player,'Players.txt');
  rewrite(player);
  closeFile(player);
  memo1.clear;
end;

end.
