unit ide_debugoutput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tdebugoutput = class(TForm)
    output: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  debugoutput: Tdebugoutput;

implementation

uses ide_editor;

{$R *.dfm}

{ Tdebugoutput }

procedure Tdebugoutput.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle  := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure Tdebugoutput.FormCreate(Sender: TObject);
begin
  ManualDock(editor.PageControl1);
end;

end.
