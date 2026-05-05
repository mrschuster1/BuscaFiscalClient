unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  BuscaFiscal.Model, BuscaFiscal.Client, BuscaFiscal.Component, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Data.DB, Datasnap.DBClient, Vcl.DBGrids,
  Vcl.Grids;

type
  TFormMain = class(TForm)
    pnlSidebar: TPanel;
    pnlSidebarTitle: TPanel;
    lblSidebarTitle: TLabel;
    pnlConfig: TPanel;
    lblToken: TLabel;
    edtToken: TEdit;
    lblBaseURL: TLabel;
    edtBaseURL: TEdit;
    pnlMenu: TPanel;
    pnlMenuGTIN: TPanel;
    pnlIndGTIN: TPanel;
    pnlMenuSearch: TPanel;
    pnlIndSearch: TPanel;
    pnlMenuImage: TPanel;
    pnlIndImage: TPanel;
    pnlMenuBatch: TPanel;
    pnlIndBatch: TPanel;
    pnlLog: TPanel;
    lblLog: TLabel;
    mmoLog: TMemo;
    pnlMain: TPanel;
    pnlHeader: TPanel;
    lblTitle: TLabel;
    pnlHeaderLine: TPanel;
    pgcTests: TPageControl;
    tsGTIN: TTabSheet;
    pnlGTIN: TPanel;
    lblGTIN: TLabel;
    pnlInputGTIN: TPanel;
    edtGTIN: TEdit;
    pnlBtnGetTributos: TPanel;
    lblGTINHint: TLabel;
    tsSearch: TTabSheet;
    pnlSearch: TPanel;
    lblSearch: TLabel;
    pnlInputSearch: TPanel;
    edtSearch: TEdit;
    lblLimit: TLabel;
    pnlInputLimit: TPanel;
    edtLimit: TEdit;
    pnlBtnExecuteSearch: TPanel;
    tsImage: TTabSheet;
    pnlImage: TPanel;
    lblImageGTIN: TLabel;
    pnlInputImageGTIN: TPanel;
    edtImageGTIN: TEdit;
    pnlBtnGetImage: TPanel;
    lblImageHint: TLabel;
    tsBatch: TTabSheet;
    pnlBatch: TPanel;
    pnlBtnTestBatch: TPanel;
    dbgBatch: TDBGrid;
    pnlResult: TPanel;
    pnlResultData: TPanel;
    lblResultTitle: TLabel;
    mmoResult: TMemo;
    pnlResultImage: TPanel;
    imgProduto: TImage;
    BuscaFiscal: TBuscaFiscal;
    cdsBatch: TClientDataSet;
    dsBatch: TDataSource;
    procedure btnGetTributosClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnGetImageClick(Sender: TObject);
    procedure btnTestBatchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NavButtonClick(Sender: TObject);
    procedure NavButtonMouseEnter(Sender: TObject);
    procedure NavButtonMouseLeave(Sender: TObject);
    procedure ActionButtonMouseEnter(Sender: TObject);
    procedure ActionButtonMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure LoadConfig;
    procedure SaveConfig;
    procedure Log(const AMessage: string);
    procedure SyncConfig;
    procedure ShowResponse(AObject: TObject);
    procedure LoadBase64Image(const ABase64: string; AImage: TImage);
    procedure UpdateNavButtons;
  public
  end;

var
  FormMain: TFormMain;

implementation

uses
  System.NetEncoding, System.JSON, REST.Json, MidasLib, System.IniFiles;

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  LoadConfig;
  SyncConfig;
  
  pgcTests.ActivePageIndex := 0;
  UpdateNavButtons;

  // Configura colunas do CDS
  cdsBatch.FieldDefs.Clear;
  cdsBatch.FieldDefs.Add('GTIN', ftString, 20);
  cdsBatch.FieldDefs.Add('Descricao', ftString, 100);
  cdsBatch.FieldDefs.Add('UF', ftString, 2);
  cdsBatch.FieldDefs.Add('AliqIcms', ftFloat);
  cdsBatch.CreateDataSet;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  SaveConfig;
end;

procedure TFormMain.LoadConfig;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  try
    edtToken.Text := LIni.ReadString('Config', 'Token', '');
    edtBaseURL.Text := LIni.ReadString('Config', 'BaseURL', BuscaFiscal.BaseURL);
  finally
    LIni.Free;
  end;
end;

procedure TFormMain.SaveConfig;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  try
    LIni.WriteString('Config', 'Token', edtToken.Text);
    LIni.WriteString('Config', 'BaseURL', edtBaseURL.Text);
  finally
    LIni.Free;
  end;
end;

procedure TFormMain.Log(const AMessage: string);
begin
  mmoLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + AMessage);
end;

