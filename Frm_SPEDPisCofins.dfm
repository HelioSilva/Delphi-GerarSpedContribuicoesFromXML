object FrmSPEDPisCofins: TFrmSPEDPisCofins
  Left = 356
  Top = 153
  Caption = '-- Gera'#231#227'o de Sped Pis Cofins'
  ClientHeight = 476
  ClientWidth = 749
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    749
    476)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 290
    Width = 75
    Height = 13
    Caption = 'Arquivo Gerado'
    Color = clBtnFace
    ParentColor = False
  end
  object memoTXT: TMemo
    Left = 8
    Top = 306
    Width = 731
    Height = 130
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 16514043
    ParentBackground = False
    TabOrder = 1
    object JvSpeedButton1: TJvSpeedButton
      AlignWithMargins = True
      Left = 562
      Top = 3
      Width = 184
      Height = 35
      Align = alRight
      Caption = 'Salvar dados Empresa/Contador ...'
      OnClick = JvSpeedButton1Click
    end
    object btnB_0: TButton
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 146
      Height = 35
      Margins.Left = 10
      Align = alLeft
      Caption = 'Gerar SPED PIS COFINS'
      TabOrder = 0
      OnClick = btnB_0Click
    end
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 10
    Top = 51
    Width = 729
    Height = 230
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Align = alTop
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = True
    ClientRectBottom = 226
    ClientRectLeft = 4
    ClientRectRight = 725
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Empresa'
      ImageIndex = 0
      object Label11: TLabel
        Left = 16
        Top = 110
        Width = 43
        Height = 11
        Caption = 'SUFRAMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 68
        Width = 43
        Height = 11
        Caption = 'FANTASIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 297
        Top = 14
        Width = 23
        Height = 11
        Caption = 'CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 297
        Top = 68
        Width = 8
        Height = 11
        Caption = 'IE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 388
        Top = 68
        Width = 11
        Height = 11
        Caption = 'IM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 458
        Top = 14
        Width = 57
        Height = 11
        Caption = 'DATA INICIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 585
        Top = 14
        Width = 50
        Height = 11
        Caption = 'DATA FINAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 479
        Top = 68
        Width = 82
        Height = 11
        Caption = 'CODIGO MUNICIPIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 585
        Top = 68
        Width = 11
        Height = 11
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 14
        Width = 63
        Height = 11
        Caption = 'RAZ'#195'O SOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 16
        Top = 158
        Width = 50
        Height = 11
        Caption = 'Salvar em...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxTextEdit1: TcxTextEdit
        Left = 16
        Top = 26
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 275
      end
      object cxTextEdit8: TcxTextEdit
        Left = 16
        Top = 121
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 113
      end
      object cxTextEdit3: TcxTextEdit
        Left = 16
        Top = 79
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 275
      end
      object cxTextEdit4: TcxTextEdit
        Left = 297
        Top = 79
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 85
      end
      object cxTextEdit5: TcxTextEdit
        Left = 388
        Top = 79
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 85
      end
      object cxTextEdit6: TcxTextEdit
        Left = 479
        Top = 79
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 100
      end
      object cxTextEdit7: TcxTextEdit
        Left = 585
        Top = 79
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 39
      end
      object cxDateEdit2: TcxDateEdit
        Left = 585
        Top = 26
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 121
      end
      object cxDateEdit1: TcxDateEdit
        Left = 458
        Top = 26
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 121
      end
      object cxTextEdit2: TcxTextEdit
        Left = 297
        Top = 26
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 152
      end
      object JvFilenameEdit1: TJvFilenameEdit
        Left = 16
        Top = 170
        Width = 366
        Height = 21
        DialogKind = dkSave
        DefaultExt = '.txt'
        Filter = 'Texto (*.txt)|*.txt'
        InitialDir = 'C:\'
        DialogTitle = 'Salvar arquivo SPED'
        TabOrder = 10
        Text = 'C:\spedPisCofins.txt'
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Contador'
      ImageIndex = 1
      object Label7: TLabel
        Left = 12
        Top = 14
        Width = 25
        Height = 11
        Caption = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 298
        Top = 14
        Width = 17
        Height = 11
        Caption = 'CPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 420
        Top = 14
        Width = 23
        Height = 11
        Caption = 'CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 546
        Top = 14
        Width = 18
        Height = 11
        Caption = 'CRC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 12
        Top = 56
        Width = 45
        Height = 11
        Caption = 'ENDERECO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 298
        Top = 56
        Width = 37
        Height = 11
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 376
        Top = 56
        Width = 46
        Height = 11
        Caption = 'COMPLEM.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 546
        Top = 56
        Width = 33
        Height = 11
        Caption = 'BAIRRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 12
        Top = 100
        Width = 17
        Height = 11
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 595
        Top = 100
        Width = 67
        Height = 11
        Caption = 'COD MUNICIPIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 178
        Top = 100
        Width = 22
        Height = 11
        Caption = 'FONE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 298
        Top = 110
        Width = 17
        Height = 11
        Caption = 'FAX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 346
        Top = 100
        Width = 27
        Height = 11
        Caption = 'EMAIL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object cxTextEdit9: TcxTextEdit
        Left = 12
        Top = 26
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 275
      end
      object cxTextEdit10: TcxTextEdit
        Left = 298
        Top = 26
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 116
      end
      object cxTextEdit11: TcxTextEdit
        Left = 420
        Top = 26
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 116
      end
      object cxTextEdit12: TcxTextEdit
        Left = 546
        Top = 26
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 116
      end
      object cxTextEdit13: TcxTextEdit
        Left = 12
        Top = 68
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 275
      end
      object cxTextEdit14: TcxTextEdit
        Left = 298
        Top = 68
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 72
      end
      object cxTextEdit15: TcxTextEdit
        Left = 376
        Top = 68
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 160
      end
      object cxTextEdit16: TcxTextEdit
        Left = 546
        Top = 68
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 157
      end
      object cxTextEdit17: TcxTextEdit
        Left = 12
        Top = 112
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 157
      end
      object cxTextEdit18: TcxTextEdit
        Left = 178
        Top = 112
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 157
      end
      object cxTextEdit19: TcxTextEdit
        Left = 346
        Top = 112
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        Width = 245
      end
      object cxTextEdit20: TcxTextEdit
        Left = 595
        Top = 112
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        Width = 108
      end
    end
  end
  object msg_aviso: TPanel
    Left = 0
    Top = 456
    Width = 749
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3947769
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Left = 530
    Top = 262
  end
  object JvSelectDirectory1: TJvSelectDirectory
    InitialDir = 'C:\'
    ClassicDialog = False
    Title = 
      'Selecione a pasta onde est'#227'o os XML'#39's para gerar o SPED Contribu' +
      'i'#231#245'es'
    Left = 398
    Top = 262
  end
  object SaveDialog1: TSaveDialog
    Left = 464
    Top = 262
  end
end