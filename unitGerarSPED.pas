unit unitGerarSPED;

interface

uses
  SysUtils ,ACBrSpedPisCofins, ExtCtrls, ComCtrls, ACBrUtil,
  ACBrTXTClass, ACBrNFe, ACBrBase,ACBrEPCBloco_0, ACBrEPCBloco_1,
  ACBrEPCBloco_A, ACBrEPCBloco_C, ACBrEPCBloco_D, ACBrEPCBloco_F,
  ACBrEPCBloco_M, ACBrNFeNotasFiscais, pcnConversao, System.Classes,
  System.Generics.Collections, System.DateUtils, unitBaseSped;

  type

  TEventoOnGerar = procedure(value:string) of object;

  TAcumuladorPISCOFINS = record
   BC: Double;
   ALIQ: Double;
   Valor_Acumulado: Double;
  end;

  TGerarSPED = class(TInterfacedObject, ISpedPisCofins)
   strict private
    FAcumuladorPIS: TAcumuladorPISCOFINS;
    FAcumuladorCOFINS: TAcumuladorPISCOFINS;

    FAcumuladorPIS_SAIDAS: TAcumuladorPISCOFINS;
    FAcumuladorCOFINS_SAIDAS: TAcumuladorPISCOFINS;
  private
    procedure GerarBlocoC000;
    procedure GerarBlocoM_Apuracao;
   public
    FOnGerar: TEventoOnGerar;
    FAcbrPisCofins: TACBrSPEDPisCofins;
    FNotasFiscais: TNotasFiscais;
    FCONTADOR_0150: integer;
    FListaUnidades : TList<string>;
    FListaParticipantes : TList<string>;
    FListaProdutos : TList<string>;
    FDadosPessoais : TDadosPessoas;
    FPeriodo : TPeriodo;

    procedure setAcumuladorPIS(pnBase:Double;pnAliq:Double;pnValor:Double);
    procedure setAcumuladorCOFINS(pnBase:Double;pnAliq:Double;pnValor:Double);
    procedure setAcumuladorPIS_SAIDAS(pnBase:Double;pnAliq:Double;pnValor:Double);
    procedure setAcumuladorCOFINS_SAIDAS(pnBase:Double;pnAliq:Double;pnValor:Double);


    procedure PopularSped;
    procedure GerarBloco0000;
    procedure GerarBloco0100;
    procedure GerarBloco0140;
    procedure GerarBloco0150(nf: NotaFiscal);
    procedure GerarBloco0500;
    procedure GerarBlocoC010;



    procedure OnGerarTEventoOnGerar(evento:TEventoOnGerar);
    procedure gerarArquivo(pDtInicio,pDtFim:string; dados: TDadosPessoas; nomeArquivo:string = 'c:\spedPisCofins.txt');
    constructor Create(notasFiscais: TNotasFiscais);
    destructor Destroy();
  end;

implementation

uses
   ACBrEPCBlocos, unitNotaFiscalModelo_NFe;



{ TGerarSPED }

constructor TGerarSPED.Create(notasFiscais: TNotasFiscais);
begin
  // Contadores
  FCONTADOR_0150 := 0;

  // Objetos
  FAcbrPisCofins := TACBrSPEDPisCofins.Create(nil);
  FNotasFiscais := notasFiscais;
end;

destructor TGerarSPED.Destroy;
begin
  FreeAndNil(FAcbrPisCofins);
  FreeAndNil(FListaUnidades);
  FreeAndNil(FListaParticipantes);
  FreeAndNil(FListaProdutos);

  inherited;
end;

procedure TGerarSPED.GerarBlocoM_Apuracao;
var
  M200_PAGAR: Double;
  M600_PAGAR: Double;
