# API de Integração — Busca Fiscal

Documentação dos endpoints de consulta e atualização de tributos e imagens de produtos.

## Visão geral

A API permite:

- consultar tributos por **GTIN/EAN**
- pesquisar tributos por **descrição**
- atualizar cadastro de produtos e tributos em lote
- obter a **imagem** do produto em Base64 JPEG

## Autenticação

Todos os endpoints exigem o envio do token no header:

```http
x-access-token: SEU_TOKEN
```

---

# 1. Tributos por GTIN

Consulta tributos de um produto específico pelo código de barras (GTIN/EAN).

**Método:** `GET`  
**Rota:** `/api/integracao/tributos/gtin/:gtin`

**Exemplo:**

```http
/api/integracao/tributos/gtin/7894900010015
```

## Parâmetros

| Nome | Tipo | Onde | Descrição |
|------|------|------|-----------|
| `gtin` | string | path | Código de barras do produto (GTIN/EAN) |
| `x-access-token` | string | header | Token de autenticação |

## Exemplo cURL

```bash
curl -X GET   "https://portalapi.buscafiscal.com.br/api/integracao/tributos/gtin/7894900010015"   -H "x-access-token: SEU_TOKEN"
```

## Exemplo JavaScript

```javascript
const response = await fetch(
  'https://portalapi.buscafiscal.com.br/api/integracao/tributos/gtin/7894900010015',
  {
    method: 'GET',
    headers: { 'x-access-token': 'SEU_TOKEN' }
  }
);

const data = await response.json();
const produto = data.produtos[0];
console.log(produto.descricao);

// Verificar quais UFs têm tributos
console.log('UFs disponíveis:', produto.tributos.ufs);

// Filtrar tributo de SP
const tributoSP = produto.tributos.lista.find(t => t.uf === 'SP');
if (tributoSP) {
  console.log('CFOP SP:', tributoSP.cfop);
}

// Exibir imagem
const img = document.createElement('img');
img.src = produto.imagem;
document.body.appendChild(img);
```

## Resposta de exemplo

```json
{
  "success": true,
  "busca": "7894900010015",
  "resultados": 1,
  "produtos": [
    {
      "gtin": "7894900010015",
      "descricao": "COCA COLA LATA 350ML",
      "ncm": "22021000",
      "cest": "0301002",
      "imagem": "data:image/jpeg;base64,/9j/4AAQSkZJRg...",
      "tributos": {
        "total": 27,
        "ufs": ["AC", "AL", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"],
        "lista": [
          {
            "uf": "SP",
            "cstIcms": "060",
            "aliqIcms": 0,
            "cstPis": "06",
            "aliqPis": 0,
            "cstCofins": "06",
            "aliqCofins": 0,
            "cfop": "5405",
            "mva": 0,
            "classeTributaria": null,
            "codigoBeneficio": null
          },
          {
            "uf": "MG",
            "cstIcms": "060",
            "aliqIcms": 0
          }
        ]
      }
    }
  ]
}
```

## Códigos de erro

| Código | Descrição |
|--------|-----------|
| `200` | Sucesso |
| `400` | Parâmetros inválidos |
| `401` | Token inválido ou expirado |
| `404` | Recurso não encontrado |
| `429` | Limite de requisições |
| `500` | Erro interno do servidor |

> **Dica:** todas as respostas de erro incluem o campo `message` com detalhes do erro.  
> A imagem sempre é retornada no formato **Base64 JPEG**, pronta para uso em tags `<img src="...">`.

---

# 2. Tributos por Descrição

Busca produtos por descrição e retorna os tributos de cada item encontrado.

**Método:** `GET`  
**Rota:** `/api/integracao/tributos/busca`

**Exemplo:**

```http
/api/integracao/tributos/busca?descricao=coca%20cola&limite=10
```

## Parâmetros

| Nome | Tipo | Onde | Descrição |
|------|------|------|-----------|
| `descricao` | string | query | Termo de busca (mínimo 3 caracteres) |
| `limite` | number | query | Máximo de resultados (padrão: 10, máximo: 50) |
| `x-access-token` | string | header | Token de autenticação |

## Exemplo cURL

```bash
curl -X GET   "https://portalapi.buscafiscal.com.br/api/integracao/tributos/busca?descricao=coca%20cola&limite=10"   -H "x-access-token: SEU_TOKEN"
```

