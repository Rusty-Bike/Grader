unit gui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, RTTICtrls, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ComCtrls, Spin, ExtCtrls, ExtDlgs, EditBtn, ButtonPanel, Grading;

type

  { TMainForm }

  TMainForm = class(TForm)
    Bevel: TBevel;
    GroupBox: TGroupBox;
    ItemsLabel: TLabel;
    PointsLabel: TLabel;
    MinorLabel: TLabel;
    MajorLabels: TLabel;
    ScoreLabel: TLabel;
    MajorScaleLabel: TLabel;
    MinorScaleLabel: TLabel;
    Panel: TPanel;
    PointsEdit: TSpinEdit;
    ItemsEdit: TSpinEdit;
    MinorEdit: TSpinEdit;
    MajorEdit: TSpinEdit;
    GradeScaleLabel: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelClick(Sender: TObject);
    procedure PointsEditChange(Sender: TObject);
    procedure ItemsEditChange(Sender: TObject);
    procedure MinorEditChange(Sender: TObject);
    procedure MajorEditChange(Sender: TObject);

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
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }
procedure TMainForm.UpdateView();
begin
    ScoreLabel.Caption := FormatFloat('####0.###', Model.result.earned) + ' / ' + IntToStr(Model.assignment.points) + ': ' + FormatFloat('####0.##', Model.result.percent * 100) + '%';
    MajorScaleLabel.Caption := 'Major: ' + IntToStr(Model.mistakes.major);
    MinorScaleLabel.Caption := 'Minor: ' + IntToStr(Model.mistakes.minor);
end;

procedure TMainForm.UpdateModel();
begin
  Model.assignment.points := PointsEdit.Value;
  Model.assignment.items  := ItemsEdit.Value;
  Model.mistakes.major    := MajorEdit.Value;
  Model.mistakes.minor    := MinorEdit.Value;
end;
procedure TMainForm.UpdateAll();
begin
  UpdateModel();
  model.result := grade(model.assignment, model.mistakes);
  UpdateView();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  UpdateAll();
end;

procedure TMainForm.PanelClick(Sender: TObject);
begin

end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  UpdateAll();
end;

procedure TMainForm.PointsEditChange(Sender: TObject);
begin
  UpdateAll();
end;

procedure TMainForm.ItemsEditChange(Sender: TObject);
begin
  UpdateAll();
end;

procedure TMainForm.MinorEditChange(Sender: TObject);
begin
  UpdateAll();
end;

procedure TMainForm.MajorEditChange(Sender: TObject);
begin
  UpdateAll();
end;


end.

