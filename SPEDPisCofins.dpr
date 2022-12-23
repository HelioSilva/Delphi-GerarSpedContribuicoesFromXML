program SPEDPisCofins;

uses
  Forms,
  Frm_SPEDPisCofins in 'Frm_SPEDPisCofins.pas' {FrmSPEDPisCofins},
  unitGerarSPED in 'unitGerarSPED.pas',
  unitIni in 'unitIni.pas',
  unitBaseSped in 'interfaces\unitBaseSped.pas',
  unitNotaFiscalModelo_NFe in 'unitNotaFiscalModelo_NFe.pas',
  unitNotaFiscalModelo_NFCe in 'unitNotaFiscalModelo_NFCe.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSPEDPisCofins, FrmSPEDPisCofins);
  Application.Run;
end.
