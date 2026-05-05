unit BuscaFiscal.Model;

interface

uses
  System.Generics.Collections,
  REST.Json.Types;

type
  { Forward Declarations }
  IBuscaFiscalTributo = interface;
  IBuscaFiscalTributosInfo = interface;
  IBuscaFiscalProduto = interface;
  IBuscaFiscalResponse = interface;
  IBuscaFiscalImageResponse = interface;
  IBuscaFiscalBatchItem = interface;
  IBuscaFiscalBatchRequest = interface;
  IBuscaFiscalBatchResult = interface;
  IBuscaFiscalBatchResponse = interface;

  { Base interface for bridging interface to object (for JSON serialization) }
  IBuscaFiscalModel = interface
    ['{A1B2C3D4-E5F6-7A8B-9C0D-E1F2A3B4C5D6}']
    function AsObject: TObject;
  end;

  { Base class for non-ref-counted interface implementation (ideal for JSON models) }
  TBuscaFiscalModelBase = class(TInterfacedObject, IBuscaFiscalModel)
  public
    function AsObject: TObject;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

  { Interfaces }

  IBuscaFiscalTributo = interface(IBuscaFiscalModel)
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

  IBuscaFiscalTributosInfo = interface(IBuscaFiscalModel)
    ['{5B6C7D8E-9F0A-1B2C-3D4E-5F6A7B8C9D0E}']
    function GetTotal: Integer;
    function GetUFs: TArray<string>;
    function GetLista: TArray<IBuscaFiscalTributo>;
    procedure SetTotal(const AValue: Integer);
    procedure SetUFs(const AValue: TArray<string>);
    function Total(const AValue: Integer): IBuscaFiscalTributosInfo;
    function UFs(const AValue: TArray<string>): IBuscaFiscalTributosInfo;
    function AddTributo(const AValue: IBuscaFiscalTributo)
      : IBuscaFiscalTributosInfo;
  end;

  IBuscaFiscalProduto = interface(IBuscaFiscalModel)
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
    function GTIN(const AValue: string): IBuscaFiscalProduto;
    function Descricao(const AValue: string): IBuscaFiscalProduto;
    function NCM(const AValue: string): IBuscaFiscalProduto;
    function CEST(const AValue: string): IBuscaFiscalProduto;
    function Imagem(const AValue: string): IBuscaFiscalProduto;
    function Tributos(const AValue: IBuscaFiscalTributosInfo)
      : IBuscaFiscalProduto;
  end;

  IBuscaFiscalResponse = interface(IBuscaFiscalModel)
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
    function Success(const AValue: Boolean): IBuscaFiscalResponse;
    function Busca(const AValue: string): IBuscaFiscalResponse;
    function Resultados(const AValue: Integer): IBuscaFiscalResponse;
    function Message(const AValue: string): IBuscaFiscalResponse;
    function AddProduto(const AValue: IBuscaFiscalProduto)
      : IBuscaFiscalResponse;
  end;

  IBuscaFiscalImageResponse = interface(IBuscaFiscalModel)
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
    function Success(const AValue: Boolean): IBuscaFiscalImageResponse;
    function Message(const AValue: string): IBuscaFiscalImageResponse;
  end;

  IBuscaFiscalBatchItem = interface(IBuscaFiscalModel)
    ['{9F0A1B2C-3D4E-5F6A-7B8C-9D0E1F2A3B4C}']
    function GetProduto: IBuscaFiscalProduto;
    function GetTributos: IBuscaFiscalTributo;
    function Produto(const AValue: IBuscaFiscalProduto): IBuscaFiscalBatchItem;
    function Tributos(const AValue: IBuscaFiscalTributo): IBuscaFiscalBatchItem;
  end;

  IBuscaFiscalBatchRequest = interface(IBuscaFiscalModel)
    ['{0A1B2C3D-4E5F-6A7B-8C9D-0E1F2A3B4C5D}']
    function GetProdutos: TArray<IBuscaFiscalBatchItem>;
    function AddItem(const AValue: IBuscaFiscalBatchItem)
      : IBuscaFiscalBatchRequest;
  end;

  IBuscaFiscalBatchResult = interface(IBuscaFiscalModel)
    ['{1B2C3D4E-5F6A-7B8C-9D0E-1F2A3B4C5D6E}']
    function GetIndex: Integer;
    function GetGTIN: string;
    function GetProdutoAtualizado: Boolean;
    function GetTributoAtualizado: Boolean;
    function GetImagemSalva: Boolean;
  end;

  IBuscaFiscalBatchResponse = interface(IBuscaFiscalModel)
    ['{2C3D4E5F-6A7B-8C9D-0E1F-2A3B4C5D6E7F}']
    function GetSuccess: Boolean;
    function GetMessage: string;
    function GetTotalRecebidos: Integer;
    function GetTotalProcessados: Integer;
    function GetTotalErros: Integer;
    function GetImagensSalvas: Integer;
    function GetResultados: TArray<IBuscaFiscalBatchResult>;
    function GetErros: TArray<string>;
    procedure SetSuccess(const AValue: Boolean);
    procedure SetMessage(const AValue: string);
    function Success(const AValue: Boolean): IBuscaFiscalBatchResponse;
    function Message(const AValue: string): IBuscaFiscalBatchResponse;
  end;

  { Concrete Classes }

  TBuscaFiscalTributo = class(TBuscaFiscalModelBase, IBuscaFiscalTributo)
  private
    [JSONName('uf')]
    FUF: string;
    [JSONName('cstIcms')]
    FCSTIcms: string;
    [JSONName('aliqIcms')]
    FAliqIcms: Double;
    [JSONName('cstPis')]
    FCSTPis: string;
    [JSONName('aliqPis')]
    FAliqPis: Double;
    [JSONName('cstCofins')]
    FCSTCofins: string;
    [JSONName('aliqCofins')]
    FAliqCofins: Double;
    [JSONName('cfop')]
    FCFOP: string;
    [JSONName('mva')]
    FMVA: Double;
    [JSONName('classeTributaria')]
    FClasseTributaria: string;
    [JSONName('codigoBeneficio')]
    FCodigoBeneficio: string;
  public
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

  TBuscaFiscalTributosInfo = class(TBuscaFiscalModelBase,
    IBuscaFiscalTributosInfo)
  private
    [JSONName('total')]
    FTotal: Integer;
    [JSONName('ufs')]
    FUFs: TArray<string>;
    [JSONName('lista')]
    FLista: TArray<TBuscaFiscalTributo>;
  public
    destructor Destroy; override;
    function GetTotal: Integer;
    function GetUFs: TArray<string>;
    function GetLista: TArray<IBuscaFiscalTributo>;
    procedure SetTotal(const AValue: Integer);
    procedure SetUFs(const AValue: TArray<string>);
    class function New: IBuscaFiscalTributosInfo;
    function Total(const AValue: Integer): IBuscaFiscalTributosInfo;
    function UFs(const AValue: TArray<string>): IBuscaFiscalTributosInfo;
    function AddTributo(const AValue: IBuscaFiscalTributo)
      : IBuscaFiscalTributosInfo;
  end;

  TBuscaFiscalProduto = class(TBuscaFiscalModelBase, IBuscaFiscalProduto)
  private
    [JSONName('gtin')]
    FGTIN: string;
    [JSONName('descricao')]
    FDescricao: string;
    [JSONName('ncm')]
    FNCM: string;
    [JSONName('cest')]
    FCEST: string;
    [JSONName('imagem')]
    FImagem: string;
    [JSONName('tributos')]
    FTributos: TBuscaFiscalTributosInfo;
  public
    constructor Create;
    destructor Destroy; override;
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
    class function New: IBuscaFiscalProduto;
    function GTIN(const AValue: string): IBuscaFiscalProduto;
    function Descricao(const AValue: string): IBuscaFiscalProduto;
    function NCM(const AValue: string): IBuscaFiscalProduto;
    function CEST(const AValue: string): IBuscaFiscalProduto;
    function Imagem(const AValue: string): IBuscaFiscalProduto;
    function Tributos(const AValue: IBuscaFiscalTributosInfo)
      : IBuscaFiscalProduto;
  end;

  TBuscaFiscalResponse = class(TBuscaFiscalModelBase, IBuscaFiscalResponse)
  private
    [JSONName('success')]
    FSuccess: Boolean;
    [JSONName('busca')]
    FBusca: string;
    [JSONName('resultados')]
    FResultados: Integer;
    [JSONName('produtos')]
    FProdutos: TArray<TBuscaFiscalProduto>;
    [JSONName('message')]
    FMessage: string;
  public
    destructor Destroy; override;
    function GetSuccess: Boolean;
    function GetBusca: string;
    function GetResultados: Integer;
    function GetProdutos: TArray<IBuscaFiscalProduto>;
    function GetMessage: string;
    procedure SetSuccess(const AValue: Boolean);
    procedure SetBusca(const AValue: string);
    procedure SetResultados(const AValue: Integer);
    procedure SetMessage(const AValue: string);
    class function New: IBuscaFiscalResponse;
    function Success(const AValue: Boolean): IBuscaFiscalResponse;
    function Busca(const AValue: string): IBuscaFiscalResponse;
    function Resultados(const AValue: Integer): IBuscaFiscalResponse;
    function Message(const AValue: string): IBuscaFiscalResponse;
    function AddProduto(const AValue: IBuscaFiscalProduto)
      : IBuscaFiscalResponse;
  end;

  TBuscaFiscalImageResponse = class(TBuscaFiscalModelBase,
    IBuscaFiscalImageResponse)
  private
    [JSONName('success')]
    FSuccess: Boolean;
    [JSONName('gtin')]
    FGTIN: string;
    [JSONName('fonte')]
    FFonte: string;
    [JSONName('formato')]
    FFormato: string;
    [JSONName('tamanhoBytes')]
    FTamanhoBytes: Int64;
    [JSONName('imagem')]
    FImagem: string;
    [JSONName('message')]
    FMessage: string;
  public
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
    class function New: IBuscaFiscalImageResponse;
    function Success(const AValue: Boolean): IBuscaFiscalImageResponse;
    function Message(const AValue: string): IBuscaFiscalImageResponse;
  end;

  TBuscaFiscalBatchItem = class(TBuscaFiscalModelBase, IBuscaFiscalBatchItem)
  private
    [JSONName('produto')]
    FProduto: TBuscaFiscalProduto;
    [JSONName('tributos')]
    FTributos: TBuscaFiscalTributo;
  public
    constructor Create;
    destructor Destroy; override;
    function GetProduto: IBuscaFiscalProduto;
    function GetTributos: IBuscaFiscalTributo;
    class function New: IBuscaFiscalBatchItem;
    function Produto(const AValue: IBuscaFiscalProduto): IBuscaFiscalBatchItem;
    function Tributos(const AValue: IBuscaFiscalTributo): IBuscaFiscalBatchItem;
  end;

  TBuscaFiscalBatchRequest = class(TBuscaFiscalModelBase,
    IBuscaFiscalBatchRequest)
  private
    [JSONName('produtos')]
    FProdutos: TArray<TBuscaFiscalBatchItem>;
  public
    destructor Destroy; override;
    function GetProdutos: TArray<IBuscaFiscalBatchItem>;
    class function New: IBuscaFiscalBatchRequest;
    function AddItem(const AValue: IBuscaFiscalBatchItem)
      : IBuscaFiscalBatchRequest;
  end;

  TBuscaFiscalBatchResult = class(TBuscaFiscalModelBase,
    IBuscaFiscalBatchResult)
  private
    [JSONName('index')]
    FIndex: Integer;
    [JSONName('gtin')]
    FGTIN: string;
    [JSONName('produtoAtualizado')]
    FProdutoAtualizado: Boolean;
    [JSONName('tributoAtualizado')]
    FTributoAtualizado: Boolean;
    [JSONName('imagemSalva')]
    FImagemSalva: Boolean;
  public
    function GetIndex: Integer;
    function GetGTIN: string;
    function GetProdutoAtualizado: Boolean;
    function GetTributoAtualizado: Boolean;
    function GetImagemSalva: Boolean;
    class function New: IBuscaFiscalBatchResult;
  end;

  TBuscaFiscalBatchResponse = class(TBuscaFiscalModelBase,
    IBuscaFiscalBatchResponse)
  private
    [JSONName('success')]
    FSuccess: Boolean;
    [JSONName('message')]
    FMessage: string;
    [JSONName('totalRecebidos')]
    FTotalRecebidos: Integer;
    [JSONName('totalProcessados')]
    FTotalProcessados: Integer;
    [JSONName('totalErros')]
    FTotalErros: Integer;
    [JSONName('imagensSalvas')]
    FImagensSalvas: Integer;
    [JSONName('resultados')]
    FResultados: TArray<TBuscaFiscalBatchResult>;
    [JSONName('erros')]
    FErros: TArray<string>;
  public
    destructor Destroy; override;
    function GetSuccess: Boolean;
    function GetMessage: string;
    function GetTotalRecebidos: Integer;
    function GetTotalProcessados: Integer;
    function GetTotalErros: Integer;
    function GetImagensSalvas: Integer;
    function GetResultados: TArray<IBuscaFiscalBatchResult>;
    function GetErros: TArray<string>;
    procedure SetSuccess(const AValue: Boolean);
    procedure SetMessage(const AValue: string);
    class function New: IBuscaFiscalBatchResponse;
    function Success(const AValue: Boolean): IBuscaFiscalBatchResponse;
    function Message(const AValue: string): IBuscaFiscalBatchResponse;
  end;

