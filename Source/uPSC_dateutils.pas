{ Compile time Date Time library }
unit uPSC_dateutils;

interface
uses
  SysUtils, uPSCompiler, uPSUtils;


procedure RegisterDateTimeLibrary_C(S: TPSPascalCompiler);

implementation

uses langdef;

procedure RegisterDatetimeLibrary_C(S: TPSPascalCompiler);
begin
  s.AddType(CS_TDateTime, btDouble).ExportName := True;
  s.AddDelphiFunction(CS_function + ' ' + CS_EncodeDate + '(Year, Month, Day: ' + CS_Word + '): ' + CS_TDateTime);
  s.AddDelphiFunction(CS_function + ' ' + CS_EncodeTime + '(Hour, Min, Sec, MSec: ' + CS_Word + '): ' + CS_TDateTime);
  s.AddDelphiFunction(CS_function + ' ' + CS_TryEncodeDate + '(Year, Month, Day: ' + CS_Word + '; ' + CS_var + ' Date: ' + CS_TDateTime + '): ' + CS_Boolean);
  s.AddDelphiFunction(CS_function + ' ' + CS_TryEncodeTime + '(Hour, Min, Sec, MSec: ' + CS_Word + '; ' + CS_var + ' Time: ' + CS_TDateTime + '): ' + CS_Boolean);
  s.AddDelphiFunction(CS_procedure + ' ' + CS_DecodeDate + '(' + CS_const + ' DateTime: ' + CS_TDateTime + '; ' + CS_var + ' Year, Month, Day: ' + CS_Word + ')');
  s.AddDelphiFunction(CS_procedure + ' ' + CS_DecodeTime + '(' + CS_const + ' DateTime: ' + CS_TDateTime + '; ' + CS_var + ' Hour, Min, Sec, MSec: ' + CS_Word + ')');
  s.AddDelphiFunction(CS_function + ' ' + CS_DayOfWeek + '(' + CS_const + ' DateTime: ' + CS_TDateTime + '): ' + CS_Word);
  s.AddDelphiFunction(CS_function + ' ' + CS_Date + ': ' + CS_TDateTime);
  s.AddDelphiFunction(CS_function + ' ' + CS_Time + ': ' + CS_TDateTime);
  s.AddDelphiFunction(CS_function + ' ' + CS_Now + ': ' + CS_TDateTime);
  s.AddDelphiFunction(CS_function + ' ' + CS_DateTimeToUnix + '(D: ' + CS_TDateTime + '): ' + CS_Int64);
  s.AddDelphiFunction(CS_function + ' ' + CS_UnixToDateTime + '(U: ' + CS_Int64 + '): ' + CS_TDateTime);

  s.AddDelphiFunction(CS_function + ' ' + CS_DateToStr + '(D: ' + CS_TDateTime + '): ' + CS_String);
  s.AddDelphiFunction(CS_function + ' ' + CS_StrToDate + '(' + CS_const + ' s: ' + CS_String + '): ' + CS_TDateTime);
  s.AddDelphiFunction(CS_function + ' ' + CS_FormatDateTime + '(' + CS_const + ' fmt: ' + CS_String + '; D: ' + CS_TDateTime + '): ' + CS_String);
end;

end.
