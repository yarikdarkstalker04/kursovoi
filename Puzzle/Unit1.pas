unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, JPEG, ShellAPI,ExtCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N221: TMenuItem;
    N441: TMenuItem;
    N881: TMenuItem;
    Timer1: TTimer;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Timer2: TTimer;
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N221Click(Sender: TObject);
    procedure N441Click(Sender: TObject);
    procedure N881Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fullpath:string;
  end;
   type TPlayer = record
   nickname:string[20];
   time:string[8];
   timer:integer;
   end;
var
  Form1: TForm1;
  buf,original:TBitmap;
  open:TJPEGImage;
  pazl:array[1..1024] of TBitmap;
  kopia,pole:array[0..31,0..31] of integer;
  path:string;
  razmer,XX,YY,Aktiv:integer;
  tmr:integer;
  procedure pazlGo;
  procedure Setka(cellX,cellY,MX,MY,RazmerX,RazmerY,Tolshina:integer;SetkaColor:TColor;Buf:TBitmap);
implementation
 uses unit2, Unit3, Unit5, Unit4, Unit6, Unit7, Unit8;
{$R *.dfm}

procedure TForm1.N3Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,j:integer;
begin
tmr:=0;
Form1.Hide;
Form3.Show;
path:=ExtractFileDir(Application.ExeName);

buf:=TBitmap.Create;
buf.width:=960;
buf.Height:=320;

open:=TJpegImage.Create;
open.LoadFromFile(path+'\img\1.jpg');

fullpath:=path+'\img\1.jpg';

original:=TBitmap.Create;
original.width:=480;
original.Height:=320;
original.Canvas.StretchDraw(Rect(0,0,480,320),open);

for i:=0 to 31 do
for j:=0 to 31 do
begin
kopia[i,j]:=0;
pole[i,j]:=0;
end;
razmer:=4;
Aktiv:=0;
pazlGo;

end;

procedure TForm1.N221Click(Sender: TObject);
begin
razmer:=2;
pazlgo;
Aktiv:=0;
end;

procedure TForm1.N441Click(Sender: TObject);
begin
razmer:=4;
pazlgo;
Aktiv:=0;
end;

procedure TForm1.N881Click(Sender: TObject);
begin
razmer:=8;
pazlgo;
Aktiv:=0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var chekWhile,kolvo,min,Tolshina,i,j,n,MX,MY:integer;
    timeItogo,timerS,timerM,timerH:string;
    bufff,playerWrite,playerWrite1:TPlayer;
    player:file of TPlayer;
SetkaColor:TColor;
win:boolean;
begin
win:=true;
n:=1;
for i:=0 to Razmer-1 do
for j:=0 to Razmer-1 do
begin
if pole[i,j]<>n then win:=false;
n:=n+1;
end;

if win=True then
begin
Timer1.Enabled:=false;
Timer2.Enabled:=false;
form1.Hide;
 if not(FileExists('Players.txt')) then
  begin
  assignFile(player,'Players.txt');
  rewrite(player);
  closeFile(player);
  end;
timerS:=IntToStr(tmr mod 60);
timerM:=IntToStr(tmr div 60);
timerH:=IntToStr(tmr div 3600);
if StrToInt(timerS)<10 then timerS:='0'+timerS;
if StrToInt(timerM)<10 then timerM:='0'+timerM;
if StrToInt(timerH)<10 then timerH:='0'+timerH;
timeItogo:=timerH+':'+timerM+':'+timerS;
assignFile(player,'Players.txt');
reset(player);
chekWhile:=0;
kolvo:=0;
while(chekWhile=0)and(not(eof(player))) do begin
    read(player,playerWrite);
    if playerWrite.timer>tmr then chekWhile:=1;
    kolvo:=kolvo+1;
end;
closeFile(player);
assignFile(player,'Players.txt');
playerWrite.timer:=tmr;
playerWrite.time:=timeItogo;
playerWrite.nickname:=form8.nickname;
reset(player);
  seek(player,fileSize(player));
  write(player,playerWrite);
  seek(player,0);
if filesize(player)>1 then begin
 for i:=0 to filesize(player) do
 begin
 for j:=0 to filesize(player)-2 do
 begin
 seek(player,j);
 read(player,PlayerWrite);
 seek(player,j+1);
 read(player,PlayerWrite1);
 if PlayerWrite.timer>playerWrite1.timer then
  begin
   bufff:=PlayerWrite;
   PlayerWrite:=playerWrite1;
   playerWrite1:=bufff;
  end;
 seek(player,j);
 write(player,PlayerWrite);
 seek(player,j+1);
 write(player,PlayerWrite1);
 end;
end;
end;
closeFile(player);
if form8.pas_h=2 then ShellExecute(Self.Handle, 'open', PChar('appImg\recordAktiv.jpg'), nil, nil, SW_SHOWNORMAL);
form7.Show;
end;

buf.canvas.Brush.Color:=clWhite;
buf.canvas.Rectangle(0,0,960,320);

MY:=0;
MX:=0;
Tolshina:=1;
SetkaColor:=clPurple;
Setka(XX,YY,MX,MY,Razmer,Razmer,Tolshina,SetkaColor,Buf);
MX:=480;
Setka(XX,YY,MX,MY,Razmer,Razmer,Tolshina,SetkaColor,Buf);
for i:=0 to razmer-1 do
for j:=0 to razmer-1 do
BEGIN
if Pole[i,j]>0 then buf.canvas.Draw(i*XX,j*YY,pazl[Pole[i,j]]);

