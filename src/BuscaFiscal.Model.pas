unit BuscaFiscal.Model;

interface

uses
  System.Generics.Collections,
  REST.Json.Types;

type
  /// <summary>
  /// Interface que representa as informações tributárias de um produto para um determinado estado (UF).
  /// </summary>
  IBuscaFiscalTributo = interface
    ['{4A5B6C7D-8E9F-0A1B-2C3D-4E5F6A7B8C9D}']
    function GetUF: string;
    function GetCSTIcms: string;
    function GetAliqIcms: Double;
    function GetCSTPis: string;
    function GetAliqPis: Double;
    function GetCSTCofins: string;
    function GetAliqCofins: Double;
    function GetCFOP: string;
    function GetMVA: Double;
    function GetClasseTributaria: string;
    function GetCodigoBeneficio: string;

    procedure SetUF(const AValue: string);
    procedure SetCSTIcms(const AValue: string);
    procedure SetAliqIcms(const AValue: Double);
    procedure SetCSTPis(const AValue: string);
    procedure SetAliqPis(const AValue: Double);
    procedure SetCSTCofins(const AValue: string);
    procedure SetAliqCofins(const AValue: Double);
    procedure SetCFOP(const AValue: string);
    procedure SetMVA(const AValue: Double);
    procedure SetClasseTributaria(const AValue: string);
    procedure SetCodigoBeneficio(const AValue: string);

    /// <summary> Define a Unidade Federativa (ex: SP, RJ). </summary>
    /// <param name="AValue">Sigla do estado (UF) com dois caracteres.</param>
    /// <returns>A própria instância da interface (Fluent Interface) para encadeamento de métodos.</returns>
    function UF(const AValue: string): IBuscaFiscalTributo;
    
    /// <summary> Define o Código de Situação Tributária (CST) do ICMS. </summary>
    /// <param name="AValue">Código CST do ICMS (ex: '00', '10', '60').</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function CSTIcms(const AValue: string): IBuscaFiscalTributo;
    
    /// <summary> Define a alíquota efetiva do ICMS. </summary>
    /// <param name="AValue">Valor percentual da alíquota (ex: 18.0).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function AliqIcms(const AValue: Double): IBuscaFiscalTributo;
    
    /// <summary> Define o Código de Situação Tributária (CST) do PIS. </summary>
    /// <param name="AValue">Código CST do PIS (ex: '01', '07', '49').</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function CSTPis(const AValue: string): IBuscaFiscalTributo;
    
    /// <summary> Define a alíquota do PIS. </summary>
    /// <param name="AValue">Valor percentual da alíquota (ex: 1.65).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function AliqPis(const AValue: Double): IBuscaFiscalTributo;
    
    /// <summary> Define o Código de Situação Tributária (CST) do COFINS. </summary>
    /// <param name="AValue">Código CST do COFINS (ex: '01', '07', '49').</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function CSTCofins(const AValue: string): IBuscaFiscalTributo;
    
    /// <summary> Define a alíquota do COFINS. </summary>
    /// <param name="AValue">Valor percentual da alíquota (ex: 7.60).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function AliqCofins(const AValue: Double): IBuscaFiscalTributo;
    
    /// <summary> Define o Código Fiscal de Operações e Prestações (CFOP) sugerido. </summary>
    /// <param name="AValue">Código CFOP (ex: '5102', '5405').</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function CFOP(const AValue: string): IBuscaFiscalTributo;
    
    /// <summary> Define a Margem de Valor Agregado (MVA) para Substituição Tributária. </summary>
    /// <param name="AValue">Valor percentual da MVA (ex: 40.0).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function MVA(const AValue: Double): IBuscaFiscalTributo;
    
    /// <summary> Define a classificação tributária interna do produto. </summary>
    /// <param name="AValue">Descrição ou código da classe tributária.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function ClasseTributaria(const AValue: string): IBuscaFiscalTributo;
    
    /// <summary> Define o código de benefício fiscal associado à operação. </summary>
    /// <param name="AValue">Código do benefício fiscal (conforme Tabela 5.2).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function CodigoBeneficio(const AValue: string): IBuscaFiscalTributo;
  end;

  /// <summary>
  /// Interface que agrupa as informações tributárias consolidadas, incluindo estatísticas e lista por estado.
  /// </summary>
  IBuscaFiscalTributosInfo = interface
    ['{5B6C7D8E-9F0A-1B2C-3D4E-5F6A7B8C9D0E}']
    function GetTotal: Integer;
    function GetUFs: TArray<string>;
    function GetLista: TArray<IBuscaFiscalTributo>;

    procedure SetTotal(const AValue: Integer);
    procedure SetUFs(const AValue: TArray<string>);

    /// <summary> Define o total de registros tributários encontrados para o produto. </summary>
    /// <param name="AValue">Número total de registros.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Total(const AValue: Integer): IBuscaFiscalTributosInfo;
    
    /// <summary> Define a lista de Unidades Federativas atendidas nesta resposta. </summary>
    /// <param name="AValue">Array de strings com as siglas das UFs.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function UFs(const AValue: TArray<string>): IBuscaFiscalTributosInfo;
    
    /// <summary> Adiciona um objeto de tributo à lista interna de informações. </summary>
    /// <param name="AValue">Objeto que implementa IBuscaFiscalTributo.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function AddTributo(const AValue: IBuscaFiscalTributo): IBuscaFiscalTributosInfo;
  end;

  /// <summary>
  /// Interface que representa os dados cadastrais e mercadológicos de um produto.
  /// </summary>
  IBuscaFiscalProduto = interface
    ['{6C7D8E9F-0A1B-2C3D-4E5F-6A7B8C9D0E1F}']
    function GetGTIN: string;
    function GetDescricao: string;
    function GetNCM: string;
    function GetCEST: string;
    function GetImagem: string;
    function GetTributos: IBuscaFiscalTributosInfo;

    procedure SetGTIN(const AValue: string);
    procedure SetDescricao(const AValue: string);
    procedure SetNCM(const AValue: string);
    procedure SetCEST(const AValue: string);
    procedure SetImagem(const AValue: string);

    /// <summary> Define o código GTIN (Global Trade Item Number), geralmente o código de barras EAN-13. </summary>
    /// <param name="AValue">Código numérico do GTIN.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function GTIN(const AValue: string): IBuscaFiscalProduto;
    
    /// <summary> Define a descrição completa do produto conforme cadastrado na base. </summary>
    /// <param name="AValue">Texto descritivo do produto.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Descricao(const AValue: string): IBuscaFiscalProduto;
    
    /// <summary> Define a Nomenclatura Comum do Mercosul (NCM) do produto. </summary>
    /// <param name="AValue">Código NCM (8 dígitos).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function NCM(const AValue: string): IBuscaFiscalProduto;
    
    /// <summary> Define o Código Especificador da Substituição Tributária (CEST). </summary>
    /// <param name="AValue">Código CEST (7 dígitos).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function CEST(const AValue: string): IBuscaFiscalProduto;
    
    /// <summary> Define o link ou conteúdo da imagem principal do produto. </summary>
    /// <param name="AValue">URL da imagem ou string Base64.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Imagem(const AValue: string): IBuscaFiscalProduto;
    
    /// <summary> Associa o conjunto de informações tributárias a este produto. </summary>
    /// <param name="AValue">Objeto que implementa IBuscaFiscalTributosInfo.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Tributos(const AValue: IBuscaFiscalTributosInfo): IBuscaFiscalProduto;
  end;

  /// <summary>
  /// Interface para a resposta padrão de operações de consulta (GTIN ou Descrição).
  /// </summary>
  IBuscaFiscalResponse = interface
    ['{7D8E9F0A-1B2C-3D4E-5F6A-7B8C9D0E1F2A}']
    function GetSuccess: Boolean;
    function GetBusca: string;
    function GetResultados: Integer;
    function GetProdutos: TArray<IBuscaFiscalProduto>;
    function GetMessage: string;

    procedure SetSuccess(const AValue: Boolean);
    procedure SetBusca(const AValue: string);
    procedure SetResultados(const AValue: Integer);
    procedure SetMessage(const AValue: string);

    /// <summary> Indica se a requisição à API foi concluída com sucesso. </summary>
    /// <param name="AValue">True para sucesso, False caso ocorra algum erro.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Success(const AValue: Boolean): IBuscaFiscalResponse;
    
    /// <summary> Define o termo ou código que originou a pesquisa. </summary>
    /// <param name="AValue">Valor pesquisado (ex: GTIN ou palavra-chave).</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Busca(const AValue: string): IBuscaFiscalResponse;
    
    /// <summary> Define a quantidade total de produtos encontrados na base de dados. </summary>
    /// <param name="AValue">Número total de itens.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Resultados(const AValue: Integer): IBuscaFiscalResponse;
    
    /// <summary> Define uma mensagem informativa ou de erro retornada pelo servidor. </summary>
    /// <param name="AValue">Texto da mensagem.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Message(const AValue: string): IBuscaFiscalResponse;
    
    /// <summary> Adiciona um objeto de produto à lista de resultados desta resposta. </summary>
    /// <param name="AValue">Objeto que implementa IBuscaFiscalProduto.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function AddProduto(const AValue: IBuscaFiscalProduto): IBuscaFiscalResponse;
  end;

  /// <summary>
  /// Interface para a resposta detalhada de uma consulta de imagem de produto.
  /// </summary>
  IBuscaFiscalImageResponse = interface
    ['{8E9F0A1B-2C3D-4E5F-6A7B-8C9D0E1F2A3B}']
    function GetSuccess: Boolean;
    function GetGTIN: string;
    function GetFonte: string;
    function GetFormato: string;
    function GetTamanhoBytes: Int64;
    function GetImagem: string;
    function GetMessage: string;

    procedure SetSuccess(const AValue: Boolean);
    procedure SetGTIN(const AValue: string);
    procedure SetFonte(const AValue: string);
    procedure SetFormato(const AValue: string);
    procedure SetTamanhoBytes(const AValue: Int64);
    procedure SetImagem(const AValue: string);
    procedure SetMessage(const AValue: string);
  end;

  /// <summary>
  /// Interface que representa um item individual para ser enviado em uma operação de lote (batch).
  /// </summary>
  IBuscaFiscalBatchItem = interface
    ['{9F0A1B2C-3D4E-5F6A-7B8C-9D0E1F2A3B4C}']
    function GetProduto: IBuscaFiscalProduto;
    function GetTributos: IBuscaFiscalTributo;

    /// <summary> Define o produto que compõe este item do lote. </summary>
    /// <param name="AValue">Objeto IBuscaFiscalProduto configurado.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Produto(const AValue: IBuscaFiscalProduto): IBuscaFiscalBatchItem;
    
    /// <summary> Define os dados tributários que compõem este item do lote. </summary>
    /// <param name="AValue">Objeto IBuscaFiscalTributo configurado.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function Tributos(const AValue: IBuscaFiscalTributo): IBuscaFiscalBatchItem;
  end;

  /// <summary>
  /// Interface para montagem de uma requisição de processamento em lote (batch request).
  /// </summary>
  IBuscaFiscalBatchRequest = interface
    ['{0A1B2C3D-4E5F-6A7B-8C9D-0E1F2A3B4C5D}']
    function GetProdutos: TArray<IBuscaFiscalBatchItem>;
    
    /// <summary> Adiciona um novo item (par Produto + Tributo) à fila de processamento em lote. </summary>
    /// <param name="AValue">Item configurado que implementa IBuscaFiscalBatchItem.</param>
    /// <returns>A própria instância da interface (Fluent Interface).</returns>
    function AddItem(const AValue: IBuscaFiscalBatchItem): IBuscaFiscalBatchRequest;
  end;

  /// <summary>
  /// Interface que representa o resultado individual de um item processado em lote.
  /// </summary>
  IBuscaFiscalBatchResult = interface
    ['{1B2C3D4E-5F6A-7B8C-9D0E-1F2A3B4C5D6E}']
    function GetIndex: Integer;
    function GetGTIN: string;
    function GetProdutoAtualizado: Boolean;
    function GetTributoAtualizado: Boolean;
    function GetImagemSalva: Boolean;
  end;

  /// <summary>
  /// Interface para a resposta final de uma operação de atualização em lote.
  /// </summary>
  IBuscaFiscalBatchResponse = interface
    ['{2C3D4E5F-6A7B-8C9D-0E1F-2A3B4C5D6E7F}']
    function GetSuccess: Boolean;
    function GetMessage: string;
    function GetTotalRecebidos: Integer;
    function GetTotalProcessados: Integer;
    function GetTotalErros: Integer;
    function GetImagensSalvas: Integer;
    function GetResultados: TArray<IBuscaFiscalBatchResult>;
    function GetErros: TArray<string>;
  end;

  TBuscaFiscalTributo = class(TInterfacedObject, IBuscaFiscalTributo)
  private
    [JSONName('uf')] FUF: string;
    [JSONName('cstIcms')] FCSTIcms: string;
    [JSONName('aliqIcms')] FAliqIcms: Double;
    [JSONName('cstPis')] FCSTPis: string;
    [JSONName('aliqPis')] FAliqPis: Double;
    [JSONName('cstCofins')] FCSTCofins: string;
    [JSONName('aliqCofins')] FAliqCofins: Double;
    [JSONName('cfop')] FCFOP: string;
    [JSONName('mva')] FMVA: Double;
    [JSONName('classeTributaria')] FClasseTributaria: string;
    [JSONName('codigoBeneficio')] FCodigoBeneficio: string;

    function GetUF: string;
    function GetCSTIcms: string;
    function GetAliqIcms: Double;
    function GetCSTPis: string;
    function GetAliqPis: Double;
    function GetCSTCofins: string;
    function GetAliqCofins: Double;
    function GetCFOP: string;
    function GetMVA: Double;
    function GetClasseTributaria: string;
    function GetCodigoBeneficio: string;

    procedure SetUF(const AValue: string);
    procedure SetCSTIcms(const AValue: string);
    procedure SetAliqIcms(const AValue: Double);
    procedure SetCSTPis(const AValue: string);
    procedure SetAliqPis(const AValue: Double);
    procedure SetCSTCofins(const AValue: string);
    procedure SetAliqCofins(const AValue: Double);
    procedure SetCFOP(const AValue: string);
    procedure SetMVA(const AValue: Double);
    procedure SetClasseTributaria(const AValue: string);
    procedure SetCodigoBeneficio(const AValue: string);
  public
    class function New: IBuscaFiscalTributo;
    function UF(const AValue: string): IBuscaFiscalTributo;
    function CSTIcms(const AValue: string): IBuscaFiscalTributo;
    function AliqIcms(const AValue: Double): IBuscaFiscalTributo;
    function CSTPis(const AValue: string): IBuscaFiscalTributo;
    function AliqPis(const AValue: Double): IBuscaFiscalTributo;
    function CSTCofins(const AValue: string): IBuscaFiscalTributo;
    function AliqCofins(const AValue: Double): IBuscaFiscalTributo;
    function CFOP(const AValue: string): IBuscaFiscalTributo;
    function MVA(const AValue: Double): IBuscaFiscalTributo;
    function ClasseTributaria(const AValue: string): IBuscaFiscalTributo;
    function CodigoBeneficio(const AValue: string): IBuscaFiscalTributo;
  end;

  TBuscaFiscalTributosInfo = class(TInterfacedObject, IBuscaFiscalTributosInfo)
  private
    [JSONName('total')] FTotal: Integer;
    [JSONName('ufs')] FUFs: TArray<string>;
    [JSONName('lista')] FLista: TArray<TBuscaFiscalTributo>;

    function GetTotal: Integer;
    function GetUFs: TArray<string>;
    function GetLista: TArray<IBuscaFiscalTributo>;

    procedure SetTotal(const AValue: Integer);
    procedure SetUFs(const AValue: TArray<string>);
  public
    class function New: IBuscaFiscalTributosInfo;
    function Total(const AValue: Integer): IBuscaFiscalTributosInfo;
    function UFs(const AValue: TArray<string>): IBuscaFiscalTributosInfo;
    function AddTributo(const AValue: IBuscaFiscalTributo): IBuscaFiscalTributosInfo;
  end;

  TBuscaFiscalProduto = class(TInterfacedObject, IBuscaFiscalProduto)
  private
    [JSONName('gtin')] FGTIN: string;
    [JSONName('descricao')] FDescricao: string;
    [JSONName('ncm')] FNCM: string;
    [JSONName('cest')] FCEST: string;
    [JSONName('imagem')] FImagem: string;
    [JSONName('tributos')] FTributos: TBuscaFiscalTributosInfo;

    function GetGTIN: string;
    function GetDescricao: string;
    function GetNCM: string;
    function GetCEST: string;
    function GetImagem: string;
    function GetTributos: IBuscaFiscalTributosInfo;

    procedure SetGTIN(const AValue: string);
    procedure SetDescricao(const AValue: string);
    procedure SetNCM(const AValue: string);
    procedure SetCEST(const AValue: string);
    procedure SetImagem(const AValue: string);
  public
    constructor Create;
    class function New: IBuscaFiscalProduto;
    function GTIN(const AValue: string): IBuscaFiscalProduto;
    function Descricao(const AValue: string): IBuscaFiscalProduto;
    function NCM(const AValue: string): IBuscaFiscalProduto;
    function CEST(const AValue: string): IBuscaFiscalProduto;
    function Imagem(const AValue: string): IBuscaFiscalProduto;
    function Tributos(const AValue: IBuscaFiscalTributosInfo): IBuscaFiscalProduto;
  end;

  TBuscaFiscalResponse = class(TInterfacedObject, IBuscaFiscalResponse)
  private
    [JSONName('success')] FSuccess: Boolean;
    [JSONName('busca')] FBusca: string;
    [JSONName('resultados')] FResultados: Integer;
    [JSONName('produtos')] FProdutos: TArray<TBuscaFiscalProduto>;
    [JSONName('message')] FMessage: string;

    function GetSuccess: Boolean;
    function GetBusca: string;
    function GetResultados: Integer;
    function GetProdutos: TArray<IBuscaFiscalProduto>;
    function GetMessage: string;

    procedure SetSuccess(const AValue: Boolean);
    procedure SetBusca(const AValue: string);
    procedure SetResultados(const AValue: Integer);
    procedure SetMessage(const AValue: string);
  public
    class function New: IBuscaFiscalResponse;
    function Success(const AValue: Boolean): IBuscaFiscalResponse;
    function Busca(const AValue: string): IBuscaFiscalResponse;
    function Resultados(const AValue: Integer): IBuscaFiscalResponse;
    function Message(const AValue: string): IBuscaFiscalResponse;
    function AddProduto(const AValue: IBuscaFiscalProduto): IBuscaFiscalResponse;
  end;

  TBuscaFiscalImageResponse = class(TInterfacedObject, IBuscaFiscalImageResponse)
  private
    [JSONName('success')] FSuccess: Boolean;
    [JSONName('gtin')] FGTIN: string;
    [JSONName('fonte')] FFonte: string;
    [JSONName('formato')] FFormato: string;
    [JSONName('tamanhoBytes')] FTamanhoBytes: Int64;
    [JSONName('imagem')] FImagem: string;
    [JSONName('message')] FMessage: string;

    function GetSuccess: Boolean;
    function GetGTIN: string;
    function GetFonte: string;
    function GetFormato: string;
    function GetTamanhoBytes: Int64;
    function GetImagem: string;
    function GetMessage: string;

    procedure SetSuccess(const AValue: Boolean);
    procedure SetGTIN(const AValue: string);
    procedure SetFonte(const AValue: string);
    procedure SetFormato(const AValue: string);
    procedure SetTamanhoBytes(const AValue: Int64);
    procedure SetImagem(const AValue: string);
    procedure SetMessage(const AValue: string);
  public
    class function New: IBuscaFiscalImageResponse;
  end;

  TBuscaFiscalBatchItem = class(TInterfacedObject, IBuscaFiscalBatchItem)
  private
    [JSONName('produto')] FProduto: TBuscaFiscalProduto;
    [JSONName('tributos')] FTributos: TBuscaFiscalTributo;

    function GetProduto: IBuscaFiscalProduto;
    function GetTributos: IBuscaFiscalTributo;
  public
    constructor Create;
    class function New: IBuscaFiscalBatchItem;
    function Produto(const AValue: IBuscaFiscalProduto): IBuscaFiscalBatchItem;
    function Tributos(const AValue: IBuscaFiscalTributo): IBuscaFiscalBatchItem;
  end;

  TBuscaFiscalBatchRequest = class(TInterfacedObject, IBuscaFiscalBatchRequest)
  private
    [JSONName('produtos')] FProdutos: TArray<TBuscaFiscalBatchItem>;

    function GetProdutos: TArray<IBuscaFiscalBatchItem>;
  public
    class function New: IBuscaFiscalBatchRequest;
    function AddItem(const AValue: IBuscaFiscalBatchItem): IBuscaFiscalBatchRequest;
  end;

  TBuscaFiscalBatchResult = class(TInterfacedObject, IBuscaFiscalBatchResult)
  private
    [JSONName('index')] FIndex: Integer;
    [JSONName('gtin')] FGTIN: string;
    [JSONName('produtoAtualizado')] FProdutoAtualizado: Boolean;
    [JSONName('tributoAtualizado')] FTributoAtualizado: Boolean;
    [JSONName('imagemSalva')] FImagemSalva: Boolean;

    function GetIndex: Integer;
    function GetGTIN: string;
    function GetProdutoAtualizado: Boolean;
    function GetTributoAtualizado: Boolean;
    function GetImagemSalva: Boolean;
  public
    class function New: IBuscaFiscalBatchResult;
  end;

  TBuscaFiscalBatchResponse = class(TInterfacedObject, IBuscaFiscalBatchResponse)
  private
    [JSONName('success')] FSuccess: Boolean;
    [JSONName('message')] FMessage: string;
    [JSONName('totalRecebidos')] FTotalRecebidos: Integer;
    [JSONName('totalProcessados')] FTotalProcessados: Integer;
    [JSONName('totalErros')] FTotalErros: Integer;
    [JSONName('imagensSalvas')] FImagensSalvas: Integer;
    [JSONName('resultados')] FResultados: TArray<TBuscaFiscalBatchResult>;
    [JSONName('erros')] FErros: TArray<string>;

    function GetSuccess: Boolean;
    function GetMessage: string;
    function GetTotalRecebidos: Integer;
    function GetTotalProcessados: Integer;
    function GetTotalErros: Integer;
    function GetImagensSalvas: Integer;
    function GetResultados: TArray<IBuscaFiscalBatchResult>;
    function GetErros: TArray<string>;
  public
    class function New: IBuscaFiscalBatchResponse;
  end;

