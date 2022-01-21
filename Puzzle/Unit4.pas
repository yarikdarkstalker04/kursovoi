unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg,ShellAPI;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image3Click(Sender: TObject);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image4DblClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
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
  Form4: TForm4;
  btnChek1,btnChek2,btnChek3,btnChek4:boolean;
   player:file of TPlayer;
implementation

uses Unit3, Unit5, Unit7, Unit8;

{$R *.dfm}

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form3.Close;
end;

procedure TForm4.Image3Click(Sender: TObject);
begin
 Form4.Close;
end;

procedure TForm4.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek2=false then
 begin
 Image3.Picture.LoadFromFile('appImg\выходAktiv.jpg');
 btnChek2:=True;
 end;
 end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 btnChek1:=false;
 btnChek2:=false;
 btnChek3:=false;
 btnChek4:=false;
end;


procedure TForm4.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek3=false then
 begin
 Image4.Picture.LoadFromFile('appImg\справкаAktiv.jpg');
 btnChek3:=True;
 end;
end;

procedure TForm4.Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek4=false then
 begin
 Image5.Picture.LoadFromFile('appImg\рекордыAktiv.jpg');
 btnChek4:=True;
 end;
end;

procedure TForm4.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek1=false then
 begin
 Image2.Picture.LoadFromFile('appImg\игратьAktiv.jpg');
 btnChek1:=True;
 end;
end;

procedure TForm4.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if (btnChek1=true) then
 begin
 btnChek1:=false;
 Image2.Picture.LoadFromFile('appImg\играть.jpg');
 end;

 if (btnChek2=true) then
 begin
 btnChek2:=false;
 Image3.Picture.LoadFromFile('appImg\выход.jpg');
 end;


 if (btnChek3=true) then
 begin
 btnChek3:=false;
 Image4.Picture.LoadFromFile('appImg\справка.jpg');
 end;

 
 if (btnChek4=true) then
 begin
 btnChek4:=false;
 Image5.Picture.LoadFromFile('appImg\рекорды.jpg');
 end;

end;
procedure TForm4.Image4DblClick(Sender: TObject);
begin
   ShellExecute(0,Pchar('Open'),PChar('Help.chm'),nil,nil,SW_SHOW);
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
 form4.Hide;
 form8.show;
end;

procedure TForm4.Image5Click(Sender: TObject);
begin
 if not(FileExists('Players.txt')) then
  begin
  assignFile(player,'Players.txt');
  rewrite(player);
  closeFile(player);
  end;
  form7.Show;
end;

end.