if Aktiv>0 then buf.Canvas.Draw(Mouse.CursorPos.X-Form1.Left-(XX div 2),Mouse.CursorPos.Y-Form1.Top-25-(YY div 2),pazl[aktiv]);

if kopia[i,j]>0 then buf.Canvas.Draw(i*XX+480,j*YY,pazl[kopia[i,j]]);
end;


form1.Canvas.Draw(0,0,buf);

end;
procedure pazlGo;
var i,j,n:integer;
begin

for i:=0 to 31 do
for j:=0 to 31 do
begin
kopia[i,j]:=0;
pole[i,j]:=0;
end;
XX:=480 div razmer;
YY:=320 div razmer;
n:=1;
for i:=0 to razmer-1 do
for j:=0 to razmer-1 do
begin
pazl[n]:=TBitmap.Create;
pazl[n].Width:=XX;
pazl[n].Height:=YY;
pazl[n].Canvas.CopyRect(rect(0,0,XX,YY),original.Canvas,Rect(i*XX,j*YY,i*XX+XX-1,j*YY+YY-1));
n:=n+1;
end;

n:=1;
randomize;
while(n<(razmer*razmer)+1)do
begin
  i:=random(razmer);
  j:=random(razmer);
  if kopia[i,j]=0 then
  begin
  kopia[i,j]:=n;
  n:=n+1;
  end;
end;
end;




procedure Setka(cellX,cellY,MX,MY,RazmerX,RazmerY,Tolshina:integer;SetkaColor:TColor;Buf:TBitmap);
var i:integer;
begin
    Buf.Canvas.Pen.Color:=SetkaColor;
    Buf.Canvas.Pen.Width:=Tolshina;

    for i:=0 to RazmerY do
    begin
    Buf.Canvas.MoveTo(0+MX,i*cellY+MY);
    Buf.Canvas.LineTo(RazmerX*cellX+MX,i*cellY+MY);
    end;

    for i:=0 to RazmerX do
    begin
    Buf.Canvas.MoveTo(i*cellX+MX,0+MY);
    Buf.Canvas.LineTo(i*cellX+MX,RazmerY*cellY+MY);
    end;
    Buf.Canvas.Brush.Color:=clPurple;
    buf.Canvas.FillRect(Rect(478,0,482,316));
end;


procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var uzhe:boolean;
  boof,i,j:integer;
begin
  if (Button=MBRight) and (aktiv>0) then
  begin
    uzhe:=false;
    for i:=0 to razmer-1 do
    for j:=0 to razmer-1 do
    begin
    if (uzhe=false) and (kopia[i,j]=0) then
    begin
     uzhe:=true;
     kopia[i,j]:=aktiv;
     aktiv:=0;
    end;
    end;
  end
  else
    begin
    uzhe:=false;

 if (X>=480) and (X<=960) and (Y>=0) and (Y<=320) then
  begin
    if (kopia[(X-480) div XX, Y div YY]>0) and (aktiv=0) then
    begin
        Aktiv:=kopia[(X-480) div XX, Y div YY];
        kopia[(X-480) div XX, Y div YY]:=0;
        uzhe:=true;
    end;

      if (kopia[(X-480) div XX, Y div YY]=0) and (aktiv>0) and (uzhe=false) then
    begin
        kopia[(X-480) div XX, Y div YY]:=Aktiv;
        Aktiv:=0;
  end;
    if (aktiv>0) and  (kopia[(X-480) div XX, Y div YY]>0) then
      begin
          boof:= aktiv;
          aktiv:=kopia[(X-480) div XX, Y div YY];
          kopia[(X-480) div XX, Y div YY]:=boof;
      end;
 end;

  if (X>=0) and (X<=480) and (Y>=0) and (Y<=320) then
  begin
    if (pole[X div XX, Y div YY]>0) and (aktiv=0) then
    begin
        Aktiv:=pole[X div XX, Y div YY];
        pole[X div XX, Y div YY]:=0;
        uzhe:=true;
    end;

      if (pole[X div XX, Y div YY]=0) and (aktiv>0) and (uzhe=false) then
    begin
        pole[X div XX, Y div YY]:=Aktiv;
        Aktiv:=0;
  end;
      if (aktiv>0) and  (pole[X div XX, Y div YY]>0) then
      begin
          boof:= aktiv;
          aktiv:=pole[X div XX, Y div YY];
          pole[X div XX, Y div YY]:=boof;
      end;
end;

end;
end;
procedure TForm1.N2Click(Sender: TObject);
begin
opendialog1.InitialDir:=path+'\img';
opendialog1.Execute;
opendialog1.Filter:='Изобржения формата jpg';
if opendialog1.Filename<>'' then
begin
if opendialog1.Filename=path+'\img\'+'7.jpg' then Form8.pas_h:=Form8.pas_h+1;
open.loadfromfile(opendialog1.FileName);
original.Canvas.StretchDraw(Rect(0,0,480,320),open);
fullpath:=opendialog1.Filename;
pazlgo;
timer1.enabled:=true;
timer2.Enabled:=true;
tmr:=0;
end;
end;
procedure TForm1.N5Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form3.Close;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  ShellExecute(0,Pchar('Open'),PChar('Help.chm'),nil,nil,SW_SHOW);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 timer1.Enabled:=True;
 timer2.Enabled:=True;
 tmr:=0;
 pazlgo;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 Form1.Hide;
 Form4.Show;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
tmr:=tmr+1;
end;

procedure TForm1.FormHide(Sender: TObject);
begin
 Form2.Hide
end;



end.