## Exemplo JavaScript

```javascript
const descricao = encodeURIComponent('coca cola');
const response = await fetch(
  `https://portalapi.buscafiscal.com.br/api/integracao/tributos/busca?descricao=${descricao}&limite=10`,
  {
    method: 'GET',
    headers: { 'x-access-token': 'SEU_TOKEN' }
  }
);

const data = await response.json();

// Iterar produtos
data.produtos.forEach(produto => {
  console.log(produto.descricao, produto.tributos.total + ' tributos');

  // Verificar UFs disponíveis
  console.log('UFs:', produto.tributos.ufs);

  // Filtrar por UF específica
  const tributoSP = produto.tributos.lista.find(t => t.uf === 'SP');
  if (tributoSP) {
    console.log('CFOP SP:', tributoSP.cfop);
  }
});
```

## Resposta de exemplo

```json
{
  "success": true,
  "busca": "coca cola",
  "resultados": 3,
  "produtos": [
    {
      "gtin": "7894900010015",
      "descricao": "COCA COLA LATA 350ML",
      "ncm": "22021000",
      "cest": "0301002",
      "imagem": "data:image/jpeg;base64,/9j/4AAQSkZJRg...",
      "tributos": {
        "total": 27,
        "ufs": ["AC", "AL", "SP"],
        "lista": [
          { "uf": "SP", "cstIcms": "060", "aliqIcms": 0, "cfop": "5405" },
          { "uf": "MG", "cstIcms": "060", "aliqIcms": 0, "cfop": "5405" }
        ]
      }
    },
    {
      "gtin": "7894900011012",
      "descricao": "COCA COLA PET 2L",
      "ncm": "22021000",
      "imagem": "data:image/jpeg;base64,...",
      "tributos": { "total": 27, "ufs": [], "lista": [] }
    }
  ]
}
```

## Códigos de erro

| Código | Descrição |
|--------|-----------|
| `200` | Sucesso |
| `400` | Parâmetros inválidos |
| `401` | Token inválido ou expirado |
| `404` | Recurso não encontrado |
| `429` | Limite de requisições |
| `500` | Erro interno do servidor |

> **Dica:** todas as respostas de erro incluem o campo `message` com detalhes do erro.  
> A imagem sempre é retornada no formato **Base64 JPEG**, pronta para uso em tags `<img src="...">`.

---

# 3. Atualizar Cadastro

Envia produtos e tributos em lote para cadastrar ou atualizar a base via JSON.

**Método:** `POST`  
**Rota:** `/api/integracao/cadastro/atualizar`

## Parâmetros

| Nome | Tipo | Onde | Descrição |
|------|------|------|-----------|
| `x-access-token` | string | header | Token de autenticação ativo |
| `Content-Type` | string | header | `application/json` |
| `produtos` | array | body | Array de itens com produto e tributos |

## Exemplo cURL

```bash
curl -X POST   "https://portalapi.buscafiscal.com.br/api/integracao/cadastro/atualizar"   -H "Content-Type: application/json"   -H "x-access-token: SEU_TOKEN"   -d '{
    "produtos": [
      {
        "produto": {
          "GTIN": "7891234567890",
          "DESCRICAO": "REFRIGERANTE COLA 2L",
          "NCM": 22021000,
          "CUSTO": 5.50,
          "MARCA": "COCA-COLA",
          "CATEGORIA": "BEBIDAS",
          "IMAGEM_BASE64": "data:image/jpeg;base64,/9j/4AAQSkZJRg...",
          "CEST": "0301100",
          "CRT": "3"
        },
        "tributos": {
          "CSTICMS": "000",
          "CSTPIS": "01",
          "CSTCOFINS": "01",
          "CSTIPI": "50",
          "ALIQICMS": 18.0,
          "ALIQPIS": 1.65,
          "ALIQCOFINS": 7.60,
          "ALIQIPI": 0.0,
          "CFOP": 5102,
          "UF": "SP",
          "GTIN": "7891234567890",
          "CUSTO": 5.50,
          "MVA": 0.0,
          "CCLASSTRIB": "123456",
          "CBENEF": ""
        }
      }
    ]
  }'