implementation

class function TBuscaFiscalTributo.New: IBuscaFiscalTributo;
begin
  Result := TBuscaFiscalTributo.Create;
end;

function TBuscaFiscalTributo.GetUF: string; begin Result := FUF; end;
procedure TBuscaFiscalTributo.SetUF(const AValue: string); begin FUF := AValue; end;
function TBuscaFiscalTributo.GetCSTIcms: string; begin Result := FCSTIcms; end;
procedure TBuscaFiscalTributo.SetCSTIcms(const AValue: string); begin FCSTIcms := AValue; end;
function TBuscaFiscalTributo.GetAliqIcms: Double; begin Result := FAliqIcms; end;
procedure TBuscaFiscalTributo.SetAliqIcms(const AValue: Double); begin FAliqIcms := AValue; end;
function TBuscaFiscalTributo.GetCSTPis: string; begin Result := FCSTPis; end;
procedure TBuscaFiscalTributo.SetCSTPis(const AValue: string); begin FCSTPis := AValue; end;
function TBuscaFiscalTributo.GetAliqPis: Double; begin Result := FAliqPis; end;
procedure TBuscaFiscalTributo.SetAliqPis(const AValue: Double); begin FAliqPis := AValue; end;
function TBuscaFiscalTributo.GetCSTCofins: string; begin Result := FCSTCofins; end;
procedure TBuscaFiscalTributo.SetCSTCofins(const AValue: string); begin FCSTCofins := AValue; end;
function TBuscaFiscalTributo.GetAliqCofins: Double; begin Result := FAliqCofins; end;
procedure TBuscaFiscalTributo.SetAliqCofins(const AValue: Double); begin FAliqCofins := AValue; end;
function TBuscaFiscalTributo.GetCFOP: string; begin Result := FCFOP; end;
procedure TBuscaFiscalTributo.SetCFOP(const AValue: string); begin FCFOP := AValue; end;
function TBuscaFiscalTributo.GetMVA: Double; begin Result := FMVA; end;
procedure TBuscaFiscalTributo.SetMVA(const AValue: Double); begin FMVA := AValue; end;
function TBuscaFiscalTributo.GetClasseTributaria: string; begin Result := FClasseTributaria; end;
procedure TBuscaFiscalTributo.SetClasseTributaria(const AValue: string); begin FClasseTributaria := AValue; end;
function TBuscaFiscalTributo.GetCodigoBeneficio: string; begin Result := FCodigoBeneficio; end;
procedure TBuscaFiscalTributo.SetCodigoBeneficio(const AValue: string); begin FCodigoBeneficio := AValue; end;

