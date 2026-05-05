# Busca Fiscal - Integração Delphi

![Delphi Support](https://img.shields.io/badge/Delphi-10.4%20%2B-blue.svg)
![Framework](https://img.shields.io/badge/Framework-VCL%20%2F%20FMX-orange.svg)
![Dependency](https://img.shields.io/badge/Dependency-RESTRequest4Delphi-green.svg)

Biblioteca de alta performance para integração com a API de consulta tributária Busca Fiscal. Este componente foi projetado utilizando padrões modernos de desenvolvimento, incluindo arquitetura baseada em interfaces e padrões de fluência.

---

## Características Técnicas

- **Gerenciamento de Memória:** Implementação baseada em interfaces (RefCounting), eliminando a necessidade de liberações manuais (`.Free`).
- **Interface Fluente:** Sintaxe encadeada que otimiza a legibilidade e manutenção do código.
- **Componente Visual:** Suporte para instalação na paleta da IDE, permitindo configuração via Object Inspector.
- **Documentação XML:** Comentários técnicos integrados para suporte completo ao IntelliSense em português.
- **Arquitetura Multi-Framework:** Compatibilidade total com VCL e FireMonkey.
- **Parametrização de Endpoint:** Configuração flexível da URL base para suporte a diferentes ambientes.

---

## Pré-requisitos

Para a utilização desta biblioteca, é necessário:
* **Embarcadero Delphi 10.4 Sydney** ou versão superior.
* **Boss** (Gerenciador de dependências): [Repositório Oficial](https://github.com/HashLoad/boss)

---

## Instruções de Instalação

### Instalação via Boss (Recomendado)
Para instalar as dependências automaticamente, execute o comando abaixo na raiz do projeto:
```bash
boss install
```

### 1. Configuração do Library Path
1. No Delphi, acesse **Tools > Options**.
2. Navegue até **Language > Delphi > Library**.
3. Selecione a plataforma de destino (ex: Windows 32-bit ou 64-bit).
4. Adicione o caminho do diretório `src` e o diretório `modules` (gerado pelo Boss) ao campo **Library Path**.

### 2. Instalação do Pacote na IDE
1. Abra o grupo de projetos `BuscaFiscalGroup.groupproj` localizado na raiz do repositório.
2. No Gerenciador de Projetos (*Project Manager*), localize o projeto `BuscaFiscal.bpl`.
3. Clique com o botão direito e selecione **Compile**, e depois **Install**.
4. O componente `TBuscaFiscal` será disponibilizado na categoria **Busca Fiscal** da paleta de componentes.

---

## Exemplos de Implementação

### Consulta de Tributos via GTIN
```pascal
uses BuscaFiscal.Model, BuscaFiscal.Client;

procedure ConsultarProduto;
var
  LResponse: IBuscaFiscalResponse;
begin
  LResponse := TBuscaFiscalClient.New
    .Token('SEU_TOKEN_AQUI')
    .GetTributosByGTIN('7891234567890');

  if LResponse.Success then
    Writeln('Produto: ' + LResponse.Produtos[0].Descricao)
  else
    Writeln('Erro: ' + LResponse.ErrorMessage);
end;
```

### Consulta de Produtos via NCM
```pascal
LResponse := TBuscaFiscalClient.New
  .Token('SEU_TOKEN_AQUI')
  .GetProdutosByNCM('12345678');
```

### Processamento em Lote (Batch)
```pascal
var
  LBatch: IBuscaFiscalBatch;
begin
  LBatch := TBuscaFiscalBatch.New
    .AddGTIN('7891234567890')
    .AddGTIN('7890000000001');

  LResponse := TBuscaFiscalClient.New
    .Token('SEU_TOKEN_AQUI')
    .GetBatchTributos(LBatch);
end;
```

---

## Utilização do Componente Visual

1. Insira o componente `TBuscaFiscal` em seu formulário ou DataModule.
2. Configure a propriedade `Token` no Object Inspector.
3. Se necessário, ajuste a propriedade `BaseURL`.
4. Execute as chamadas utilizando os métodos do componente, por exemplo: `BuscaFiscal1.GetTributosByGTIN('...');`

---

## Estrutura do Repositório

- `src/`: Arquivos de código-fonte (.pas).
- `packages/`: Arquivos de projeto de pacotes para instalação.
- `examples/`: Demonstrações e casos de uso.
- `documentacao_buscafiscal.md`: Referência técnica da API original.

---

## Créditos

A API **Busca Fiscal** foi desenvolvida por **Tiago Passarela ([DT Componentes](https://github.com/tiagopassarela))**. Este componente Delphi é uma biblioteca de integração independente para facilitar o consumo desses serviços.

---

## Termos de Uso e Licença

Esta biblioteca é software livre, licenciada sob a **GNU Lesser General Public License v3.0 (LGPL v3)**. Você pode utilizá-la em softwares proprietários, mas qualquer modificação ou melhoria feita no código-fonte desta biblioteca deve ser compartilhada sob a mesma licença.

Para mais detalhes, consulte os arquivos `LICENSE` e `LICENSE.lesser` na raiz do repositório.
