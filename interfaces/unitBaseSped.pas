unit unitBaseSped;

interface

uses
  ACBrNFeNotasFiscais,ACBrSpedPisCofins,System.Generics.Collections;

type

  TPeriodo = record
    dt_inicial: TDateTime;
    dt_final: TDateTime;
  end;

  TModalidade_NF = (SAIDA,ENTRADA);

  TEmpresa = record
    Razao: string;
    Fantasia: string;
    cnpj: string;
    ie: string;
    im: string;
    cod_municipio: string;
    uf: string;
    suframa: string;
  end;

  TContador = record
    Nome: string;
    CPF: string;
    CRC: string;
    CNPJ: string;
    Logradouro: string;
    Numero: string;
    CEP: string;
    Complemento: string;
    Bairro: string;
    Fone: string;
    Cod_Municipio: string;
    Fax: string;
    Email: string;
  end;

  TDadosPessoas = record
    empresa: TEmpresa;
    contador: TContador;
  end;

INotasFiscais = interface
  ['{A8525FC8-8085-4349-8A24-5CA0722DA35A}']
  procedure processar;
end;

ISpedPisCofins = interface
 ['{08705E49-C1A0-4D56-BA20-F61A8F1BA1CF}']
// function GerarBloco0000:ISpedPisCofins;
// function GerarBloco0100:ISpedPisCofins;
// function GerarBloco0140:ISpedPisCofins;
// function GerarBloco0150(nf: NotaFiscal):ISpedPisCofins;
// function GerarBloco0500:ISpedPisCofins;
 procedure gerarArquivo(pDtInicio,pDtFim:string; dados: TDadosPessoas; nomeArquivo:string);
end;

function RetornaModalidadeNF(xml:NotaFiscal;cnpj_empresa:string):TModalidade_NF;

const
   cta_entrada = '35625';
   cta_saida = '13548';

implementation

function RetornaModalidadeNF(xml:NotaFiscal;cnpj_empresa:string):TModalidade_NF;
begin
  if xml.NFe.Emit.CNPJCPF = cnpj_empresa then
   Result := TModalidade_NF.SAIDA
  else
   Result := TModalidade_NF.ENTRADA;
end;



end.