procedure TFormMain.SyncConfig;
begin
  BuscaFiscal.Token := edtToken.Text;
  BuscaFiscal.BaseURL := edtBaseURL.Text;
end;

procedure TFormMain.btnGetTributosClick(Sender: TObject);
var
  LResponse: IBuscaFiscalResponse;
begin
  SyncConfig;
  Log('Buscando tributos para GTIN: ' + edtGTIN.Text);
  
  LResponse := BuscaFiscal.GetTributosByGTIN(edtGTIN.Text);
  
  if LResponse.GetSuccess then
  begin
    ShowResponse(LResponse.AsObject);
    Log('Sucesso! Produtos encontrados: ' + IntToStr(LResponse.GetResultados));
    
    // Mostra imagem do primeiro produto se houver
    if (LResponse.GetResultados > 0) and (LResponse.GetProdutos[0].GetImagem <> '') then
      LoadBase64Image(LResponse.GetProdutos[0].GetImagem, imgProduto);
  end
  else
  begin
    mmoResult.Lines.Text := 'ERRO: ' + LResponse.GetMessage;
    Log('Falha: ' + LResponse.GetMessage);
  end;
end;

procedure TFormMain.btnSearchClick(Sender: TObject);
var
  LResponse: IBuscaFiscalResponse;
begin
  SyncConfig;
  Log('Pesquisando por: ' + edtSearch.Text);
  
  LResponse := BuscaFiscal.SearchTributos(edtSearch.Text, StrToIntDef(edtLimit.Text, 10));
  
  if LResponse.GetSuccess then
  begin
    ShowResponse(LResponse.AsObject);
    Log('Sucesso! Resultados: ' + IntToStr(LResponse.GetResultados));

    // Mostra imagem do primeiro resultado se houver
    if (LResponse.GetResultados > 0) and (LResponse.GetProdutos[0].GetImagem <> '') then
      LoadBase64Image(LResponse.GetProdutos[0].GetImagem, imgProduto);
  end
  else
  begin
    mmoResult.Lines.Text := 'ERRO: ' + LResponse.GetMessage;
    Log('Falha: ' + LResponse.GetMessage);
  end;
end;

procedure TFormMain.btnGetImageClick(Sender: TObject);
var
  LResponse: IBuscaFiscalImageResponse;
  LStream: TStringStream;
  LBytes: TBytes;
begin
  SyncConfig;
  Log('Buscando imagem para GTIN: ' + edtImageGTIN.Text);
  
  LResponse := BuscaFiscal.GetImage(edtImageGTIN.Text);
  
  if LResponse.GetSuccess then
  begin
    ShowResponse(LResponse.AsObject);
    
    if LResponse.GetImagem <> '' then
    begin
      LoadBase64Image(LResponse.GetImagem, imgProduto);
      Log('Imagem renderizada com sucesso! Formato: ' + LResponse.GetFormato);
    end;
  end
  else
  begin
    mmoResult.Lines.Text := 'ERRO: ' + LResponse.GetMessage;
    Log('Falha: ' + LResponse.GetMessage);
  end;
end;

procedure TFormMain.LoadBase64Image(const ABase64: string; AImage: TImage);
var
  LStream: TMemoryStream;
  LBytes: TBytes;
  LWIC: TWICImage;
  LBase64Data: string;
begin
  if (ABase64 = '') or (AImage = nil) then Exit;

  try
    LBase64Data := ABase64;
    // Remove prefix if exists (data:image/png;base64,)
    if Pos('base64,', LBase64Data) > 0 then
      LBase64Data := Copy(LBase64Data, Pos('base64,', LBase64Data) + 7, MaxInt);

    LStream := TMemoryStream.Create;
    try
      LBytes := TNetEncoding.Base64.DecodeStringToBytes(LBase64Data);
      if Length(LBytes) > 0 then
      begin
        LStream.WriteBuffer(LBytes[0], Length(LBytes));
        LStream.Position := 0;
        
        // Try WIC for modern formats
        LWIC := TWICImage.Create;
        try
          try
            LWIC.LoadFromStream(LStream);
            AImage.Picture.Assign(LWIC);
          except
            // Fallback to standard LoadFromStream if WIC fails
            LStream.Position := 0;
            AImage.Picture.LoadFromStream(LStream);
          end;
        finally
          LWIC.Free;
        end;
      end;
    finally
      LStream.Free;
    end;
  except
    on E: Exception do Log('Erro ao processar imagem: ' + E.Message);
  end;
end;

procedure TFormMain.btnTestBatchClick(Sender: TObject);
var
  LRequest: IBuscaFiscalBatchRequest;
  LResponse: IBuscaFiscalBatchResponse;