implementation

{ TBuscaFiscalModelBase }

function TBuscaFiscalModelBase.AsObject: TObject;
begin
  Result := Self;
end;

function TBuscaFiscalModelBase._AddRef: Integer;
begin
  Result := -1;
end;

function TBuscaFiscalModelBase._Release: Integer;
begin
  Result := -1;
end;

{ TBuscaFiscalTributo }

class function TBuscaFiscalTributo.New: IBuscaFiscalTributo;
begin
  Result := TBuscaFiscalTributo.Create;
end;

function TBuscaFiscalTributo.GetUF: string;
begin
  Result := FUF;
end;

function TBuscaFiscalTributo.GetCSTIcms: string;
begin
  Result := FCSTIcms;
end;

function TBuscaFiscalTributo.GetAliqIcms: Double;
begin
  Result := FAliqIcms;
end;

function TBuscaFiscalTributo.GetCSTPis: string;
begin
  Result := FCSTPis;
end;

function TBuscaFiscalTributo.GetAliqPis: Double;
begin
  Result := FAliqPis;
end;

function TBuscaFiscalTributo.GetCSTCofins: string;
begin
  Result := FCSTCofins;
end;

function TBuscaFiscalTributo.GetAliqCofins: Double;
begin
  Result := FAliqCofins;