```

## Exemplo JavaScript

```javascript
const payload = {
  produtos: [
    {
      produto: {
        GTIN: '7891234567890',
        DESCRICAO: 'REFRIGERANTE COLA 2L',
        NCM: 22021000,
        CUSTO: 5.50,
        MARCA: 'COCA-COLA',
        CATEGORIA: 'BEBIDAS',
        IMAGEM_BASE64: 'data:image/jpeg;base64,/9j/4AAQSkZJRg...',
        CEST: '0301100',
        CRT: '3'
      },
      tributos: {
        CSTICMS: '000',
        CSTPIS: '01',
        CSTCOFINS: '01',
        CSTIPI: '50',
        ALIQICMS: 18.0,
        ALIQPIS: 1.65,
        ALIQCOFINS: 7.60,
        ALIQIPI: 0.0,
        CFOP: 5102,
        UF: 'SP',
        GTIN: '7891234567890',
        CUSTO: 5.50,
        MVA: 0.0,
        CCLASSTRIB: '123456',
        CBENEF: ''
      }
    }
  ]
};

const response = await fetch(
  'https://portalapi.buscafiscal.com.br/api/integracao/cadastro/atualizar',
  {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-access-token': 'SEU_TOKEN'
    },
    body: JSON.stringify(payload)
  }
);

const data = await response.json();
console.log(data.totalProcessados, data.erros);
```

## Resposta de exemplo

```json
{
  "success": true,
  "message": "Cadastro atualizado com sucesso.",
  "totalRecebidos": 2,
  "totalProcessados": 2,
  "totalErros": 0,
  "imagensSalvas": 2,
  "resultados": [
    {
      "index": 0,
      "gtin": "7891234567890",
      "produtoAtualizado": true,
      "tributoAtualizado": true,
      "imagemSalva": true
    }
  ],
  "erros": []
}
```

## Códigos de erro

| Código | Descrição |
|--------|-----------|
| `200` | Sucesso |
| `400` | Parâmetros inválidos |
| `401` | Token inválido ou expirado |
| `404` | Recurso não encontrado |
| `429` | Limite de requisições |
| `500` | Erro interno do servidor |

> **Dica:** todas as respostas de erro incluem o campo `message` com detalhes do erro.  
> A imagem sempre é retornada no formato **Base64 JPEG**, pronta para uso em tags `<img src="...">`.

---

# 4. Download de Imagem

Retorna a imagem do produto em formato Base64 (JPEG).

**Método:** `GET`  
**Rota:** `/api/integracao/imagem/:gtin`

**Exemplo:**

```http
/api/integracao/imagem/7894900010015
```

## Parâmetros

| Nome | Tipo | Onde | Descrição |
|------|------|------|-----------|
| `gtin` | string | path | Código de barras do produto (GTIN/EAN) |
| `x-access-token` | string | header | Token de autenticação |

## Exemplo cURL

```bash
curl -X GET   "https://portalapi.buscafiscal.com.br/api/integracao/imagem/7894900010015"   -H "x-access-token: SEU_TOKEN"
```

## Exemplo JavaScript

```javascript
const response = await fetch(
  'https://portalapi.buscafiscal.com.br/api/integracao/imagem/7894900010015',
  {
    method: 'GET',
    headers: { 'x-access-token': 'SEU_TOKEN' }
  }
);

const data = await response.json();

if (data.success) {
  // Usar diretamente no src de uma imagem
  const img = document.createElement('img');
  img.src = data.imagem;
  document.body.appendChild(img);

  // Ou fazer download
  const link = document.createElement('a');
  link.href = data.imagem;
  link.download = data.gtin + '.jpg';
  link.click();
}
```

## Resposta de exemplo

```json
{
  "success": true,
  "gtin": "7894900010015",
  "fonte": "cache_local",
  "formato": "jpeg",
  "tamanhoBytes": 45230,
  "imagem": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD..."
}
```

## Códigos de erro

| Código | Descrição |
|--------|-----------|
| `200` | Sucesso |
| `400` | Parâmetros inválidos |
| `401` | Token inválido ou expirado |
| `404` | Recurso não encontrado |
| `429` | Limite de requisições |
| `500` | Erro interno do servidor |

> **Dica:** todas as respostas de erro incluem o campo `message` com detalhes do erro.  
> A imagem sempre é retornada no formato **Base64 JPEG**, pronta para uso em tags `<img src="...">`.
