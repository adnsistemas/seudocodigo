program seudocodigo;

{$R *.dres}

uses
  Forms,
  ide_editor in 'ide_editor.pas' {editor},
  ide_evaluador in 'ide_evaluador.pas' {evaluator},
  ide_about in 'ide_about.pas' {AcercaForm},
  id_config in 'id_config.pas' {FormConfiguracion},
  ide_search in 'ide_search.pas' {LocalizarForm},
  ide_monitor in 'ide_monitor.pas' {VMonitorForm},
  UseHTMLHelp in '..\UseHTMLHelp.pas',
  UAyudaForm in '..\..\UAyudaForm.pas' {AyudaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Seudocódigo';
  Application.HelpFile := '.\Ayuda\SEUDOCODIGO.CHM';
  Application.CreateForm(Teditor, editor);
  Application.CreateForm(Tevaluator, evaluator);
  Application.CreateForm(TAcercaForm, AcercaForm);
  Application.CreateForm(TFormConfiguracion, FormConfiguracion);
  Application.CreateForm(TLocalizarForm, LocalizarForm);
  Application.CreateForm(TVMonitorForm, VMonitorForm);
  Application.CreateForm(TAyudaForm, AyudaForm);
  Application.Run;
end.
