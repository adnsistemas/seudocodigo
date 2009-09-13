program ide;

uses
  Forms,
  ide_editor in 'ide_editor.pas' {editor},
  ide_debugoutput in 'ide_debugoutput.pas' {debugoutput},
  ide_evaluador in 'ide_evaluador.pas' {evaluator},
  SynHighlighterSeudoc in '..\..\Source\SynHighlighterSeudoc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Teditor, editor);
  Application.CreateForm(Tdebugoutput, debugoutput);
  Application.CreateForm(Tevaluator, evaluator);
  Application.Run;
end.
