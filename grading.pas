unit Grading;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    TResult = record
      earned:  Double;
      percent: Double;
    end;

    TAssignment = record
      points: Integer;
      items:  Integer;
    end;

    TMistakes = record
      major: Integer;
      minor: Integer;
    end;

    TModel = record
      assignment: TAssignment;
      mistakes:   TMistakes;
      result: TResult;
    end;

  function Grade(assignment: TAssignment; mistakes: TMistakes): TResult;

implementation
function Grade(assignment: TAssignment; mistakes: TMistakes): TResult;
var
  minorMistake: double;
  majorMistake: double;
  res: TResult;
begin
  majorMistake := assignment.points / assignment.items;
  minorMistake := majorMistake / 4;

  res.earned := assignment.points - (mistakes.major * majorMistake + mistakes.minor * minorMistake);
  res.percent := res.earned / assignment.points;

  Grade := res;
end;
end.

