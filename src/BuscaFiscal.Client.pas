unit BuscaFiscal.Client;

interface

uses
  System.SysUtils,
  System.Classes,
  BuscaFiscal.Model,
  RESTRequest4D,
  REST.Json;

type
  /// <summary>
  /// Interface para o cliente de conexão com a API do Busca Fiscal.
  /// Provê métodos para autenticação, configuração e chamadas aos endpoints.
  /// </summary>
  IBuscaFiscalClient = interface
    ['{884A4973-2D9F-4E8A-B51A-976E6E345678}']
    /// <summary> Define o token de acesso (API Key) para as requisições. </summary>
    /// <param name="AValue">Token fornecido pelo Busca Fiscal.</param>
    /// <returns>A própria instância do cliente (Fluent Interface).</returns>
    function Token(const AValue: string): IBuscaFiscalClient;
    
    /// <summary> Permite alterar a URL base da API (útil para ambientes de homologação ou mudanças de domínio). </summary>
    /// <param name="AValue">URL completa (ex: https://portalapi.buscafiscal.com.br).</param>
    /// <returns>A própria instância do cliente (Fluent Interface).</returns>
    function BaseURL(const AValue: string): IBuscaFiscalClient;
    
    /// <summary> Obtém as informações tributárias de um produto através do seu código GTIN/EAN. </summary>
    /// <param name="AGTIN">Código de barras do produto (ex: '7891234567890').</param>
    /// <returns>Resposta contendo os dados tributários e cadastrais do produto.</returns>
    function GetTributosByGTIN(const AGTIN: string): IBuscaFiscalResponse;
    
    /// <summary> Realiza uma pesquisa de tributos baseada na descrição textual do produto. </summary>
    /// <param name="ADescricao">Palavra-chave ou nome parcial do produto.</param>
    /// <param name="ALimite">Quantidade máxima de resultados (padrão 10).</param>
    /// <returns>Resposta contendo uma lista de produtos que satisfazem a busca.</returns>
    function SearchTributos(const ADescricao: string; const ALimite: Integer = 10): IBuscaFiscalResponse;
    
    /// <summary> Recupera a imagem e metadados de mídia de um produto pelo GTIN. </summary>
    /// <param name="AGTIN">Código de barras do produto.</param>
    /// <returns>Resposta contendo o link ou binário da imagem.</returns>
    function GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
    
    /// <summary> Envia um lote de produtos e tributos para atualização ou sincronização na base do Busca Fiscal. </summary>
    /// <param name="ARequest">Objeto contendo a lista de itens a serem atualizados.</param>
    /// <returns>Relatório de processamento do lote, indicando sucessos e falhas individuais.</returns>
    function UpdateBatch(const ARequest: IBuscaFiscalBatchRequest): IBuscaFiscalBatchResponse;
  end;

  /// <summary>
  /// Implementação concreta do cliente Busca Fiscal utilizando o framework RESTRequest4Delphi.
  /// </summary>
  TBuscaFiscalClient = class(TInterfacedObject, IBuscaFiscalClient)
  private
    FToken: string;
    FBaseURL: string;
    const C_DEFAULT_BASE_URL = 'https://portalapi.buscafiscal.com.br';
  public
    constructor Create;
    /// <summary> Método de fábrica para criar uma nova instância do cliente. </summary>
    class function New: IBuscaFiscalClient;

    function Token(const AValue: string): IBuscaFiscalClient;
    function BaseURL(const AValue: string): IBuscaFiscalClient;

    function GetTributosByGTIN(const AGTIN: string): IBuscaFiscalResponse;
    function SearchTributos(const ADescricao: string; const ALimite: Integer = 10): IBuscaFiscalResponse;
    function GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
    function UpdateBatch(const ARequest: IBuscaFiscalBatchRequest): IBuscaFiscalBatchResponse;
  end;

implementation

constructor TBuscaFiscalClient.Create;
begin
  inherited Create;
  FBaseURL := C_DEFAULT_BASE_URL;
end;

class function TBuscaFiscalClient.New: IBuscaFiscalClient;
begin
  Result := TBuscaFiscalClient.Create;
end;

function TBuscaFiscalClient.Token(const AValue: string): IBuscaFiscalClient;
begin
  Result := Self;
  FToken := AValue;
end;

function TBuscaFiscalClient.BaseURL(const AValue: string): IBuscaFiscalClient;
begin
  Result := Self;
  FBaseURL := AValue;
end;

function TBuscaFiscalClient.GetTributosByGTIN(const AGTIN: string): IBuscaFiscalResponse;
var
  LResponse: IResponse;
  LResult: TBuscaFiscalResponse;
begin
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/tributos/gtin/' + AGTIN)
    .AddHeader('x-access-token', FToken)
    .Accept('application/json')
    .Get;

  if (LResponse.StatusCode = 200) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalResponse>(LResponse.Content);
  end
  else
  begin
    LResult := TBuscaFiscalResponse.Create;
    LResult.Success(False);
    LResult.Message('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
    Result := LResult;
  end;
end;

function TBuscaFiscalClient.SearchTributos(const ADescricao: string; const ALimite: Integer): IBuscaFiscalResponse;
var
  LResponse: IResponse;
  LResult: TBuscaFiscalResponse;
begin
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/tributos/busca')
    .AddHeader('x-access-token', FToken)
    .AddParam('descricao', ADescricao)
    .AddParam('limite', ALimite.ToString)
    .Accept('application/json')
    .Get;

  if (LResponse.StatusCode = 200) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalResponse>(LResponse.Content);
  end
  else
  begin
    LResult := TBuscaFiscalResponse.Create;
    LResult.Success(False);
    LResult.Message('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
    Result := LResult;
  end;
end;

function TBuscaFiscalClient.GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
var
  LResponse: IResponse;
  LResult: TBuscaFiscalImageResponse;
begin
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/imagem/' + AGTIN)
    .AddHeader('x-access-token', FToken)
    .Accept('application/json')
    .Get;

  if (LResponse.StatusCode = 200) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalImageResponse>(LResponse.Content);
  end
  else
  begin
    LResult := TBuscaFiscalImageResponse.Create;
    LResult.SetSuccess(False);
    LResult.SetMessage('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
    Result := LResult;
  end;
end;

function TBuscaFiscalClient.UpdateBatch(const ARequest: IBuscaFiscalBatchRequest): IBuscaFiscalBatchResponse;
var
  LResponse: IResponse;
  LBody: string;
  LResult: TBuscaFiscalBatchResponse;
begin
  LBody := TJson.ObjectToJsonString(TObject(ARequest));
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/cadastro/atualizar')
    .AddHeader('x-access-token', FToken)
    .ContentType('application/json')
    .Accept('application/json')
    .AddBody(LBody)
    .Post;

  if (LResponse.StatusCode = 200) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalBatchResponse>(LResponse.Content);
  end
  else
  begin
    LResult := TBuscaFiscalBatchResponse.Create;
    LResult.SetSuccess(False);
    LResult.SetMessage('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
    Result := LResult;
  end;
end;

end.
