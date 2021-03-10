unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

TParallel = class
  public
  Fa:word;
  Fb:word;
  Fc:word;
 {procedure Init(a,b,c:word);}
  constructor Create (a,b,c:word);
  function Volume:word; virtual;
  procedure Show;
end;

TBar = class(TParallel)
  public
  FRo:real;
  constructor Create(a,b,c:word; Ro:real);
  function massa:real;
  procedure Show;
  function Volume:word; override;
end;

TBarSon = class(TBar)
  function Volume:word; override;
end;

TTransport = class
end;

TAutomobile = class(TTransport)
end;

TToyota = class(TAutomobile)
end;

var
  Form1: TForm1; Par1:TParallel; Par:array[1..5] of TParallel;
  x:word=0;
  y:word=0;
  z:word=0;
  Bar1:TBar;
  Transport:TTransport;
  Automobile:TAutomobile;
  Toyota:TToyota;
  BarSon1:TBarSon;

implementation

{$R *.dfm}

{ TParallel }

constructor TParallel.Create(a: Word; b: Word; c: Word);
 begin
  Fa:=a;
  Fb:=b;
  Fc:=c;
 end;

constructor TBar.Create(a: Word; b: Word; c: Word; Ro: Real);
 begin
   inherited Create(a,b,c);
   FRo:=Ro;
 end;

function TBar.massa:real;
 begin
  result:=FRo*Volume;
 end;

procedure TBar.Show;
 begin
  ShowMessage('����� ��������������� ����� ' + IntToStr(Volume) + #10#13 +
  '������ - ���� Fa = ' + IntToStr(Fa) + #10#13 +
  '����� - ���� Fb = ' + IntToStr(Fb) + #10#13 +
  '������ - ���� Fc = ' + IntToStr(Fc) + #10#13 +
  '��������� - ���� FRo = ' + FloatToStr(FRo) + #10#13 +
  '����� = ' + FloatToStr(massa));
 end;



function TBar.Volume: word;
begin
  result:=Fa*Fb*Fc*100;
end;

{procedure TParallel.Init(a, b, c: word);
begin
 Fa:=a;
 Fb:=b;
 Fc:=c;
end;
}


procedure TParallel.Show;
 begin
  ShowMessage('����� ��������������� ����� '
     + IntToStr(Volume)+#10#13 + '������ - ���� Fa ='
     + IntToStr(Fa)+#10#13+ '����� - ���� Fb ='
     + IntToStr(Fb) + #10#13+ '������ - ���� Fc =' + IntToStr(Fc));
 end;

function TParallel.Volume: word;
 begin
  result:=Fa*Fb*Fc;
 end;

procedure TForm1.Button1Click(Sender: TObject);
 begin
  x:=x+1; y:=y+1; z:=z+1;
  Par1:=TParallel.Create(x,y,z);
  Par[x]:=Par1;
  //Par1.Init(x,y,z);
  Par1.Show;
  Memo1.Lines.Add('����� � ������ �������, ������������ � Par1, ����� ' + IntToStr(integer(Par1)));
 end;

procedure TForm1.Button2Click(Sender: TObject);
 begin
  if Par1 = nil then
     Form1.Caption:='������� � ������ ���'
      else
     Form1.Caption:='������ ���������� � ������';

 end;

procedure TForm1.Button3Click(Sender: TObject);
var
   i:integer;
 begin
  for i := 1 to Memo1.Lines.Count do
  begin
    Memo1.Lines.Add('����� ������� � ������� ' + IntToStr(i)
    + ' ����� ' + IntToStr(integer(Par[i])) + ' ���� Fa = ' +
    IntToStr(Par[i].Fa) );
    Par[i].Show;
  end;
 end;

procedure TForm1.Button4Click(Sender: TObject);
 begin
  Par1:=TParallel.Create(1,2,3);
  Bar1:=TBar.Create(1,2,3,10.5);
  BarSon1:=TBarSon.Create(1,2,3,10.5);
  Par1:=Bar1;
  ShowMessage('��������� - ���� FRo=' + FloatToStr((Par1 As TBar).FRo)
  +#10#13 + '����� = ' + FloatToStr((Par1 As TBar).massa));
  Par1.Show;
 end;

 { TBarSon }

function TBarSon.Volume: word;
begin
  result:=Fa*Fb*Fc*1000;
end;

begin
  Transport:= TTransport.Create;
  Automobile:= TAutomobile.Create;
  Toyota:= TToyota.Create;

  Transport:= Automobile;
  Transport:= Toyota;
  Automobile:= Toyota;

end.



