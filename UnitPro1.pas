unit UnitPro1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TParallel = class
  public
  procedure Show_Static;
  procedure Show_Virtual; virtual;
  end;

  TBar = class(TParallel)
  public
  procedure Show_Static;
  procedure Show_Virtual; override;
  end;

  TParallelSon = class(TParallel)
  public
  procedure Show_Virtual; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Parallel:TParallel;
  Bar:TBar;
begin
  Parallel:=TParallel.Create;
  Parallel.Show_Static;
  Parallel.Destroy;

  Parallel:=TBar.Create;
  Parallel.Show_Static;
  Parallel.Destroy;

  Bar:=TBar.Create;
  Bar.Show_Static;
  Bar.Destroy;
end;

{ TParallel }

procedure TParallel.Show_Static;
begin
  ShowMessage('TParallel.Show_Static');
end;

procedure TParallel.Show_Virtual;
begin
  ShowMessage('TParallel.Show_Virtual');
end;

{ TBar }

procedure TBar.Show_Static;
begin
  ShowMessage('TBar.Show_Static');
end;

procedure TBar.Show_Virtual;
begin
  ShowMessage('TBar.Show_Virtual');
end;

{ TParallelSon }

procedure TParallelSon.Show_Virtual;
begin
  ShowMessage('TParallelSon.Show_Virtual');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Parallel:TParallel;
begin
  Parallel:=TParallel.Create;
  Parallel.Show_Virtual;
  Parallel.Destroy;

  Parallel:=TBar.Create;
  Parallel.Show_Virtual;
  Parallel.Destroy;

  Parallel:=TParallelSon.Create;
  Parallel.Show_Virtual;
  Parallel.Destroy;
end;

end.