end;

function TBuscaFiscalTributo.GetCFOP: string;
begin
  Result := FCFOP;
end;

function TBuscaFiscalTributo.GetMVA: Double;
begin
  Result := FMVA;
end;

function TBuscaFiscalTributo.GetClasseTributaria: string;
begin
  Result := FClasseTributaria;
end;

function TBuscaFiscalTributo.GetCodigoBeneficio: string;
begin
  Result := FCodigoBeneficio;
end;

procedure TBuscaFiscalTributo.SetUF(const AValue: string);
begin
  FUF := AValue;
end;

procedure TBuscaFiscalTributo.SetCSTIcms(const AValue: string);
begin
  FCSTIcms := AValue;
end;

procedure TBuscaFiscalTributo.SetAliqIcms(const AValue: Double);
begin
  FAliqIcms := AValue;
end;

procedure TBuscaFiscalTributo.SetCSTPis(const AValue: string);
begin
  FCSTPis := AValue;
end;

procedure TBuscaFiscalTributo.SetAliqPis(const AValue: Double);
begin
  FAliqPis := AValue;
end;

procedure TBuscaFiscalTributo.SetCSTCofins(const AValue: string);
begin
  FCSTCofins := AValue;
end;

procedure TBuscaFiscalTributo.SetAliqCofins(const AValue: Double);
begin
  FAliqCofins := AValue;
