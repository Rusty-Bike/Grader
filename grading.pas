unit Grading;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    TKey = record
         entire: Double;
         huge:   Double;
         normal: Double;
         tiny:   Double;
    end;
    TResult = record
      earned:  Double;
      percent: Double;
      key:     TKey;
    end;



    TAssignment = record
      points: Integer;
      items:  Integer;
    end;

    TMistakes = record
      entire: Integer;
      huge:   Integer;
      normal: Integer;
      tiny:   Integer;
    end;

    TModel = record
      assignment: TAssignment;
      mistakes:   TMistakes;
      result:     TResult;
    end;

  function Grade(assignment: TAssignment; mistakes: TMistakes): TResult;

implementation
function Grade(assignment: TAssignment; mistakes: TMistakes): TResult;
var
  res: TResult;
begin
  res.key.entire := assignment.points / assignment.items;
  res.key.huge   := res.key.entire / 2;
  res.key.normal := res.key.entire / 4;
  res.key.tiny   := res.key.entire / 8;

  res.earned := assignment.points -
    ((mistakes.entire * res.key.entire)
  + (mistakes.huge * res.key.huge)
  + (mistakes.normal * res.key.normal)
  + (mistakes.tiny * res.key.tiny));

  res.percent := res.earned / assignment.points;

  Grade := res;
end;
end.

