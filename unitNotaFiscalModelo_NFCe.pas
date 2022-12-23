unit unitNotaFiscalModelo_NFCe;

interface

uses
  unitBaseSped,ACBrNFeNotasFiscais,ACBrSpedPisCofins;

Type
TNotaFiscalModelo_NFCe = class(TInterfacedObject,INotasFiscais)
  procedure importarNFe(notaFiscal: NotaFiscal; sped:TACBrSPEDPisCofins);
  procedure processar;
end;

implementation

{ TNotaFiscalModelo_NFCe }

procedure TNotaFiscalModelo_NFCe.importarNFe(notaFiscal: NotaFiscal; sped: TACBrSPEDPisCofins);
begin

end;

procedure TNotaFiscalModelo_NFCe.processar;
begin

end;

end.
