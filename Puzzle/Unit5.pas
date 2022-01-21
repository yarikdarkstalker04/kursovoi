unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    procedure Image6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  btnChek1,btnChek2,btnChek3,btnChek4,btnChek5:boolean;
  procedure start();

implementation

uses Unit1, Unit4, Unit3, Unit6;

{$R *.dfm}
procedure start();
begin
    Form5.Hide;
    Form1.Show;
end;
procedure TForm5.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek3=false then
 begin
 Image4.Picture.LoadFromFile('appImg\2 уровеньAktiv.jpg');
 btnChek3:=True;
end;
end;
procedure TForm5.Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek4=false then
 begin
 Image5.Picture.LoadFromFile('appImg\3 уровеньAktiv.jpg');
 btnChek4:=True;
end;
end;
procedure TForm5.Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek5=false then
 begin
 Image6.Picture.LoadFromFile('appImg\назадAktiv.jpg');
 btnChek5:=True;
end;

end;



procedure TForm5.Image6Click(Sender: TObject);
begin
 Form5.Hide;
 Form4.Show;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
  Form6.show;
end;

procedure TForm5.Image3Click(Sender: TObject);
begin
 razmer:=2;
 start();
end;

procedure TForm5.Image4Click(Sender: TObject);
begin
 razmer:=4;
 start();
end;

procedure TForm5.Image5Click(Sender: TObject);
begin
 razmer:=8;
 start();
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 btnChek1:=false;
 btnChek2:=false;
 btnChek3:=false;
 btnChek4:=false;
end;

procedure TForm5.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek1=false then
 begin
 Image2.Picture.LoadFromFile('appImg\0 уровеньAktiv.jpg');
 btnChek1:=True;
end;
end;
procedure TForm5.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if btnChek2=false then
 begin
 Image3.Picture.LoadFromFile('appImg\1 уровеньAktiv.jpg');
 btnChek2:=True;
end;
end;
procedure TForm5.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if (btnChek1=true) then
 begin
 btnChek1:=false;
 Image2.Picture.LoadFromFile('appImg\0 уровень.jpg');
 end;

 if (btnChek2=true) then
 begin
 btnChek2:=false;
 Image3.Picture.LoadFromFile('appImg\1 уровень.jpg');
 end;


 if (btnChek3=true) then
 begin
 btnChek3:=false;
 Image4.Picture.LoadFromFile('appImg\2 уровень.jpg');
 end;


 if (btnChek4=true) then
 begin
 btnChek4:=false;
 Image5.Picture.LoadFromFile('appImg\3 уровень.jpg');
 end;

 if (btnChek5=true) then
 begin
 btnChek5:=false;
 Image6.Picture.LoadFromFile('appImg\назад.jpg');
end;
end;
procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form3.Close;
end;

end.