begin
  with FAcbrPisCofins.Bloco_M do
  begin
    // PIS
    RegistroM001New.IND_MOV := imComDados;
    with RegistroM100New do
    begin
      COD_CRED := '101';
      IND_CRED_ORI := icoOperProprias;
      VL_BC_PIS := FAcumuladorPIS.BC;
      ALIQ_PIS := FAcumuladorPIS.ALIQ;
      VL_CRED := FAcumuladorPIS.Valor_Acumulado;
      VL_CRED_DISP := FAcumuladorPIS.Valor_Acumulado;
      VL_CRED_DESC := FAcumuladorPIS.Valor_Acumulado;
      with RegistroM105New do
      begin
        NAT_BC_CRED := bccAqBensRevenda;
        CST_PIS := StrToCstPis('50');
        VL_BC_PIS_TOT := FAcumuladorPIS.BC;
        VL_BC_PIS_NC := FAcumuladorPIS.BC;
        VL_BC_PIS := FAcumuladorPIS.BC;
      end;
    end;
    with RegistroM200New do
    begin
      M200_PAGAR := FAcumuladorPIS_SAIDAS.Valor_Acumulado - FAcumuladorPIS.Valor_Acumulado;
      VL_TOT_CONT_NC_PER := FAcumuladorPIS_SAIDAS.Valor_Acumulado;
      VL_TOT_CRED_DESC := FAcumuladorPIS.Valor_Acumulado;
      if M200_PAGAR < 0 then
      begin
        VL_TOT_CONT_NC_DEV := 0;
        VL_CONT_NC_REC := 0;
        VL_TOT_CONT_REC := 0;
      end
      else
      begin
        VL_TOT_CONT_NC_DEV := M200_PAGAR;
        VL_CONT_NC_REC := M200_PAGAR;
        VL_TOT_CONT_REC := M200_PAGAR;
        with RegistroM205New do
        begin
          NUM_CAMPO := '08';
          COD_REC := '691201';
          if M200_PAGAR > 0 then
            VL_DEBITO := M200_PAGAR;
        end;
      end;
    end;
    // COFINS
    with RegistroM500New do
    begin
      COD_CRED := '101';
      IND_CRED_ORI := icoOperProprias;
      VL_BC_COFINS := FAcumuladorCOFINS.BC;
      ALIQ_COFINS := FAcumuladorCOFINS.ALIQ;
      VL_CRED := FAcumuladorCOFINS.Valor_Acumulado;
      VL_CRED_DISP := FAcumuladorCOFINS.Valor_Acumulado;
      VL_CRED_DESC := FAcumuladorCOFINS.Valor_Acumulado;
      with RegistroM505New do
      begin
        NAT_BC_CRED := bccAqBensRevenda;
        CST_COFINS := StrToCstCofins('50');
        VL_BC_COFINS_TOT := FAcumuladorCOFINS.BC;
        VL_BC_COFINS_NC := FAcumuladorCOFINS.BC;
        VL_BC_COFINS := FAcumuladorCOFINS.BC;
      end;
    end;
    with RegistroM600New do
    begin
      M600_PAGAR := FAcumuladorCOFINS_SAIDAS.Valor_Acumulado - FAcumuladorCOFINS.Valor_Acumulado;
      VL_TOT_CONT_NC_PER := FAcumuladorPIS_SAIDAS.Valor_Acumulado;
      VL_TOT_CRED_DESC := FAcumuladorCOFINS.Valor_Acumulado;
      if M600_PAGAR < 0 then
      begin
        VL_TOT_CONT_NC_DEV := 0;
        VL_CONT_NC_REC := 0;
        VL_TOT_CONT_REC := 0;
      end
      else
      begin
        VL_TOT_CONT_NC_DEV := M600_PAGAR;
        VL_CONT_NC_REC := M600_PAGAR;
        VL_TOT_CONT_REC := M600_PAGAR;
        with RegistroM605New do
        begin
          NUM_CAMPO := '08';
          COD_REC := '585601';
          if M600_PAGAR > 0 then
            VL_DEBITO := M600_PAGAR;
        end;
      end;
    end;
  end;
end;

procedure TGerarSPED.GerarBlocoC000;
begin
  with FAcbrPisCofins.Bloco_C.RegistroC001New do
  begin
    IND_MOV := imComDados;
  end;
end;

procedure TGerarSPED.GerarBloco0500;
begin
   with FAcbrPisCofins.Bloco_0.Registro0500New do
   begin
     COD_CTA := cta_entrada;
     IND_CTA := indCTAnalitica;
     NOME_CTA := 'Entradas';
     DT_ALT := StartOfTheYear(Now);
     NIVEL := '1';
   end;
   with FAcbrPisCofins.Bloco_0.Registro0500New do
   begin
     COD_CTA := cta_saida;
     IND_CTA := indCTAnalitica;
     NOME_CTA := 'Saidas';
     DT_ALT := StartOfTheYear(Now);
     NIVEL := '1';
   end;
end;

procedure TGerarSPED.GerarBloco0000;
begin

  // Geracao do Blocos
  with FAcbrPisCofins do
  begin
   DT_INI := FPeriodo.dt_inicial;
   DT_FIN := FPeriodo.dt_final;
  end;

  with Self.FAcbrPisCofins.Bloco_0.Registro0000New do
  begin
    COD_VER := vlVersao320;
    TIPO_ESCRIT := tpEscrOriginal;
    IND_SIT_ESP := indNenhum;
    DT_INI := FPeriodo.dt_inicial;
    DT_FIN := FPeriodo.dt_final;
    NOME := FDadosPessoais.empresa.Razao;
    CNPJ := FDadosPessoais.empresa.cnpj;
    UF := FDadosPessoais.empresa.uf;
    COD_MUN := StrToIntDef(FDadosPessoais.empresa.cod_municipio,0);
    SUFRAMA := FDadosPessoais.empresa.suframa;
    IND_NAT_PJ := indNatPJSocEmpresariaGeral;
    IND_ATIV := indAtivComercio;
  end;