end;

procedure TBuscaFiscalTributo.SetCFOP(const AValue: string);
begin
  FCFOP := AValue;
end;

procedure TBuscaFiscalTributo.SetMVA(const AValue: Double);
begin
  FMVA := AValue;
end;

procedure TBuscaFiscalTributo.SetClasseTributaria(const AValue: string);
begin
  FClasseTributaria := AValue;
end;

procedure TBuscaFiscalTributo.SetCodigoBeneficio(const AValue: string);
begin
  FCodigoBeneficio := AValue;
end;

function TBuscaFiscalTributo.UF(const AValue: string): IBuscaFiscalTributo;
begin
  Result := Self;
  FUF := AValue;
end;

function TBuscaFiscalTributo.CSTIcms(const AValue: string): IBuscaFiscalTributo;
begin
  Result := Self;
  FCSTIcms := AValue;
end;

function TBuscaFiscalTributo.AliqIcms(const AValue: Double)
  : IBuscaFiscalTributo;
begin
  Result := Self;
  FAliqIcms := AValue;
end;

function TBuscaFiscalTributo.CSTPis(const AValue: string): IBuscaFiscalTributo;
begin
  Result := Self;
  FCSTPis := AValue;
end;

function TBuscaFiscalTributo.AliqPis(const AValue: Double): IBuscaFiscalTributo;
begin
  Result := Self;
  FAliqPis := AValue;
