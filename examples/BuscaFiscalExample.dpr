program BuscaFiscalExample;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  BuscaFiscal.Model,
  BuscaFiscal.Client;

procedure TestGTIN;
var
  LClient: IBuscaFiscalClient;
  LResponse: IBuscaFiscalResponse;
  LProduto: IBuscaFiscalProduto;
begin
  Writeln('--- Testando Busca por GTIN (Interfaces & Fluent) ---');
  
  // Client is already an interface and fluent
  LClient := TBuscaFiscalClient.New.Token('SEU_TOKEN_AQUI');
  
  // Response is now an interface - no manual .Free needed!
  LResponse := LClient.GetTributosByGTIN('7894900010015');
  
  if LResponse.GetSuccess and (Length(LResponse.GetProdutos) > 0) then
  begin
    LProduto := LResponse.GetProdutos[0];
    Writeln('Produto: ' + LProduto.GetDescricao);
    Writeln('NCM: ' + LProduto.GetNCM);
    Writeln('UFs com tributos: ' + string.Join(', ', LProduto.GetTributos.GetUFs));
  end
  else
  begin
    Writeln('Erro ou produto nao encontrado: ' + LResponse.GetMessage);
  end;
  
  // No LResponse.Free; needed here! ARC handles it.
end;

procedure TestFluentModel;
var
  LItem: IBuscaFiscalBatchItem;
  LRequest: IBuscaFiscalBatchRequest;
begin
  Writeln('--- Testando Fluent Interface nos Models ---');
  
  // Creating a batch update request fluently
  LItem := TBuscaFiscalBatchItem.New
    .Produto(TBuscaFiscalProduto.New
      .GTIN('1234567890123')
      .Descricao('Produto Teste Fluent'))
    .Tributos(TBuscaFiscalTributo.New
      .UF('SP')
      .AliqIcms(18.0));
      
  LRequest := TBuscaFiscalBatchRequest.New.AddItem(LItem);
  
  Writeln('Request criado com sucesso para o GTIN: ' + LRequest.GetProdutos[0].GetProduto.GetGTIN);
end;

begin
  try
    TestGTIN;
    Writeln('');
    TestFluentModel;
    
    Writeln('');
    Writeln('Pressione Enter para sair...');
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