end;

procedure TGerarSPED.GerarBlocoC010;
begin
  with FAcbrPisCofins.Bloco_C.RegistroC010New do
  begin
    CNPJ := FDadosPessoais.empresa.cnpj;
    IND_ESCRI := IndEscriIndividualizado;
  end;
end;

procedure TGerarSPED.gerarArquivo(pDtInicio,pDtFim:string; dados: TDadosPessoas; nomeArquivo:string);
begin

   // Informa o pasta onde será salvo o arquivo TXT.
   FAcbrPisCofins.Path := './';
   FAcbrPisCofins.Arquivo := nomeArquivo;

   // Popula os dados da Empresa e do Contador
   FDadosPessoais:= dados ;

   // Popula as datas
   with FPeriodo do
   begin
     dt_inicial := StrToDateTime(pDtInicio);
     dt_final := StrToDateTime(pDtFim);
   end;

   // Onde a magia funciona
   self.PopularSped;

   // Método que gera o arquivo TXT.
   Self.FAcbrPisCofins.SaveFileTXT ;

   if Assigned(Self.FOnGerar) then
    Self.FOnGerar(nomeArquivo);
end;

procedure TGerarSPED.OnGerarTEventoOnGerar(evento: TEventoOnGerar);
begin
  FOnGerar:= evento;
end;

procedure TGerarSPED.PopularSped;
var
  n: integer;
  nfe: NotaFiscal;
  notafiscal: INotasFiscais;
begin
   FAcbrPisCofins.LimpaRegistros ;

   FListaUnidades       := TList<string>.Create;
   FListaParticipantes  := TList<string>.Create;
   FListaProdutos       := TList<string>.Create;

   Self.GerarBloco0000;
   Self.GerarBloco0100;
   Self.GerarBloco0140;
   Self.GerarBloco0500;

   Self.GerarBlocoC000;
   Self.GerarBlocoC010;

   for n := 0 to FNotasFiscais.Count-1 do
   begin
     nfe := FNotasFiscais.Items[n];
     case nfe.NFe.Ide.modelo of
      55 :
        begin
          GerarBloco0150(nfe);
          notafiscal := TNotaFiscalModelo_NFe.Create(nfe,self);
        end;
      65 :
        begin
          raise Exception.Create('ATENCAO, NFCE ainda não está implementado totalmente');
        end;
     end;
     notafiscal.processar;
   end;

  GerarBlocoM_Apuracao;
end;

procedure TGerarSPED.setAcumuladorCOFINS(pnBase, pnAliq, pnValor: Double);
begin
  if (Self.FAcumuladorCOFINS.ALIQ > 0) and (Self.FAcumuladorCOFINS.ALIQ <> pnAliq ) then
    raise Exception.Create('Aliquota de COFINS diferente do esperado!!');

  Self.FAcumuladorCOFINS.BC := Self.FAcumuladorCOFINS.BC + pnBase;
  Self.FAcumuladorCOFINS.ALIQ := pnAliq;
  Self.FAcumuladorCOFINS.Valor_Acumulado := Self.FAcumuladorCOFINS.Valor_Acumulado + pnValor;
end;

procedure TGerarSPED.setAcumuladorCOFINS_SAIDAS(pnBase, pnAliq, pnValor: Double);
begin
  if (Self.FAcumuladorCOFINS_SAIDAS.ALIQ > 0) and (Self.FAcumuladorCOFINS_SAIDAS.ALIQ <> pnAliq ) then
    raise Exception.Create('Aliquota de COFINS diferente do esperado!!');

  Self.FAcumuladorCOFINS_SAIDAS.BC := Self.FAcumuladorCOFINS_SAIDAS.BC + pnBase;
  Self.FAcumuladorCOFINS_SAIDAS.ALIQ := pnAliq;
  Self.FAcumuladorCOFINS_SAIDAS.Valor_Acumulado := Self.FAcumuladorCOFINS_SAIDAS.Valor_Acumulado + pnValor;
end;

procedure TGerarSPED.setAcumuladorPIS(pnBase, pnAliq, pnValor: Double);
begin
  if (Self.FAcumuladorPIS.ALIQ > 0) and (Self.FAcumuladorPIS.ALIQ <> pnAliq ) then
    raise Exception.Create('Aliquota de PIS diferente do esperado!!');

  Self.FAcumuladorPIS.BC := Self.FAcumuladorPIS.BC + pnBase;
  Self.FAcumuladorPIS.ALIQ := pnAliq;
  Self.FAcumuladorPIS.Valor_Acumulado := Self.FAcumuladorPIS.Valor_Acumulado + pnValor;