end;

function TBuscaFiscalTributo.CSTCofins(const AValue: string)
  : IBuscaFiscalTributo;
begin
  Result := Self;
  FCSTCofins := AValue;
end;

function TBuscaFiscalTributo.AliqCofins(const AValue: Double)
  : IBuscaFiscalTributo;
begin
  Result := Self;
  FAliqCofins := AValue;
end;

function TBuscaFiscalTributo.CFOP(const AValue: string): IBuscaFiscalTributo;
begin
  Result := Self;
  FCFOP := AValue;
end;

function TBuscaFiscalTributo.MVA(const AValue: Double): IBuscaFiscalTributo;
begin
  Result := Self;
  FMVA := AValue;
end;

function TBuscaFiscalTributo.ClasseTributaria(const AValue: string)
  : IBuscaFiscalTributo;
begin
  Result := Self;
  FClasseTributaria := AValue;
end;

function TBuscaFiscalTributo.CodigoBeneficio(const AValue: string)
  : IBuscaFiscalTributo;
begin
  Result := Self;
  FCodigoBeneficio := AValue;
end;

{ TBuscaFiscalTributosInfo }

destructor TBuscaFiscalTributosInfo.Destroy;
var
  I: Integer;
begin
  for I := 0 to High(FLista) do
    FLista[I].Free;
  inherited;
end;

class function TBuscaFiscalTributosInfo.New: IBuscaFiscalTributosInfo;
begin
  Result := TBuscaFiscalTributosInfo.Create;
end;

function TBuscaFiscalTributosInfo.GetTotal: Integer;
begin
  Result := FTotal;
end;

function TBuscaFiscalTributosInfo.GetUFs: TArray<string>;
begin
  Result := FUFs;
end;

function TBuscaFiscalTributosInfo.GetLista: TArray<IBuscaFiscalTributo>;
var
  I: Integer;
begin
  SetLength(Result, Length(FLista));
  for I := 0 to High(FLista) do
    Result[I] := FLista[I] as IBuscaFiscalTributo;
end;

procedure TBuscaFiscalTributosInfo.SetTotal(const AValue: Integer);
begin
  FTotal := AValue;
end;

procedure TBuscaFiscalTributosInfo.SetUFs(const AValue: TArray<string>);
begin
  FUFs := AValue;
end;

function TBuscaFiscalTributosInfo.Total(const AValue: Integer)
  : IBuscaFiscalTributosInfo;
begin
  Result := Self;
  FTotal := AValue;
end;

function TBuscaFiscalTributosInfo.UFs(const AValue: TArray<string>)
  : IBuscaFiscalTributosInfo;
begin
  Result := Self;
  FUFs := AValue;
end;

function TBuscaFiscalTributosInfo.AddTributo(const AValue: IBuscaFiscalTributo)
  : IBuscaFiscalTributosInfo;
begin
  Result := Self;
  SetLength(FLista, Length(FLista) + 1);
  FLista[High(FLista)] := AValue.AsObject as TBuscaFiscalTributo;
end;

{ TBuscaFiscalProduto }

constructor TBuscaFiscalProduto.Create;
begin
  inherited;
  FTributos := TBuscaFiscalTributosInfo.Create;
end;

destructor TBuscaFiscalProduto.Destroy;
begin
  FTributos.Free;
  inherited;