function TBuscaFiscalTributo.UF(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FUF := AValue; end;
function TBuscaFiscalTributo.CSTIcms(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FCSTIcms := AValue; end;
function TBuscaFiscalTributo.AliqIcms(const AValue: Double): IBuscaFiscalTributo; begin Result := Self; FAliqIcms := AValue; end;
function TBuscaFiscalTributo.CSTPis(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FCSTPis := AValue; end;
function TBuscaFiscalTributo.AliqPis(const AValue: Double): IBuscaFiscalTributo; begin Result := Self; FAliqPis := AValue; end;
function TBuscaFiscalTributo.CSTCofins(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FCSTCofins := AValue; end;
function TBuscaFiscalTributo.AliqCofins(const AValue: Double): IBuscaFiscalTributo; begin Result := Self; FAliqCofins := AValue; end;
function TBuscaFiscalTributo.CFOP(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FCFOP := AValue; end;
function TBuscaFiscalTributo.MVA(const AValue: Double): IBuscaFiscalTributo; begin Result := Self; FMVA := AValue; end;
function TBuscaFiscalTributo.ClasseTributaria(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FClasseTributaria := AValue; end;
function TBuscaFiscalTributo.CodigoBeneficio(const AValue: string): IBuscaFiscalTributo; begin Result := Self; FCodigoBeneficio := AValue; end;

class function TBuscaFiscalTributosInfo.New: IBuscaFiscalTributosInfo;
begin
  Result := TBuscaFiscalTributosInfo.Create;
end;

function TBuscaFiscalTributosInfo.GetTotal: Integer; begin Result := FTotal; end;
procedure TBuscaFiscalTributosInfo.SetTotal(const AValue: Integer); begin FTotal := AValue; end;
function TBuscaFiscalTributosInfo.GetUFs: TArray<string>; begin Result := FUFs; end;
procedure TBuscaFiscalTributosInfo.SetUFs(const AValue: TArray<string>); begin FUFs := AValue; end;

function TBuscaFiscalTributosInfo.GetLista: TArray<IBuscaFiscalTributo>;
var I: Integer;
begin
  SetLength(Result, Length(FLista));
  for I := 0 to High(FLista) do Result[I] := FLista[I];
end;

function TBuscaFiscalTributosInfo.Total(const AValue: Integer): IBuscaFiscalTributosInfo; begin Result := Self; FTotal := AValue; end;
function TBuscaFiscalTributosInfo.UFs(const AValue: TArray<string>): IBuscaFiscalTributosInfo; begin Result := Self; FUFs := AValue; end;

function TBuscaFiscalTributosInfo.AddTributo(const AValue: IBuscaFiscalTributo): IBuscaFiscalTributosInfo;
begin
  Result := Self;
  SetLength(FLista, Length(FLista) + 1);
  FLista[High(FLista)] := TBuscaFiscalTributo(AValue);
end;

constructor TBuscaFiscalProduto.Create;
begin
  inherited Create;
  FTributos := TBuscaFiscalTributosInfo.Create;
end;

class function TBuscaFiscalProduto.New: IBuscaFiscalProduto;
begin
  Result := TBuscaFiscalProduto.Create;
end;

function TBuscaFiscalProduto.GetGTIN: string; begin Result := FGTIN; end;
procedure TBuscaFiscalProduto.SetGTIN(const AValue: string); begin FGTIN := AValue; end;
function TBuscaFiscalProduto.GetDescricao: string; begin Result := FDescricao; end;
procedure TBuscaFiscalProduto.SetDescricao(const AValue: string); begin FDescricao := AValue; end;
function TBuscaFiscalProduto.GetNCM: string; begin Result := FNCM; end;
procedure TBuscaFiscalProduto.SetNCM(const AValue: string); begin FNCM := AValue; end;
function TBuscaFiscalProduto.GetCEST: string; begin Result := FCEST; end;
procedure TBuscaFiscalProduto.SetCEST(const AValue: string); begin FCEST := AValue; end;
function TBuscaFiscalProduto.GetImagem: string; begin Result := FImagem; end;
procedure TBuscaFiscalProduto.SetImagem(const AValue: string); begin FImagem := AValue; end;
function TBuscaFiscalProduto.GetTributos: IBuscaFiscalTributosInfo; begin Result := FTributos; end;

function TBuscaFiscalProduto.GTIN(const AValue: string): IBuscaFiscalProduto; begin Result := Self; FGTIN := AValue; end;
function TBuscaFiscalProduto.Descricao(const AValue: string): IBuscaFiscalProduto; begin Result := Self; FDescricao := AValue; end;
function TBuscaFiscalProduto.NCM(const AValue: string): IBuscaFiscalProduto; begin Result := Self; FNCM := AValue; end;
function TBuscaFiscalProduto.CEST(const AValue: string): IBuscaFiscalProduto; begin Result := Self; FCEST := AValue; end;
function TBuscaFiscalProduto.Imagem(const AValue: string): IBuscaFiscalProduto; begin Result := Self; FImagem := AValue; end;
function TBuscaFiscalProduto.Tributos(const AValue: IBuscaFiscalTributosInfo): IBuscaFiscalProduto; begin Result := Self; FTributos := AValue; end;

class function TBuscaFiscalResponse.New: IBuscaFiscalResponse;
begin
  Result := TBuscaFiscalResponse.Create;
end;

function TBuscaFiscalResponse.GetSuccess: Boolean; begin Result := FSuccess; end;
procedure TBuscaFiscalResponse.SetSuccess(const AValue: Boolean); begin FSuccess := AValue; end;
function TBuscaFiscalResponse.GetBusca: string; begin Result := FBusca; end;
procedure TBuscaFiscalResponse.SetBusca(const AValue: string); begin FBusca := AValue; end;
function TBuscaFiscalResponse.GetResultados: Integer; begin Result := FResultados; end;
procedure TBuscaFiscalResponse.SetResultados(const AValue: Integer); begin FResultados := AValue; end;
function TBuscaFiscalResponse.GetMessage: string; begin Result := FMessage; end;
procedure TBuscaFiscalResponse.SetMessage(const AValue: string); begin FMessage := AValue; end;

function TBuscaFiscalResponse.GetProdutos: TArray<IBuscaFiscalProduto>;
var I: Integer;
begin
  SetLength(Result, Length(FProdutos));
  for I := 0 to High(FProdutos) do Result[I] := FProdutos[I];
end;

function TBuscaFiscalResponse.Success(const AValue: Boolean): IBuscaFiscalResponse; begin Result := Self; FSuccess := AValue; end;
function TBuscaFiscalResponse.Busca(const AValue: string): IBuscaFiscalResponse; begin Result := Self; FBusca := AValue; end;
function TBuscaFiscalResponse.Resultados(const AValue: Integer): IBuscaFiscalResponse; begin Result := Self; FResultados := AValue; end;
function TBuscaFiscalResponse.Message(const AValue: string): IBuscaFiscalResponse; begin Result := Self; FMessage := AValue; end;

function TBuscaFiscalResponse.AddProduto(const AValue: IBuscaFiscalProduto): IBuscaFiscalResponse;
begin
  Result := Self;
  SetLength(FProdutos, Length(FProdutos) + 1);
  FProdutos[High(FProdutos)] := TBuscaFiscalProduto(AValue);
end;

class function TBuscaFiscalImageResponse.New: IBuscaFiscalImageResponse;
begin
  Result := TBuscaFiscalImageResponse.Create;
end;

function TBuscaFiscalImageResponse.GetSuccess: Boolean; begin Result := FSuccess; end;
procedure TBuscaFiscalImageResponse.SetSuccess(const AValue: Boolean); begin FSuccess := AValue; end;
function TBuscaFiscalImageResponse.GetGTIN: string; begin Result := FGTIN; end;
procedure TBuscaFiscalImageResponse.SetGTIN(const AValue: string); begin FGTIN := AValue; end;
function TBuscaFiscalImageResponse.GetFonte: string; begin Result := FFonte; end;
procedure TBuscaFiscalImageResponse.SetFonte(const AValue: string); begin FFonte := AValue; end;
function TBuscaFiscalImageResponse.GetFormato: string; begin Result := FFormato; end;
procedure TBuscaFiscalImageResponse.SetFormato(const AValue: string); begin FFormato := AValue; end;
function TBuscaFiscalImageResponse.GetTamanhoBytes: Int64; begin Result := FTamanhoBytes; end;
procedure TBuscaFiscalImageResponse.SetTamanhoBytes(const AValue: Int64); begin FTamanhoBytes := AValue; end;
function TBuscaFiscalImageResponse.GetImagem: string; begin Result := FImagem; end;
procedure TBuscaFiscalImageResponse.SetImagem(const AValue: string); begin FImagem := AValue; end;
function TBuscaFiscalImageResponse.GetMessage: string; begin Result := FMessage; end;
procedure TBuscaFiscalImageResponse.SetMessage(const AValue: string); begin FMessage := AValue; end;

constructor TBuscaFiscalBatchItem.Create;
begin
  inherited Create;
  FProduto := TBuscaFiscalProduto.Create;
  FTributos := TBuscaFiscalTributo.Create;
end;

class function TBuscaFiscalBatchItem.New: IBuscaFiscalBatchItem;
begin
  Result := TBuscaFiscalBatchItem.Create;
end;

function TBuscaFiscalBatchItem.GetProduto: IBuscaFiscalProduto; begin Result := FProduto; end;
function TBuscaFiscalBatchItem.GetTributos: IBuscaFiscalTributo; begin Result := FTributos; end;

function TBuscaFiscalBatchItem.Produto(const AValue: IBuscaFiscalProduto): IBuscaFiscalBatchItem;
begin
  Result := Self;
  FProduto := TBuscaFiscalProduto(AValue);
end;

function TBuscaFiscalBatchItem.Tributos(const AValue: IBuscaFiscalTributo): IBuscaFiscalBatchItem;
begin
  Result := Self;
  FTributos := TBuscaFiscalTributo(AValue);
end;

class function TBuscaFiscalBatchRequest.New: IBuscaFiscalBatchRequest;
begin
  Result := TBuscaFiscalBatchRequest.Create;
end;

function TBuscaFiscalBatchRequest.GetProdutos: TArray<IBuscaFiscalBatchItem>;
var I: Integer;
begin
  SetLength(Result, Length(FProdutos));
  for I := 0 to High(FProdutos) do Result[I] := FProdutos[I];
end;

function TBuscaFiscalBatchRequest.AddItem(const AValue: IBuscaFiscalBatchItem): IBuscaFiscalBatchRequest;
begin
  Result := Self;
  SetLength(FProdutos, Length(FProdutos) + 1);
  FProdutos[High(FProdutos)] := TBuscaFiscalBatchItem(AValue);
end;

class function TBuscaFiscalBatchResult.New: IBuscaFiscalBatchResult;
begin
  Result := TBuscaFiscalBatchResult.Create;
end;

function TBuscaFiscalBatchResult.GetIndex: Integer; begin Result := FIndex; end;
function TBuscaFiscalBatchResult.GetGTIN: string; begin Result := FGTIN; end;
function TBuscaFiscalBatchResult.GetProdutoAtualizado: Boolean; begin Result := FProdutoAtualizado; end;
function TBuscaFiscalBatchResult.GetTributoAtualizado: Boolean; begin Result := FTributoAtualizado; end;
function TBuscaFiscalBatchResult.GetImagemSalva: Boolean; begin Result := FImagemSalva; end;

class function TBuscaFiscalBatchResponse.New: IBuscaFiscalBatchResponse;
begin
  Result := TBuscaFiscalBatchResponse.Create;
end;

function TBuscaFiscalBatchResponse.GetSuccess: Boolean; begin Result := FSuccess; end;
function TBuscaFiscalBatchResponse.GetMessage: string; begin Result := FMessage; end;
function TBuscaFiscalBatchResponse.GetTotalRecebidos: Integer; begin Result := FTotalRecebidos; end;
function TBuscaFiscalBatchResponse.GetTotalProcessados: Integer; begin Result := FTotalProcessados; end;
function TBuscaFiscalBatchResponse.GetTotalErros: Integer; begin Result := FTotalErros; end;
function TBuscaFiscalBatchResponse.GetImagensSalvas: Integer; begin Result := FImagensSalvas; end;

function TBuscaFiscalBatchResponse.GetResultados: TArray<IBuscaFiscalBatchResult>;
var I: Integer;
begin
  SetLength(Result, Length(FResultados));
  for I := 0 to High(FResultados) do Result[I] := FResultados[I];
end;

function TBuscaFiscalBatchResponse.GetErros: TArray<string>; begin Result := FErros; end;

end.