end;

procedure TGerarSPED.setAcumuladorPIS_SAIDAS(pnBase, pnAliq, pnValor: Double);
begin
  if (Self.FAcumuladorPIS_SAIDAS.ALIQ > 0) and (Self.FAcumuladorPIS_SAIDAS.ALIQ <> pnAliq ) then
    raise Exception.Create('Aliquota de PIS diferente do esperado!!');

  Self.FAcumuladorPIS_SAIDAS.BC := Self.FAcumuladorPIS_SAIDAS.BC + pnBase;
  Self.FAcumuladorPIS_SAIDAS.ALIQ := pnAliq;
  Self.FAcumuladorPIS_SAIDAS.Valor_Acumulado := Self.FAcumuladorPIS_SAIDAS.Valor_Acumulado + pnValor;
end;

procedure TGerarSPED.GerarBloco0140;
begin
  with FAcbrPisCofins.Bloco_0.Registro0140New do
  begin
     COD_EST := IntToStr(1);
     NOME    := FDadosPessoais.empresa.Fantasia;
     CNPJ    := FDadosPessoais.empresa.cnpj;
     UF      := FDadosPessoais.empresa.uf;
     IE      := FDadosPessoais.empresa.ie;
     COD_MUN := StrToIntDef(FDadosPessoais.empresa.cod_municipio,0);
     IM      := FDadosPessoais.empresa.im;
     SUFRAMA := FDadosPessoais.empresa.suframa;
  end;
end;

procedure TGerarSPED.GerarBloco0100;
begin
  with Self.FAcbrPisCofins.Bloco_0.Registro0100New do
  begin
    NOME := FDadosPessoais.contador.Nome;
    CPF := FDadosPessoais.contador.CPF;
    CRC := FDadosPessoais.contador.CRC;
    CNPJ := FDadosPessoais.contador.CNPJ;
    CEP := FDadosPessoais.contador.CEP;
    ENDERECO := FDadosPessoais.contador.Logradouro;
    NUM := FDadosPessoais.contador.Numero;
    COMPL := FDadosPessoais.contador.Complemento;
    BAIRRO := FDadosPessoais.contador.Bairro;
    FONE := FDadosPessoais.contador.Fone;
    FAX := FDadosPessoais.contador.Fax;
    EMAIL := FDadosPessoais.contador.Email;
    COD_MUN := StrToIntDef( FDadosPessoais.contador.Cod_Municipio, 0);
  end;
end;

procedure TGerarSPED.GerarBloco0150(nf: NotaFiscal);
begin
 with nf.NFe do
 begin
   if RetornaModalidadeNF(nf, FDadosPessoais.empresa.cnpj) = ENTRADA then
   begin
      if not FListaParticipantes.Contains(Emit.CNPJCPF) then
      begin
        FListaParticipantes.Add(Emit.CNPJCPF);
        //0150 - Tabela de Cadastro do Participante
        with FAcbrPisCofins.Bloco_0.Registro0150New do
        begin
           COD_PART := Emit.CNPJCPF;
           NOME     := Emit.xNome;
           COD_PAIS := '1058';
           if (Emit.CNPJCPF.Length = 11) then
            CPF :=  Emit.CNPJCPF
           else
            CNPJ := Emit.CNPJCPF;
           IE       := Emit.IE;
           COD_MUN  := Emit.EnderEmit.cMun;
           SUFRAMA  := '';
           ENDERECO := Emit.EnderEmit.xLgr;
           NUM      := Emit.EnderEmit.nro;
           COMPL    := Emit.EnderEmit.xCpl;
           BAIRRO   := Emit.EnderEmit.xBairro;
           //
        end;
      end;
   end;

   if RetornaModalidadeNF(nf, FDadosPessoais.empresa.cnpj) = SAIDA then
   begin
      if not FListaParticipantes.Contains(Dest.CNPJCPF) then
      begin
        FListaParticipantes.Add(Dest.CNPJCPF);
        //0150 - Tabela de Cadastro do Participante
        with FAcbrPisCofins.Bloco_0.Registro0150New do
        begin
           COD_PART := Dest.CNPJCPF;
           NOME     := Dest.xNome;
           COD_PAIS := '1058';
           if (Dest.CNPJCPF.Length = 11) then
            CPF :=  Dest.CNPJCPF
           else
            CNPJ := Dest.CNPJCPF;
           IE       := Dest.IE;
           COD_MUN  := Dest.EnderDest.cMun;
           SUFRAMA  := '';
           ENDERECO := Dest.EnderDest.xLgr;
           NUM      := Dest.EnderDest.nro;
           COMPL    := Dest.EnderDest.xCpl;
           BAIRRO   := Dest.EnderDest.xBairro;
           //
        end;
      end;
   end;

 end;

end;

end.
