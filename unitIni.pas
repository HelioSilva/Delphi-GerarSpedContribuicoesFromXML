unit unitIni;

interface

uses
  Classes, SysUtils, IniFiles, Forms, Windows;

const
  csIniEMPRESASection = 'EMPRESA';
  csIniCONTADORSection = 'CONTADOR';

  {Section: EMPRESA}
  csIniEMPRESARAZAO = 'RAZAO';
  csIniEMPRESACNPJ = 'CNPJ';
  csIniEMPRESAFANTASIA = 'FANTASIA';
  csIniEMPRESAIE = 'IE';
  csIniEMPRESAIM = 'IM';
  csIniEMPRESACOD_MUN = 'COD_MUN';
  csIniEMPRESAUF = 'UF';
  csIniEMPRESASUFRAMA = 'SUFRAMA';

  {Section: CONTADOR}
  csIniCONTADORNOME = 'NOME';
  csIniCONTADORCNPJ = 'CNPJ';
  csIniCONTADORCPF = 'CPF';
  csIniCONTADORCRC = 'CRC';
  csIniCONTADORENDERECO = 'ENDERECO';
  csIniCONTADORNUMERO = 'NUMERO';
  csIniCONTADORCOMPLE = 'COMPLE';
  csIniCONTADORBAIRRO = 'BAIRRO';
  csIniCONTADORCEP = 'CEP';
  csIniCONTADORFONE = 'FONE';
  csIniCONTADOREMAIL = 'EMAIL';
  csIniCONTADORCOD_MUN = 'COD_MUN';

type
  TIniOptions = class(TObject)
  private
    {Section: EMPRESA}
    FEMPRESARAZAO: string;
    FEMPRESACNPJ: string;
    FEMPRESAFANTASIA: string;
    FEMPRESAIE: string;
    FEMPRESAIM: string;
    FEMPRESACOD_MUN: string;
    FEMPRESAUF: string;
    FEMPRESASUFRAMA: string;

    {Section: CONTADOR}
    FCONTADORNOME: string;
    FCONTADORCNPJ: string;
    FCONTADORCRC: string;
    FCONTADORENDERECO: string;
    FCONTADORNUMERO: string;
    FCONTADORCOMPLE: string;
    FCONTADORBAIRRO: string;
    FCONTADORCEP: string;
    FCONTADORFONE: string;
    FCONTADOREMAIL: string;
    FCONTADORCOD_MUN: string;
    FCONTADORCPF: string;
    procedure SetCONTADORCPF(const Value: string);
  public
    procedure LoadSettings(Ini: TMemIniFile);
    procedure SaveSettings(Ini: TMemIniFile);
    
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);

    {Section: EMPRESA}
    property EMPRESARAZAO: string read FEMPRESARAZAO write FEMPRESARAZAO;
    property EMPRESACNPJ: string read FEMPRESACNPJ write FEMPRESACNPJ;
    property EMPRESAFANTASIA: string read FEMPRESAFANTASIA write FEMPRESAFANTASIA;
    property EMPRESAIE: string read FEMPRESAIE write FEMPRESAIE;
    property EMPRESAIM: string read FEMPRESAIM write FEMPRESAIM;
    property EMPRESACOD_MUN: string read FEMPRESACOD_MUN write FEMPRESACOD_MUN;
    property EMPRESAUF: string read FEMPRESAUF write FEMPRESAUF;
    property EMPRESASUFRAMA: string read FEMPRESASUFRAMA write FEMPRESASUFRAMA;

    {Section: CONTADOR}
    property CONTADORNOME: string read FCONTADORNOME write FCONTADORNOME;
    property CONTADORCPF: string read FCONTADORCPF write SetCONTADORCPF;
    property CONTADORCNPJ: string read FCONTADORCNPJ write FCONTADORCNPJ;
    property CONTADORCRC: string read FCONTADORCRC write FCONTADORCRC;
    property CONTADORENDERECO: string read FCONTADORENDERECO write FCONTADORENDERECO;
    property CONTADORNUMERO: string read FCONTADORNUMERO write FCONTADORNUMERO;
    property CONTADORCOMPLE: string read FCONTADORCOMPLE write FCONTADORCOMPLE;
    property CONTADORBAIRRO: string read FCONTADORBAIRRO write FCONTADORBAIRRO;
    property CONTADORCEP: string read FCONTADORCEP write FCONTADORCEP;
    property CONTADORFONE: string read FCONTADORFONE write FCONTADORFONE;
    property CONTADOREMAIL: string read FCONTADOREMAIL write FCONTADOREMAIL;
    property CONTADORCOD_MUN: string read FCONTADORCOD_MUN write FCONTADORCOD_MUN;
  end;