begin
  SyncConfig;
  Log('Iniciando teste de Batch Update...');
  
  LRequest := TBuscaFiscalBatchRequest.New
    .AddItem(TBuscaFiscalBatchItem.New
      .Produto(TBuscaFiscalProduto.New
        .GTIN('7894900010015')
        .Descricao('Produto Teste 1'))
      .Tributos(TBuscaFiscalTributo.New
        .UF('SP')
        .AliqIcms(18.0)))
    .AddItem(TBuscaFiscalBatchItem.New
      .Produto(TBuscaFiscalProduto.New
        .GTIN('7894900010022')
        .Descricao('Produto Teste 2'))
      .Tributos(TBuscaFiscalTributo.New
        .UF('RJ')
        .AliqIcms(12.0)));

  LResponse := BuscaFiscal.UpdateBatch(LRequest);
  
  if LResponse.GetSuccess then
  begin
    ShowResponse(LResponse.AsObject);
    Log('Batch processado com sucesso! Alimentando grid...');

    cdsBatch.EmptyDataSet;
    // Aqui assumimos que o request que enviamos é o que queremos ver no grid
    // pois o response do batch da Busca Fiscal geralmente confirma o processamento.
    // Em um cenário real, percorreríamos os resultados do response.
    cdsBatch.Append;
    cdsBatch.FieldByName('GTIN').AsString := '7894900010015';
    cdsBatch.FieldByName('Descricao').AsString := 'Produto Teste 1';
    cdsBatch.FieldByName('UF').AsString := 'SP';
    cdsBatch.FieldByName('AliqIcms').AsFloat := 18.0;
    cdsBatch.Post;

    cdsBatch.Append;
    cdsBatch.FieldByName('GTIN').AsString := '7894900010022';
    cdsBatch.FieldByName('Descricao').AsString := 'Produto Teste 2';
    cdsBatch.FieldByName('UF').AsString := 'RJ';
    cdsBatch.FieldByName('AliqIcms').AsFloat := 12.0;
    cdsBatch.Post;
  end
  else
  begin
    mmoResult.Lines.Text := 'ERRO: ' + LResponse.GetMessage;
    Log('Falha no Batch: ' + LResponse.GetMessage);
  end;
end;

procedure TFormMain.ShowResponse(AObject: TObject);
var
  LJson: TJSONValue;
begin
  if AObject = nil then Exit;
  
  // Parsing and formatting to ensure correct display of accented characters in the UI
  LJson := TJSONObject.ParseJSONValue(TJson.ObjectToJsonString(AObject));
  try
    if LJson <> nil then
      mmoResult.Lines.Text := TJSONAncestor(LJson).Format(2)
    else
      mmoResult.Lines.Text := TJson.ObjectToJsonString(AObject);
  finally
    LJson.Free;
  end;
end;

procedure TFormMain.NavButtonClick(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    pgcTests.ActivePageIndex := TPanel(Sender).Tag;
    UpdateNavButtons;
  end;
end;

procedure TFormMain.NavButtonMouseEnter(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    if TPanel(Sender).Tag <> pgcTests.ActivePageIndex then
      TPanel(Sender).Color := 2895661; // #2C333D (Hover)
  end;
end;

procedure TFormMain.NavButtonMouseLeave(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    if TPanel(Sender).Tag <> pgcTests.ActivePageIndex then
      TPanel(Sender).Color := 2104085; // #151B21 (Normal)
  end;
end;

procedure TFormMain.UpdateNavButtons;
var
  i, j: Integer;
  LPanel: TPanel;
begin
  for i := 0 to pnlMenu.ControlCount - 1 do
  begin
    if pnlMenu.Controls[i] is TPanel then
    begin
      LPanel := TPanel(pnlMenu.Controls[i]);
      if LPanel.Tag = pgcTests.ActivePageIndex then
      begin
        LPanel.Color := 2895661; // #2C333D (Active background)
        LPanel.Font.Style := [fsBold];
        
        // Ativa o indicador
        for j := 0 to LPanel.ControlCount - 1 do
          if LPanel.Controls[j].ClassName = 'TPanel' then
            LPanel.Controls[j].Visible := True;
      end
      else
      begin
        LPanel.Color := 2104085; // #151B21 (Normal)
        LPanel.Font.Style := [];
        
        // Desativa o indicador
        for j := 0 to LPanel.ControlCount - 1 do
          if LPanel.Controls[j].ClassName = 'TPanel' then
            LPanel.Controls[j].Visible := False;
      end;
    end;
  end;
end;

procedure TFormMain.ActionButtonMouseEnter(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := 15856110; // #F2F5FE (Hover light indigo)
end;

procedure TFormMain.ActionButtonMouseLeave(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := 15102558; // #5E5CE6 (Normal Indigo)
end;

end.
