unit unitNotaFiscalModelo_NFe;

interface

uses
  unitBaseSped, ACBrNFeNotasFiscais, ACBrSpedPisCofins, ACBrEPCBlocos,
  System.Generics.Collections, SysUtils, ACBrEPCBloco_0, pcnConversao,
  unitGerarSPED;

type
  TNotaFiscalModelo_NFe = class(TInterfacedObject, INotasFiscais)
  private
    FNotaFiscal: NotaFiscal;
    FProps : TGerarSPED;
  public
    class function ConverteCstSaidaParaEntrada(cstSaida: string): string;
    constructor Create(var notaFiscal: NotaFiscal; var props:TGerarSPED);
    procedure processar;
  end;

const
  CST_PIS_COFINS_ENTRADA: array[0..9] of Integer = (50, 99, 99, 73, 75, 73, 71, 74, 72, 99);
  CST_PIS_COFINS_SAIDA: array[0..9] of Integer = (1, 2, 3, 4, 5, 6, 7, 8, 9, 49);

implementation

{ TNotaFiscalModelo_NFe }

class function TNotaFiscalModelo_NFe.ConverteCstSaidaParaEntrada(cstSaida: string): string;
var
  I: Integer;
begin

  for I := Low(CST_PIS_COFINS_SAIDA) to High(CST_PIS_COFINS_SAIDA) do
  begin
    if CST_PIS_COFINS_SAIDA[I] = StrToIntDef(cstSaida, 49) then
    begin
      result := CST_PIS_COFINS_ENTRADA[I].ToString;
      exit;
    end;
  end;

end;

constructor TNotaFiscalModelo_NFe.Create(var notaFiscal: notaFiscal; var props:TGerarSPED);
begin
  FNotaFiscal := notaFiscal;
  FProps := props;
end;

procedure TNotaFiscalModelo_NFe.processar;
var
  i: Integer;
  b : Boolean;