end;

class function TBuscaFiscalProduto.New: IBuscaFiscalProduto;
begin
  Result := TBuscaFiscalProduto.Create;
end;

function TBuscaFiscalProduto.GetGTIN: string;
begin
  Result := FGTIN;
end;

function TBuscaFiscalProduto.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TBuscaFiscalProduto.GetNCM: string;
begin
  Result := FNCM;
end;

function TBuscaFiscalProduto.GetCEST: string;
begin
  Result := FCEST;
end;

function TBuscaFiscalProduto.GetImagem: string;
begin
  Result := FImagem;
end;

function TBuscaFiscalProduto.GetTributos: IBuscaFiscalTributosInfo;
begin
  Result := FTributos;
end;

procedure TBuscaFiscalProduto.SetGTIN(const AValue: string);
begin
  FGTIN := AValue;
end;

procedure TBuscaFiscalProduto.SetDescricao(const AValue: string);
begin
  FDescricao := AValue;
end;

procedure TBuscaFiscalProduto.SetNCM(const AValue: string);
begin
  FNCM := AValue;
end;

procedure TBuscaFiscalProduto.SetCEST(const AValue: string);
begin
  FCEST := AValue;
end;

procedure TBuscaFiscalProduto.SetImagem(const AValue: string);
begin
  FImagem := AValue;
end;

function TBuscaFiscalProduto.GTIN(const AValue: string): IBuscaFiscalProduto;
begin
  Result := Self;
  FGTIN := AValue;
end;

function TBuscaFiscalProduto.Descricao(const AValue: string)
  : IBuscaFiscalProduto;
begin
  Result := Self;
  FDescricao := AValue;
end;

function TBuscaFiscalProduto.NCM(const AValue: string): IBuscaFiscalProduto;
begin
  Result := Self;
  FNCM := AValue;
end;

function TBuscaFiscalProduto.CEST(const AValue: string): IBuscaFiscalProduto;
begin
  Result := Self;
  FCEST := AValue;
end;

function TBuscaFiscalProduto.Imagem(const AValue: string): IBuscaFiscalProduto;
begin
  Result := Self;
  FImagem := AValue;
end;

function TBuscaFiscalProduto.Tributos(const AValue: IBuscaFiscalTributosInfo)
  : IBuscaFiscalProduto;
begin
  Result := Self;
  if Assigned(FTributos) then
    FTributos.Free;
  FTributos := AValue.AsObject as TBuscaFiscalTributosInfo;
end;

{ TBuscaFiscalResponse }

destructor TBuscaFiscalResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to High(FProdutos) do
    FProdutos[I].Free;
  inherited;
end;

class function TBuscaFiscalResponse.New: IBuscaFiscalResponse;
begin
  Result := TBuscaFiscalResponse.Create;
end;

function TBuscaFiscalResponse.GetSuccess: Boolean;
begin
  Result := FSuccess;
end;

function TBuscaFiscalResponse.GetBusca: string;
begin
  Result := FBusca;
end;

function TBuscaFiscalResponse.GetResultados: Integer;
begin
  Result := FResultados;
end;

function TBuscaFiscalResponse.GetMessage: string;
begin
  Result := FMessage;
end;

function TBuscaFiscalResponse.GetProdutos: TArray<IBuscaFiscalProduto>;
var
  I: Integer;
begin
  SetLength(Result, Length(FProdutos));
  for I := 0 to High(FProdutos) do
    Result[I] := FProdutos[I] as IBuscaFiscalProduto;
end;

procedure TBuscaFiscalResponse.SetSuccess(const AValue: Boolean);
begin
  FSuccess := AValue;
end;

procedure TBuscaFiscalResponse.SetBusca(const AValue: string);
begin
  FBusca := AValue;
end;

procedure TBuscaFiscalResponse.SetResultados(const AValue: Integer);
begin
  FResultados := AValue;
end;

procedure TBuscaFiscalResponse.SetMessage(const AValue: string);
begin
  FMessage := AValue;
end;

function TBuscaFiscalResponse.Success(const AValue: Boolean)
  : IBuscaFiscalResponse;
begin
  Result := Self;
  FSuccess := AValue;
end;

