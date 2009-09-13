
unit uPSR_dateutils;
{$I PascalScript.inc}
interface
uses
  SysUtils, uPSRuntime;



procedure RegisterDateTimeLibrary_R(S: TPSExec);

implementation

uses langdef;

function TryEncodeDate(Year, Month, Day: Word; var Date: TDateTime): Boolean;
begin
  try
    Date := EncodeDate(Year, Month, Day);
    Result := true;
  except
    Result := false;
  end;
end;

function TryEncodeTime(Hour, Min, Sec, MSec: Word; var Time: TDateTime): Boolean;
begin
  try
    Time := EncodeTime(hour, Min, Sec, MSec);
    Result := true;
  except
    Result := false;
  end;
end;

function DateTimeToUnix(D: TDateTime): Int64;
begin
  Result := Round((D - 25569) * 86400);
end;

function UnixToDateTime(U: Int64): TDateTime;
begin
  Result := U / 86400 + 25569;
end;

procedure RegisterDateTimeLibrary_R(S: TPSExec);
begin
  S.RegisterDelphiFunction(@EncodeDate, CS_ENCODEDATE, cdRegister);
  S.RegisterDelphiFunction(@EncodeTime, CS_ENCODETIME, cdRegister);
  S.RegisterDelphiFunction(@TryEncodeDate, CS_TRYENCODEDATE, cdRegister);
  S.RegisterDelphiFunction(@TryEncodeTime, CS_TRYENCODETIME, cdRegister);
  S.RegisterDelphiFunction(@DecodeDate, CS_DECODEDATE, cdRegister);
  S.RegisterDelphiFunction(@DecodeTime, CS_DECODETIME, cdRegister);
  S.RegisterDelphiFunction(@DayOfWeek, CS_DAYOFWEEK, cdRegister);
  S.RegisterDelphiFunction(@Date, CS_DATE, cdRegister);
  S.RegisterDelphiFunction(@Time, CS_TIME, cdRegister);
  S.RegisterDelphiFunction(@Now, CS_NOW, cdRegister);
  S.RegisterDelphiFunction(@DateTimeToUnix, CS_DATETIMETOUNIX, cdRegister);
  S.RegisterDelphiFunction(@UnixToDateTime, CS_UNIXTODATETIME, cdRegister);
  S.RegisterDelphiFunction(@DateToStr, CS_DATETOSTR, cdRegister);
  S.RegisterDelphiFunction(@FormatDateTime, CS_FORMATDATETIME, cdRegister);
  S.RegisterDelphiFunction(@StrToDate, CS_STRTODATE, cdRegister);
end;

end.
