unit gui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, RTTICtrls, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ComCtrls, Spin, ExtCtrls, ExtDlgs, EditBtn, ButtonPanel, Grading;

type

  { TForm1 }

  TForm1 = class(TForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);

  private
    { private declarations }
    Model: TModel;
    procedure UpdateView();
    procedure UpdateModel();
    procedure UpdateAll();
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.UpdateView();
begin
    Label5.Caption := FormatFloat('####0.###', Model.result.earned) + ' / ' + IntToStr(Model.assignment.points) + ': ' + FormatFloat('####0.##', Model.result.percent * 100) + '%';
    Label6.Caption := 'Major: ' + IntToStr(Model.mistakes.major);
    Label7.Caption := 'Minor: ' + IntToStr(Model.mistakes.minor);
end;

procedure TForm1.UpdateModel();
begin
  Model.assignment.points := SpinEdit1.Value;
  Model.assignment.items  := SpinEdit2.Value;
  Model.mistakes.major    := SpinEdit4.Value;
  Model.mistakes.minor    := SpinEdit3.Value;
end;
procedure TForm1.UpdateAll();
begin
  UpdateModel();
  model.result := grade(model.assignment, model.mistakes);
  UpdateView();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  UpdateAll();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  UpdateAll();
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  UpdateAll();
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  UpdateAll();
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
  UpdateAll();
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
  UpdateAll();
end;


end.