function TBuscaFiscalResponse.Busca(const AValue: string): IBuscaFiscalResponse;
begin
  Result := Self;
  FBusca := AValue;
end;

function TBuscaFiscalResponse.Resultados(const AValue: Integer)
  : IBuscaFiscalResponse;
begin
  Result := Self;
  FResultados := AValue;
end;

function TBuscaFiscalResponse.Message(const AValue: string)
  : IBuscaFiscalResponse;
begin
  Result := Self;
  FMessage := AValue;
end;

function TBuscaFiscalResponse.AddProduto(const AValue: IBuscaFiscalProduto)
  : IBuscaFiscalResponse;
begin
  Result := Self;
  SetLength(FProdutos, Length(FProdutos) + 1);
  FProdutos[High(FProdutos)] := AValue.AsObject as TBuscaFiscalProduto;
  Result := Self;
end;

{ TBuscaFiscalImageResponse }

class function TBuscaFiscalImageResponse.New: IBuscaFiscalImageResponse;
begin
  Result := TBuscaFiscalImageResponse.Create;
end;

function TBuscaFiscalImageResponse.GetSuccess: Boolean;
begin
  Result := FSuccess;
end;

function TBuscaFiscalImageResponse.GetGTIN: string;
begin
  Result := FGTIN;
end;

function TBuscaFiscalImageResponse.GetFonte: string;
begin
  Result := FFonte;
end;

function TBuscaFiscalImageResponse.GetFormato: string;
begin
  Result := FFormato;
end;

function TBuscaFiscalImageResponse.GetTamanhoBytes: Int64;
begin
  Result := FTamanhoBytes;
end;

function TBuscaFiscalImageResponse.GetImagem: string;
begin
  Result := FImagem;
end;

function TBuscaFiscalImageResponse.GetMessage: string;
begin
  Result := FMessage;
end;

procedure TBuscaFiscalImageResponse.SetSuccess(const AValue: Boolean);
begin
  FSuccess := AValue;
end;

procedure TBuscaFiscalImageResponse.SetGTIN(const AValue: string);
begin
  FGTIN := AValue;
end;

procedure TBuscaFiscalImageResponse.SetFonte(const AValue: string);
begin
  FFonte := AValue;
end;

procedure TBuscaFiscalImageResponse.SetFormato(const AValue: string);
begin
  FFormato := AValue;
end;

procedure TBuscaFiscalImageResponse.SetTamanhoBytes(const AValue: Int64);
begin
  FTamanhoBytes := AValue;
end;

procedure TBuscaFiscalImageResponse.SetImagem(const AValue: string);
begin
  FImagem := AValue;
end;

procedure TBuscaFiscalImageResponse.SetMessage(const AValue: string);
begin
  FMessage := AValue;
end;

function TBuscaFiscalImageResponse.Success(const AValue: Boolean)
  : IBuscaFiscalImageResponse;
begin
  Result := Self;
  FSuccess := AValue;
end;

function TBuscaFiscalImageResponse.Message(const AValue: string)
  : IBuscaFiscalImageResponse;
begin
  Result := Self;
  FMessage := AValue;
end;

{ TBuscaFiscalBatchItem }

constructor TBuscaFiscalBatchItem.Create;
begin
  inherited;
  FProduto := TBuscaFiscalProduto.Create;
  FTributos := TBuscaFiscalTributo.Create;
end;

destructor TBuscaFiscalBatchItem.Destroy;
begin
  FProduto.Free;
  FTributos.Free;
  inherited;
end;

class function TBuscaFiscalBatchItem.New: IBuscaFiscalBatchItem;
begin
  Result := TBuscaFiscalBatchItem.Create;
end;

function TBuscaFiscalBatchItem.GetProduto: IBuscaFiscalProduto;
begin
  Result := FProduto;
end;

function TBuscaFiscalBatchItem.GetTributos: IBuscaFiscalTributo;
begin
  Result := FTributos;
end;

function TBuscaFiscalBatchItem.Produto(const AValue: IBuscaFiscalProduto)
  : IBuscaFiscalBatchItem;
begin
  Result := Self;
  if Assigned(FProduto) then
    FProduto.Free;
  FProduto := AValue.AsObject as TBuscaFiscalProduto;
end;

