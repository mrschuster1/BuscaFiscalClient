unit BuscaFiscal.Component;

interface

uses
  System.SysUtils,
  System.Classes,
  BuscaFiscal.Model,
  BuscaFiscal.Client;

type
  /// <summary>
  /// Componente visual para integração simplificada com a API do Busca Fiscal.
  /// Compatível com VCL e FMX (Cross-platform).
  /// </summary>
  TBuscaFiscal = class(TComponent)
  private
    FToken: string;
    FBaseURL: string;
    FClient: IBuscaFiscalClient;
    function GetClient: IBuscaFiscalClient;
  protected
    procedure SetToken(const AValue: string);
    procedure SetBaseURL(const AValue: string);
  public
    constructor Create(AOwner: TComponent); override;

    /// <summary> Obtém as informações tributárias completas de um produto pelo GTIN (EAN). </summary>
    /// <param name="AGTIN">Código de barras do produto.</param>
    /// <returns>Objeto IBuscaFiscalResponse com os dados do produto e tributos.</returns>
    function GetTributosByGTIN(const AGTIN: string): IBuscaFiscalResponse;

    /// <summary> Realiza uma busca de produtos baseada em parte da descrição. </summary>
    /// <param name="ADescricao">Nome ou descrição parcial do produto.</param>
    /// <param name="ALimite">Número máximo de registros a retornar (padrão 10).</param>
    /// <returns>Objeto IBuscaFiscalResponse com a lista de produtos encontrados.</returns>
    function SearchTributos(const ADescricao: string;
      const ALimite: Integer = 10): IBuscaFiscalResponse;

    /// <summary> Recupera as informações técnicas e a imagem (em base64 ou link) de um produto. </summary>
    /// <param name="AGTIN">Código de barras do produto.</param>
    /// <returns>Objeto IBuscaFiscalImageResponse com os dados da imagem.</returns>
    function GetImage(const AGTIN: string): IBuscaFiscalImageResponse;

    /// <summary> Executa uma atualização em lote de múltiplos produtos e seus respectivos tributos. </summary>
    /// <param name="ARequest">Requisição contendo a lista de itens para processamento.</param>
    /// <returns>Objeto IBuscaFiscalBatchResponse com o status de cada item processado.</returns>
    function UpdateBatch(const ARequest: IBuscaFiscalBatchRequest)
      : IBuscaFiscalBatchResponse;
  published
    /// <summary> Token de acesso (x-access-token) fornecido pelo portal Busca Fiscal. </summary>
    property Token: string read FToken write SetToken;

    /// <summary> URL base para as chamadas da API. O padrão é https://portalapi.buscafiscal.com.br </summary>
    property BaseURL: string read FBaseURL write SetBaseURL;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Busca Fiscal', [TBuscaFiscal]);
end;

constructor TBuscaFiscal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBaseURL := 'https://portalapi.buscafiscal.com.br';
end;

function TBuscaFiscal.GetClient: IBuscaFiscalClient;
begin
  if (FClient = nil) then
  begin
    FClient := TBuscaFiscalClient.New
      .Token(FToken)
      .BaseURL(FBaseURL);
  end;
  Result := FClient;
end;

function TBuscaFiscal.GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
begin
  Result := GetClient.GetImage(AGTIN);
end;

function TBuscaFiscal.GetTributosByGTIN(const AGTIN: string)
  : IBuscaFiscalResponse;
begin
  Result := GetClient.GetTributosByGTIN(AGTIN);
end;

function TBuscaFiscal.SearchTributos(const ADescricao: string;
  const ALimite: Integer): IBuscaFiscalResponse;
begin
  Result := GetClient.SearchTributos(ADescricao, ALimite);
end;

function TBuscaFiscal.UpdateBatch(const ARequest: IBuscaFiscalBatchRequest)
  : IBuscaFiscalBatchResponse;
begin
  Result := GetClient.UpdateBatch(ARequest);
end;

procedure TBuscaFiscal.SetBaseURL(const AValue: string);
begin
  FBaseURL := AValue;
  FClient := nil;
end;

procedure TBuscaFiscal.SetToken(const AValue: string);
begin
  FToken := AValue;
  FClient := nil;
end;

end.
