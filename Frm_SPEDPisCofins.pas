unit Frm_SPEDPisCofins;

{$IFDEF FPC}
  {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEPCBlocos,
  Dialogs, StdCtrls, ACBrSpedPisCofins, ExtCtrls, ComCtrls, ACBrUtil,
  ACBrTXTClass, ACBrNFe, ACBrBase,

    ACBrEPCBloco_0, ACBrEPCBloco_1
, ACBrEPCBloco_A, ACBrEPCBloco_C, ACBrEPCBloco_D, ACBrEPCBloco_F
, ACBrEPCBloco_M, ACBrNFeNotasFiscais, pcnConversao, unitGerarSPED, JvBaseDlg, JvSelectDirectory,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxBarBuiltInMenu, cxPC, Vcl.Mask, JvExMask, JvToolEdit, JvExControls, JvSpeedButton;

type
  
  { TFrmSPEDPisCofins }

  TFrmSPEDPisCofins = class(TForm)
    memoTXT: TMemo;
    Label3: TLabel;

    OpenDialog1: TOpenDialog;
    JvSelectDirectory1: TJvSelectDirectory;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    btnB_0: TButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit1: TcxDateEdit;
    cxTextEdit2: TcxTextEdit;
    Label11: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    cxTextEdit9: TcxTextEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cxTextEdit10: TcxTextEdit;
    cxTextEdit11: TcxTextEdit;
    cxTextEdit12: TcxTextEdit;
    cxTextEdit13: TcxTextEdit;
    cxTextEdit14: TcxTextEdit;
    cxTextEdit15: TcxTextEdit;
    cxTextEdit16: TcxTextEdit;
    cxTextEdit17: TcxTextEdit;
    cxTextEdit18: TcxTextEdit;
    cxTextEdit19: TcxTextEdit;
    cxTextEdit20: TcxTextEdit;
    msg_aviso: TPanel;
    JvFilenameEdit1: TJvFilenameEdit;
    Label25: TLabel;
    JvSpeedButton1: TJvSpeedButton;
    procedure btnB_0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure abrirTXTinMemo(value:string);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure carregarINIConfig;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSPEDPisCofins: TFrmSPEDPisCofins;
  ACBrSPEDPisCofins1: TACBrSPEDPisCofins;

implementation

uses
  pcnNFe, unitIni, unitBaseSped;

{$IFDEF FPC}
 {$R *.lfm}
{$ELSE}
 {$R *.dfm}
{$ENDIF}

procedure TFrmSPEDPisCofins.abrirTXTinMemo(value: string);
begin
  memoTXT.Lines.Clear;
  memoTXT.Lines.LoadFromFile(value);
end;

procedure TFrmSPEDPisCofins.btnB_0Click(Sender: TObject);
var
dadosEmpresaContador: TDadosPessoas;
acbrNFe: TACBrNFe;
gerardorSPED: TGerarSPED;
F: TSearchRec;
Ret: integer;
diretoryXML : string;
begin
  if (cxDateEdit1.Text = '') or (cxDateEdit2.Text = '')  then
  begin
    ShowMessage('Datas inválidas');
    Abort;
  end;

  if not JvSelectDirectory1.Execute then
    raise Exception.Create('Caminho selecionado inválido!!');


  with dadosEmpresaContador do
  begin
    with empresa do
    begin
    // Grava os dados da empresa
      Razao := cxTextEdit1.Text;
      cnpj := cxTextEdit2.Text;
      Fantasia := cxTextEdit3.Text;
      ie := cxTextEdit4.Text;
      im := cxTextEdit5.Text;
      cod_municipio := cxTextEdit6.Text;
      uf := cxTextEdit7.Text;
      suframa := cxTextEdit8.Text
    end;

    with contador do
    begin
    // Grava os dados do contador
     Nome := cxTextEdit9.Text;
     CPF := cxTextEdit10.Text;
     CNPJ := cxTextEdit11.Text;
     CRC := cxTextEdit12.Text;
     Logradouro := cxTextEdit13.Text;
     Numero :=cxTextEdit14.Text;
     Complemento := cxTextEdit15.Text;
     Bairro := cxTextEdit16.Text;
     CEP :=  cxTextEdit17.Text;
     Fone := cxTextEdit18.Text;
     Email := cxTextEdit19.Text;
     Cod_Municipio := cxTextEdit20.Text;
    end;
  end;

  diretoryXML := JvSelectDirectory1.Directory+'\';
  Ret := FindFirst(diretoryXML+'*.xml',faDirectory or faHidden or faSysFile,F);

  acbrNFe := TACBrNFe.Create(nil);

  try
    while Ret = 0 do
    begin
      acbrNFe.NotasFiscais.LoadFromFile(diretoryXML+F.Name,false);
      Ret := FindNext(F);
    end;      
  finally
    FindClose(F);
  end;

  gerardorSPED:= TGerarSPED.Create(acbrNFe.NotasFiscais);
  gerardorSPED.OnGerarTEventoOnGerar(abrirTXTinMemo);
  gerardorSPED.gerarArquivo(cxDateEdit1.Text,cxDateEdit2.Text,
      dadosEmpresaContador, JvFilenameEdit1.Text );

  FreeAndNil(gerardorSPED);
  FreeAndNil(acbrNFe);

  msg_aviso.Caption := 'Processo Terminado';
end;

procedure TFrmSPEDPisCofins.carregarINIConfig;
var ini: TIniOptions;
begin
  ini := TIniOptions.Create;
  try
     ini.LoadFromFile(ExtractFilePath(Application.ExeName)+'config.ini');

    // Grava os dados da empresa
    cxTextEdit1.Text:= ini.EMPRESARAZAO;
    cxTextEdit2.Text:= ini.EMPRESACNPJ;
    cxTextEdit3.Text:= ini.EMPRESAFANTASIA;
    cxTextEdit4.Text:= ini.EMPRESAIE;
    cxTextEdit5.Text:= ini.EMPRESAIM;
    cxTextEdit6.Text:= ini.EMPRESACOD_MUN;
    cxTextEdit7.Text:= ini.EMPRESAUF;
    cxTextEdit8.Text:= ini.EMPRESASUFRAMA;

    // Grava os dados do contador
    cxTextEdit9.Text := ini.CONTADORNOME;
    cxTextEdit10.Text := ini.CONTADORCPF;
    cxTextEdit11.Text := ini.CONTADORCNPJ;
    cxTextEdit12.Text := ini.CONTADORCRC;
    cxTextEdit13.Text := ini.CONTADORENDERECO;
    cxTextEdit14.Text := ini.CONTADORNUMERO;
    cxTextEdit15.Text := ini.CONTADORCOMPLE;
    cxTextEdit16.Text := ini.CONTADORBAIRRO;
    cxTextEdit17.Text := ini.CONTADORCEP;
    cxTextEdit18.Text := ini.CONTADORFONE;
    cxTextEdit19.Text := ini.CONTADOREMAIL;
    cxTextEdit20.Text := ini.CONTADORCOD_MUN;

  finally
    FreeAndNil(ini);
  end;
end;

procedure TFrmSPEDPisCofins.FormCreate(Sender: TObject);
begin
  ACBrSPEDPisCofins1 := TACBrSPEDPisCofins.Create(self);
  carregarINIConfig;
end;

procedure TFrmSPEDPisCofins.JvSpeedButton1Click(Sender: TObject);
var ini: TIniOptions;
begin
  ini := TIniOptions.Create;
  try
    // Grava os dados da empresa
    ini.EMPRESARAZAO := cxTextEdit1.Text;
    ini.EMPRESACNPJ := cxTextEdit2.Text;
    ini.EMPRESAFANTASIA := cxTextEdit3.Text;
    ini.EMPRESAIE := cxTextEdit4.Text;
    ini.EMPRESAIM := cxTextEdit5.Text;
    ini.EMPRESACOD_MUN := cxTextEdit6.Text;
    ini.EMPRESAUF := cxTextEdit7.Text;
    ini.EMPRESASUFRAMA := cxTextEdit8.Text;

    // Grava os dados do contador
    ini.CONTADORNOME := cxTextEdit9.Text;
    ini.CONTADORCPF := cxTextEdit10.Text;
    ini.CONTADORCNPJ := cxTextEdit11.Text;
    ini.CONTADORCRC := cxTextEdit12.Text;
    ini.CONTADORENDERECO := cxTextEdit13.Text;
    ini.CONTADORNUMERO :=cxTextEdit14.Text;
    ini.CONTADORCOMPLE := cxTextEdit15.Text;
    ini.CONTADORBAIRRO := cxTextEdit16.Text;
    ini.CONTADORCEP :=  cxTextEdit17.Text;
    ini.CONTADORFONE := cxTextEdit18.Text;
    ini.CONTADOREMAIL := cxTextEdit19.Text;
    ini.CONTADORCOD_MUN := cxTextEdit20.Text;

    ini.SaveToFile(ExtractFilePath(Application.ExeName)+'config.ini');
    ShowMessage('Configuração salva com sucesso.');
  finally
    FreeAndNil(ini);
  end;
end;

end.
