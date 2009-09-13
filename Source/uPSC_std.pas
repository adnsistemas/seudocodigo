{ Compiletime TObject, TPersistent and TComponent definitions }
unit uPSC_std;
{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;

{
  Will register files from:
    System
    Classes (Only TComponent and TPersistent)

}

procedure SIRegister_Std_TypesAndConsts(Cl: TPSPascalCompiler);
procedure SIRegisterTObject(CL: TPSPascalCompiler);
procedure SIRegisterTPersistent(Cl: TPSPascalCompiler);
procedure SIRegisterTComponent(Cl: TPSPascalCompiler);

procedure SIRegister_Std(Cl: TPSPascalCompiler);

implementation

uses langdef;

procedure SIRegisterTObject(CL: TPSPascalCompiler);
begin
  with Cl.AddClassN(nil, CS_TOBJECT) do
  begin
    RegisterMethod(CS_constructor + ' ' + CS_Create);
    RegisterMethod(CS_procedure + ' ' + CS_Free);
  end;
end;

procedure SIRegisterTPersistent(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TObject), CS_TPERSISTENT) do
  begin
    RegisterMethod(CS_procedure + ' ' + CS_Assign + '(Source: ' + CS_TPersistent + ')');
  end;
end;

procedure SIRegisterTComponent(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass(CS_TPersistent), CS_TCOMPONENT) do
  begin
    RegisterMethod(CS_function + ' ' + CS_FindComponent + '(AName: ' + CS_String + ' ): ' + CS_TComponent);
    RegisterMethod(CS_constructor + ' ' + CS_Create + '(AOwner: ' + CS_TComponent + ');' + CS_virtual);

    RegisterProperty(CS_Owner, CS_TComponent, iptRW);
    RegisterMethod(CS_procedure + ' ' + CS_DESTROYCOMPONENTS);
    RegisterMethod(CS_procedure + ' ' + CS_DESTROYING);
    RegisterMethod(CS_procedure + ' ' + CS_FREENOTIFICATION + '(ACOMPONENT:' + CS_TCOMPONENT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_INSERTCOMPONENT + '(ACOMPONENT:' + CS_TCOMPONENT + ')');
    RegisterMethod(CS_procedure + ' ' + CS_REMOVECOMPONENT + '(ACOMPONENT:' + CS_TCOMPONENT + ')');
    RegisterProperty(CS_COMPONENTS, CS_TCOMPONENT + ' ' + CS_INTEGER, iptr);
    RegisterProperty(CS_COMPONENTCOUNT, CS_INTEGER, iptr);
    RegisterProperty(CS_COMPONENTINDEX, CS_INTEGER, iptrw);
    RegisterProperty(CS_COMPONENTSTATE, CS_Byte, iptr);
    RegisterProperty(CS_DESIGNINFO, CS_LONGINT, iptrw);
    RegisterProperty(CS_NAME, CS_String, iptrw);
    RegisterProperty(CS_TAG, CS_LONGINT, iptrw);
  end;
end;




procedure SIRegister_Std_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS(CS_TComponentStateE, '(' + CS_csLoading + ', ' + CS_csReading + ', ' + CS_csWriting + ', ' + CS_csDestroying + ', ' + CS_csDesigning + ', ' + CS_csAncestor + ', ' + CS_csUpdating + ', ' + CS_csFixups + ', ' + CS_csFreeNotification + ', ' + CS_csInline + ', ' + CS_csDesignInstance + ')');
  cl.AddTypeS(CS_TComponentState, CS_set_of + CS_TComponentStateE);
  Cl.AddTypeS(CS_TRect, CS_record + ' ' + CS_Integer + ' Left, Top, Right, Bottom' + CS_iend + CS_end);
end;

procedure SIRegister_Std(Cl: TPSPascalCompiler);
begin
  SIRegister_Std_TypesAndConsts(Cl);
  SIRegisterTObject(CL);
  SIRegisterTPersistent(Cl);
  SIRegisterTComponent(Cl);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


End.

