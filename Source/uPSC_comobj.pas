{ compiletime ComObj support }
unit uPSC_comobj;

{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils, langdef;

{
 
Will register:
 
function CreateOleObject(const ClassName: String): IDispatch;
function GetActiveOleObject(const ClassName: String): IDispatch;

}

procedure SIRegister_ComObj(cl: TPSPascalCompiler);

implementation

procedure SIRegister_ComObj(cl: TPSPascalCompiler);
begin
  cl.AddDelphiFunction(CS_function + ' ' + CS_CreateOleObject + '(' + CS_const + ' ClassName: ' + CS_String + '): ' + CS_IDispatch + CS_iend);
  cl.AddDelphiFunction(CS_function + ' ' + CS_GetActiveOleObject + '(' + CS_const + ' ClassName: ' + CS_String + '): ' + CS_IDispatch + CS_iend);
end;

end.
