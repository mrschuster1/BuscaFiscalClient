unit BuscaFiscal.Client;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  RESTRequest4D,
  BuscaFiscal.Model;

type
  IBuscaFiscalClient = interface
    ['{3D4E5F6A-7B8C-9D0E-1F2A-3B4C5D6E7F8A}']
    function Token(const AValue: string): IBuscaFiscalClient;
    function BaseURL(const AValue: string): IBuscaFiscalClient;
    function GetTributosByGTIN(const AGTIN: string): IBuscaFiscalResponse;
    function SearchTributos(const ADescricao: string; const ALimite: Integer = 10): IBuscaFiscalResponse;
    function GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
    function UpdateBatch(const ARequest: IBuscaFiscalBatchRequest): IBuscaFiscalBatchResponse;
  end;

  TBuscaFiscalClient = class(TInterfacedObject, IBuscaFiscalClient)
  private
    FToken: string;
    FBaseURL: string;
  public
    constructor Create(const AToken: string = '');
    class function New(const AToken: string = ''): IBuscaFiscalClient;

    function Token(const AValue: string): IBuscaFiscalClient;
    function BaseURL(const AValue: string): IBuscaFiscalClient;

    function GetTributosByGTIN(const AGTIN: string): IBuscaFiscalResponse;
    function SearchTributos(const ADescricao: string; const ALimite: Integer = 10): IBuscaFiscalResponse;
    function GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
    function UpdateBatch(const ARequest: IBuscaFiscalBatchRequest): IBuscaFiscalBatchResponse;
  end;

implementation

uses
  REST.Json;

{ TBuscaFiscalClient }

constructor TBuscaFiscalClient.Create(const AToken: string);
begin
  inherited Create;
  FToken := AToken;
  FBaseURL := 'https://portalapi.buscafiscal.com.br';
end;

class function TBuscaFiscalClient.New(const AToken: string): IBuscaFiscalClient;
begin
  Result := TBuscaFiscalClient.Create(AToken);
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
begin
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/tributos/gtin/' + AGTIN)
    .AddHeader('x-access-token', FToken)
    .Accept('application/json')
    .Get;

  if (LResponse.StatusCode = 200) and (Length(LResponse.RawBytes) > 0) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalResponse>(TEncoding.UTF8.GetString(LResponse.RawBytes)) as IBuscaFiscalResponse;
  end
  else
  begin
    Result := TBuscaFiscalResponse.New
      .Success(False)
      .Message('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
  end;
end;

function TBuscaFiscalClient.SearchTributos(const ADescricao: string; const ALimite: Integer): IBuscaFiscalResponse;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/tributos/busca')
    .AddHeader('x-access-token', FToken)
    .AddParam('descricao', ADescricao)
    .AddParam('limite', ALimite.ToString)
    .Accept('application/json')
    .Get;

  if (LResponse.StatusCode = 200) and (Length(LResponse.RawBytes) > 0) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalResponse>(TEncoding.UTF8.GetString(LResponse.RawBytes)) as IBuscaFiscalResponse;
  end
  else
  begin
    Result := TBuscaFiscalResponse.New
      .Success(False)
      .Message('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
  end;
end;

function TBuscaFiscalClient.GetImage(const AGTIN: string): IBuscaFiscalImageResponse;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/imagem/' + AGTIN)
    .AddHeader('x-access-token', FToken)
    .Accept('application/json')
    .Get;

  if (LResponse.StatusCode = 200) and (Length(LResponse.RawBytes) > 0) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalImageResponse>(TEncoding.UTF8.GetString(LResponse.RawBytes)) as IBuscaFiscalImageResponse;
  end
  else
  begin
    Result := TBuscaFiscalImageResponse.New
      .Success(False)
      .Message('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
  end;
end;

function TBuscaFiscalClient.UpdateBatch(const ARequest: IBuscaFiscalBatchRequest): IBuscaFiscalBatchResponse;
var
  LResponse: IResponse;
  LBody: string;
begin
  LBody := TJson.ObjectToJsonString((ARequest as IBuscaFiscalModel).AsObject);
  LResponse := TRequest.New
    .BaseURL(FBaseURL)
    .Resource('/api/integracao/cadastro/atualizar')
    .AddHeader('x-access-token', FToken)
    .ContentType('application/json')
    .Accept('application/json')
    .AddBody(LBody)
    .Post;

  if (LResponse.StatusCode = 200) and (Length(LResponse.RawBytes) > 0) then
  begin
    Result := TJson.JsonToObject<TBuscaFiscalBatchResponse>(TEncoding.UTF8.GetString(LResponse.RawBytes)) as IBuscaFiscalBatchResponse;
  end
  else
  begin
    Result := TBuscaFiscalBatchResponse.New
      .Success(False)
      .Message('Erro HTTP ' + LResponse.StatusCode.ToString + ': ' + LResponse.Content);
  end;
end;

end.
