program BuscaFiscalExample;

uses
  Vcl.Forms,
  View.Main in 'View.Main.pas' {FormMain} ,
  BuscaFiscal.Model in '..\src\BuscaFiscal.Model.pas',
  BuscaFiscal.Client in '..\src\BuscaFiscal.Client.pas',
  BuscaFiscal.Component in '..\src\BuscaFiscal.Component.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}


begin
  Application.Initialize;
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