begin
  with FNotaFiscal.NFe do
  begin
    //C100 - Documento - Nota Fiscal (código 01), Nota Fiscal Avulsa (código 1B), Nota
    // Fiscal de Produtor (código 04) e NF-e (código 55)
    with FProps.FAcbrPisCofins.Bloco_C.RegistroC100New do
    begin

      if RetornaModalidadeNF(FNotaFiscal, FProps.FAcbrPisCofins.Bloco_0.Registro0000.CNPJ) = ENTRADA then
      begin
        IND_OPER := tpEntradaAquisicao;
        COD_PART := Emit.CNPJCPF; //Baseado no registro 0200
        IND_EMIT := edTerceiros;
      end
      else
      begin
        IND_OPER := tpSaidaPrestacao;
        COD_PART := Dest.CNPJCPF; //Baseado no registro 0200

        if Emit.CNPJCPF = FProps.FAcbrPisCofins.Bloco_0.Registro0000.CNPJ then
          IND_EMIT := edEmissaoPropria
        else
          IND_EMIT := edTerceiros;
      end;

      COD_MOD := Ide.modelo.ToString;
      COD_SIT := sdRegular;
      SER := Ide.serie.ToString;
      NUM_DOC := Ide.nNF.ToString; //
      CHV_NFE := procNFe.chNFe;
      DT_DOC := Ide.dEmi;
      DT_E_S := Ide.dSaiEnt;
      VL_DOC := Total.ICMSTot.vNF;
      IND_PGTO := tpSemPagamento;
      VL_DESC := Total.ICMSTot.vDesc;
      VL_ABAT_NT := 0;
      VL_MERC := Total.ICMSTot.vProd;
      IND_FRT := tfSemCobrancaFrete;
      VL_FRT := Total.ICMSTot.vFrete;
      VL_SEG := Total.ICMSTot.vSeg;
      VL_OUT_DA := 0;
      VL_BC_ICMS := Total.ICMSTot.vBC;
      VL_ICMS := Total.ICMSTot.vICMS;
      VL_BC_ICMS_ST := Total.ICMSTot.vBCST;
      VL_ICMS_ST := Total.ICMSTot.vST;
      VL_IPI := Total.ICMSTot.vIPI;
      VL_PIS := Total.ICMSTot.vPIS;
      VL_COFINS := Total.ICMSTot.vCOFINS;
      VL_PIS_ST := VL_PIS_ST;
      VL_COFINS_ST := VL_COFINS_ST;
    end;

    // Percorre os itens da nota
    for i := 0 to Det.Count - 1 do
    begin

      with Det.Items[i] do
      begin
          // Add bloco 0190
        if not FProps.FListaUnidades.Contains(Prod.uCom.ToUpper.Trim) then
        begin
          FProps.FListaUnidades.Add(Prod.uCom.ToUpper.Trim);
          with FProps.FAcbrPisCofins.Bloco_0.Registro0190New do
          begin
            UNID := Prod.uCom;
            DESCR := Prod.uCom;
          end;
        end;

          // Add bloco 0200
        if not FProps.FListaProdutos.Contains(Prod.cProd) then
        begin
          FProps.FListaProdutos.Add(Prod.cProd);
          with FProps.FAcbrPisCofins.Bloco_0.Registro0200New do
          begin
            COD_ITEM := Prod.cProd;
            DESCR_ITEM := Prod.xProd;
            COD_BARRA := Prod.cEAN;
            COD_ANT_ITEM := '';
            UNID_INV := Prod.uCom;
            TIPO_ITEM := tiMercadoriaRevenda;
            COD_NCM := Prod.NCM;
            EX_IPI := '';
            COD_GEN := Copy(Prod.NCM, 0, 2);
            COD_LST := '';
            if Prod.qTrib > 100 then
              ALIQ_ICMS := 0
            else
              ALIQ_ICMS := Prod.qTrib;
          end;
        end;

        with FProps.FAcbrPisCofins.Bloco_C.RegistroC170New do   //Inicio Adicionar os Itens:
        begin
          NUM_ITEM := FormatFloat('000', Prod.nItem);
          COD_ITEM := Prod.cProd;
          DESCR_COMPL := Prod.xProd;
          QTD := Prod.qCom; // O último dígito deve ser ignorado no arquivo
          UNID := Prod.uCom;
          VL_ITEM := Prod.vProd;
          VL_DESC := Prod.vDesc;
          IND_MOV := mfSim;

          if RetornaModalidadeNF(FNotaFiscal, FProps.FAcbrPisCofins.Bloco_0.Registro0000.CNPJ) = ENTRADA then
          begin

            if Copy(Prod.CFOP, 2, 1) = '4' then
            begin
              CST_ICMS := sticmsTributadaComCobracaPorST;
              if Copy(Prod.CFOP, 1, 1) = '5' then
                CFOP := '1403'
              else
                CFOP := '2403';
            end
            else
            begin
              CST_ICMS := sticmsTributadaIntegralmente;
              if Copy(Prod.CFOP, 1, 1) = '5' then
                CFOP := '1' + Copy(Prod.CFOP, 2, 3)
              else if Copy(Prod.CFOP, 0, 1) = '6' then
                CFOP := '2' + Copy(Prod.CFOP, 2, 3)
              else
                CFOP := '1102';
            end;

            CST_IPI := stipiOutrasEntradas;
            CST_PIS := TACBrCstPis(StrToCstPis(b,ConverteCstSaidaParaEntrada(CSTPISToStr(Imposto.PIS.CST))));
            CST_COFINS := TACBrCstCofins(StrToCstCofins(b,ConverteCstSaidaParaEntrada(CSTCOFINSToStr(Imposto.COFINS.CST))));
            COD_CTA := cta_entrada; //Baseado no 0500

          end;

          if RetornaModalidadeNF(FNotaFiscal, FProps.FAcbrPisCofins.Bloco_0.Registro0000.CNPJ) = SAIDA then
          begin

            CST_ICMS := TACBrCstIcms(imposto.ICMS.CST);
            CFOP := Prod.CFOP;
            CST_IPI := TACBrCstIpi(imposto.IPI.CST);

            CST_PIS := TACBrCstPis(imposto.PIS.CST);
            CST_COFINS := TACBrCstCofins(imposto.COFINS.CST);
            COD_CTA := cta_saida; //Baseado no 0500
          end;

          //COD_NAT          := '64'; //Informar no 0400 antes de utilizá-lo
          VL_BC_ICMS := Imposto.ICMS.vBC;
          ALIQ_ICMS := Imposto.ICMS.pICMS;
          VL_ICMS := Imposto.ICMS.vICMS;
          VL_BC_ICMS_ST := Imposto.ICMS.vBCST;
          ALIQ_ST := Imposto.ICMS.pICMSST;
          VL_ICMS_ST := Imposto.ICMS.vICMSST;
          IND_APUR := iaVazio;

          COD_ENQ := '';
          VL_BC_IPI := Imposto.IPI.vBC;
          ALIQ_IPI := Imposto.IPI.pIPI;
          VL_IPI := Imposto.IPI.vIPI;


             //CST PIS esta declarado acima
          VL_BC_PIS := Imposto.PIS.vBC;
          ALIQ_PIS_PERC := Imposto.PIS.pPIS;
          VL_PIS := Imposto.PIS.vPIS;


             //CST COFINS esta declarado acima
          VL_BC_COFINS := Imposto.COFINS.vBC;
          ALIQ_COFINS_PERC := Imposto.COFINS.pCOFINS;
          VL_COFINS := Imposto.COFINS.vCOFINS;



          if RetornaModalidadeNF(FNotaFiscal, FProps.FAcbrPisCofins.Bloco_0.Registro0000.CNPJ) = ENTRADA then
          begin
            if Imposto.PIS.pPIS > 0  then
              FProps.setAcumuladorPIS(Imposto.PIS.vBC,Imposto.PIS.pPIS,Imposto.PIS.vPIS );

            if Imposto.COFINS.pCOFINS > 0  then
              FProps.setAcumuladorCOFINS(Imposto.COFINS.vBC,Imposto.COFINS.pCOFINS,Imposto.COFINS.vCOFINS );
          end;
          if RetornaModalidadeNF(FNotaFiscal, FProps.FAcbrPisCofins.Bloco_0.Registro0000.CNPJ) = SAIDA then
          begin
            if Imposto.PIS.pPIS > 0  then
              FProps.setAcumuladorPIS_SAIDAS(Imposto.PIS.vBC,Imposto.PIS.pPIS,Imposto.PIS.vPIS );

            if Imposto.COFINS.pCOFINS > 0  then
              FProps.setAcumuladorCOFINS_SAIDAS(Imposto.COFINS.vBC,Imposto.COFINS.pCOFINS,Imposto.COFINS.vCOFINS );
          end;


        end; //Fim dos Itens;

      end;
    end;
  end;
end;

end.