function TBuscaFiscalBatchItem.Tributos(const AValue: IBuscaFiscalTributo)
  : IBuscaFiscalBatchItem;
begin
  Result := Self;
  if Assigned(FTributos) then
    FTributos.Free;
  FTributos := AValue.AsObject as TBuscaFiscalTributo;
end;

{ TBuscaFiscalBatchRequest }

destructor TBuscaFiscalBatchRequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to High(FProdutos) do
    FProdutos[I].Free;
  inherited;
end;

class function TBuscaFiscalBatchRequest.New: IBuscaFiscalBatchRequest;
begin
  Result := TBuscaFiscalBatchRequest.Create;
end;

function TBuscaFiscalBatchRequest.GetProdutos: TArray<IBuscaFiscalBatchItem>;
var
  I: Integer;
begin
  SetLength(Result, Length(FProdutos));
  for I := 0 to High(FProdutos) do
    Result[I] := FProdutos[I];
end;

function TBuscaFiscalBatchRequest.AddItem(const AValue: IBuscaFiscalBatchItem)
  : IBuscaFiscalBatchRequest;
begin
  Result := Self;
  SetLength(FProdutos, Length(FProdutos) + 1);
  FProdutos[High(FProdutos)] := AValue.AsObject as TBuscaFiscalBatchItem;
end;

{ TBuscaFiscalBatchResult }

class function TBuscaFiscalBatchResult.New: IBuscaFiscalBatchResult;
begin
  Result := TBuscaFiscalBatchResult.Create;
end;

function TBuscaFiscalBatchResult.GetIndex: Integer;
begin
  Result := FIndex;
end;

function TBuscaFiscalBatchResult.GetGTIN: string;
begin
  Result := FGTIN;
end;

function TBuscaFiscalBatchResult.GetProdutoAtualizado: Boolean;
begin
  Result := FProdutoAtualizado;
end;

function TBuscaFiscalBatchResult.GetTributoAtualizado: Boolean;
begin
  Result := FTributoAtualizado;
end;

function TBuscaFiscalBatchResult.GetImagemSalva: Boolean;
begin
  Result := FImagemSalva;
end;

{ TBuscaFiscalBatchResponse }

destructor TBuscaFiscalBatchResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to High(FResultados) do
    FResultados[I].Free;
  inherited;
end;

class function TBuscaFiscalBatchResponse.New: IBuscaFiscalBatchResponse;
begin
  Result := TBuscaFiscalBatchResponse.Create;
end;

function TBuscaFiscalBatchResponse.GetSuccess: Boolean;
begin
  Result := FSuccess;
end;

function TBuscaFiscalBatchResponse.GetMessage: string;
begin
  Result := FMessage;
end;

function TBuscaFiscalBatchResponse.GetTotalRecebidos: Integer;
begin
  Result := FTotalRecebidos;
end;

function TBuscaFiscalBatchResponse.GetTotalProcessados: Integer;
begin
  Result := FTotalProcessados;
end;

function TBuscaFiscalBatchResponse.GetTotalErros: Integer;
begin
  Result := FTotalErros;
end;

function TBuscaFiscalBatchResponse.GetImagensSalvas: Integer;
begin
  Result := FImagensSalvas;
end;

function TBuscaFiscalBatchResponse.GetErros: TArray<string>;
begin
  Result := FErros;
end;

function TBuscaFiscalBatchResponse.GetResultados
  : TArray<IBuscaFiscalBatchResult>;
var
  I: Integer;
begin
  SetLength(Result, Length(FResultados));
  for I := 0 to High(FResultados) do
    Result[I] := FResultados[I] as IBuscaFiscalBatchResult;
end;

procedure TBuscaFiscalBatchResponse.SetSuccess(const AValue: Boolean);
begin
  FSuccess := AValue;
end;

procedure TBuscaFiscalBatchResponse.SetMessage(const AValue: string);
begin
  FMessage := AValue;
end;

function TBuscaFiscalBatchResponse.Success(const AValue: Boolean)
  : IBuscaFiscalBatchResponse;
begin
  Result := Self;
  FSuccess := AValue;
end;

function TBuscaFiscalBatchResponse.Message(const AValue: string)
  : IBuscaFiscalBatchResponse;
begin
  Result := Self;
  FMessage := AValue;
end;

end.