var
  IniOptions: TIniOptions = nil;

implementation

procedure TIniOptions.LoadSettings(Ini: TMemIniFile);
begin
  if Ini <> nil then
  begin
    {Section: EMPRESA}
    FEMPRESARAZAO := Ini.ReadString(csIniEMPRESASection, csIniEMPRESARAZAO, '');
    FEMPRESACNPJ := Ini.ReadString(csIniEMPRESASection, csIniEMPRESACNPJ, '');
    FEMPRESAFANTASIA := Ini.ReadString(csIniEMPRESASection, csIniEMPRESAFANTASIA, '');
    FEMPRESAIE := Ini.ReadString(csIniEMPRESASection, csIniEMPRESAIE, '');
    FEMPRESAIM := Ini.ReadString(csIniEMPRESASection, csIniEMPRESAIM, '');
    FEMPRESACOD_MUN := Ini.ReadString(csIniEMPRESASection, csIniEMPRESACOD_MUN, '');
    FEMPRESAUF := Ini.ReadString(csIniEMPRESASection, csIniEMPRESAUF, '');
    FEMPRESASUFRAMA := Ini.ReadString(csIniEMPRESASection, csIniEMPRESASUFRAMA, '');

    {Section: CONTADOR}
    FCONTADORNOME := Ini.ReadString(csIniCONTADORSection, csIniCONTADORNOME, '');
    FCONTADORCNPJ := Ini.ReadString(csIniCONTADORSection, csIniCONTADORCNPJ, '');
    FCONTADORCPF := Ini.ReadString(csIniCONTADORSection, csIniCONTADORCPF, '');
    FCONTADORCRC := Ini.ReadString(csIniCONTADORSection, csIniCONTADORCRC, '');
    FCONTADORENDERECO := Ini.ReadString(csIniCONTADORSection, csIniCONTADORENDERECO, '');
    FCONTADORNUMERO := Ini.ReadString(csIniCONTADORSection, csIniCONTADORNUMERO, '');
    FCONTADORCOMPLE := Ini.ReadString(csIniCONTADORSection, csIniCONTADORCOMPLE, '');
    FCONTADORBAIRRO := Ini.ReadString(csIniCONTADORSection, csIniCONTADORBAIRRO, '');
    FCONTADORCEP := Ini.ReadString(csIniCONTADORSection, csIniCONTADORCEP, '');
    FCONTADORFONE := Ini.ReadString(csIniCONTADORSection, csIniCONTADORFONE, '');
    FCONTADOREMAIL := Ini.ReadString(csIniCONTADORSection, csIniCONTADOREMAIL, '');
    FCONTADORCOD_MUN := Ini.ReadString(csIniCONTADORSection, csIniCONTADORCOD_MUN, '');
  end;
end;

procedure TIniOptions.SaveSettings(Ini: TMemIniFile);
begin
  if Ini <> nil then
  begin
    {Section: EMPRESA}
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESARAZAO, FEMPRESARAZAO);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESACNPJ, FEMPRESACNPJ);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESAFANTASIA, FEMPRESAFANTASIA);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESAIE, FEMPRESAIE);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESAIM, FEMPRESAIM);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESACOD_MUN, FEMPRESACOD_MUN);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESAUF, FEMPRESAUF);
    Ini.WriteString(csIniEMPRESASection, csIniEMPRESASUFRAMA, FEMPRESASUFRAMA);

    {Section: CONTADOR}
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORNOME, FCONTADORNOME);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORCNPJ, FCONTADORCNPJ);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORCPF, FCONTADORCPF);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORCRC, FCONTADORCRC);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORENDERECO, FCONTADORENDERECO);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORNUMERO, FCONTADORNUMERO);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORCOMPLE, FCONTADORCOMPLE);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORBAIRRO, FCONTADORBAIRRO);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORCEP, FCONTADORCEP);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORFONE, FCONTADORFONE);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADOREMAIL, FCONTADOREMAIL);
    Ini.WriteString(csIniCONTADORSection, csIniCONTADORCOD_MUN, FCONTADORCOD_MUN);
  end;
end;

procedure TIniOptions.LoadFromFile(const FileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(FileName);
  try
    LoadSettings(Ini);
  finally
    Ini.Free;
  end;
end;

procedure TIniOptions.SaveToFile(const FileName: string);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(FileName);
  try
    SaveSettings(Ini);
    Ini.UpdateFile;
  finally
    Ini.Free;
  end;
end;

procedure TIniOptions.SetCONTADORCPF(const Value: string);
begin
  FCONTADORCPF := Value;
end;

initialization
  IniOptions := TIniOptions.Create;

finalization
  IniOptions.Free;

end.

