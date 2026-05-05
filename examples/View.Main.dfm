object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Busca Fiscal'
  ClientHeight = 720
  ClientWidth = 1080
  Color = clWhitesmoke
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 4210752
  Font.Height = -13
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  Font.Quality = fqClearTypeNatural
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object pnlSidebar: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 720
    Align = alLeft
    BevelOuter = bvNone
    Color = 2104085
    ParentBackground = False
    TabOrder = 0
    object pnlSidebarTitle: TPanel
      Left = 0
      Top = 0
      Width = 260
      Height = 70
      Align = alTop
      BevelOuter = bvNone
      Color = 2960685
      ParentBackground = False
      TabOrder = 2
      object lblSidebarTitle: TLabel
        Left = 30
        Top = 30
        Width = 106
        Height = 21
        Caption = 'Configura'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Font.Quality = fqClearTypeNatural
        ParentFont = False
      end
    end
    object pnlConfig: TPanel
      Left = 0
      Top = 70
      Width = 260
      Height = 180
      Align = alTop
      BevelOuter = bvNone
      Color = 2960685
      ParentBackground = False
      TabOrder = 0
      object lblToken: TLabel
        Left = 30
        Top = 10
        Width = 36
        Height = 17
        Caption = 'Token'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
      end
      object lblBaseURL: TLabel
        Left = 30
        Top = 85
        Width = 55
        Height = 17
        Caption = 'URL Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
      end
      object edtToken: TEdit
        Left = 30
        Top = 35
        Width = 220
        Height = 25
        BorderStyle = bsNone
        Color = 3815994
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 0
      end
      object edtBaseURL: TEdit
        Left = 30
        Top = 110
        Width = 220
        Height = 25
        BorderStyle = bsNone
        Color = 3815994
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 1
        Text = 'https://portalapi.buscafiscal.com.br'
      end
    end
    object pnlMenu: TPanel
      Left = 0
      Top = 250
      Width = 260
      Height = 250
      Align = alTop
      BevelOuter = bvNone
      Color = 2960685
      ParentBackground = False
      TabOrder = 3
      object pnlMenuGTIN: TPanel
        Left = 0
        Top = 0
        Width = 260
        Height = 45
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '      Busca GTIN'
        Color = 2104085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = NavButtonClick
        OnMouseEnter = NavButtonMouseEnter
        OnMouseLeave = NavButtonMouseLeave
        object pnlIndGTIN: TPanel
          Left = 0
          Top = 0
          Width = 4
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          Color = 13225472
          ParentBackground = False
          TabOrder = 0
          Visible = False
        end
      end
      object pnlMenuSearch: TPanel
        Tag = 1
        Left = 0
        Top = 45
        Width = 260
        Height = 45
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '      Pesquisar Descri'#231#227'o'
        Color = 2104085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = NavButtonClick
        OnMouseEnter = NavButtonMouseEnter
        OnMouseLeave = NavButtonMouseLeave
        object pnlIndSearch: TPanel
          Left = 0
          Top = 0
          Width = 4
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          Color = 13225472
          ParentBackground = False
          TabOrder = 0
          Visible = False
        end
      end
      object pnlMenuImage: TPanel
        Tag = 2
        Left = 0
        Top = 90
        Width = 260
        Height = 45
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '      Buscar Imagem'
        Color = 2104085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = NavButtonClick
        OnMouseEnter = NavButtonMouseEnter
        OnMouseLeave = NavButtonMouseLeave
        object pnlIndImage: TPanel
          Left = 0
          Top = 0
          Width = 4
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          Color = 13225472
          ParentBackground = False
          TabOrder = 0
          Visible = False
        end
      end
      object pnlMenuBatch: TPanel
        Tag = 3
        Left = 0
        Top = 135
        Width = 260
        Height = 45
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '      Batch Update'
        Color = 2104085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnClick = NavButtonClick
        OnMouseEnter = NavButtonMouseEnter
        OnMouseLeave = NavButtonMouseLeave
        object pnlIndBatch: TPanel
          Left = 0
          Top = 0
          Width = 4
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          Color = 13225472
          ParentBackground = False
          TabOrder = 0
          Visible = False
        end
      end
    end
    object pnlLog: TPanel
      Left = 0
      Top = 500
      Width = 260
      Height = 220
      Align = alClient
      BevelOuter = bvNone
      Color = 2960685
      Padding.Left = 20
      Padding.Top = 10
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 1
      object lblLog: TLabel
        Left = 20
        Top = 10
        Width = 23
        Height = 15
        Caption = 'LOG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDarkgray
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Font.Quality = fqClearTypeNatural
        ParentFont = False
      end
      object mmoLog: TMemo
        Left = 20
        Top = 10
        Width = 220
        Height = 190
        Align = alClient
        BorderStyle = bsNone
        Color = 3815994
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14277081
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object pnlMain: TPanel
    Left = 260
    Top = 0
    Width = 820
    Height = 720
    Align = alClient
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 820
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblTitle: TLabel
        Left = 30
        Top = 32
        Width = 114
        Height = 30
        Caption = 'Busca Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15102558
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        Font.Quality = fqClearTypeNatural
        ParentFont = False
      end
      object pnlHeaderLine: TPanel
        Left = 0
        Top = 89
        Width = 820
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = 14277081
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pgcTests: TPageControl
      Left = 0
      Top = 90
      Width = 820
      Height = 310
      ActivePage = tsSearch
      Align = alTop
      MultiLine = True
      TabOrder = 1
      object tsGTIN: TTabSheet
        Caption = 'Busca GTIN'
        TabVisible = False
        object pnlGTIN: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 300
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          Padding.Left = 40
          Padding.Top = 40
          Padding.Right = 40
          Padding.Bottom = 40
          ParentBackground = False
          TabOrder = 0
          object lblGTIN: TLabel
            Left = 40
            Top = 40
            Width = 147
            Height = 17
            Caption = 'GTIN / C'#243'digo de Barras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object lblGTINHint: TLabel
            Left = 40
            Top = 115
            Width = 256
            Height = 15
            Caption = 'Insira o c'#243'digo EAN/GTIN para busca detalhada.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Height = -12
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object pnlInputGTIN: TPanel
            Left = 40
            Top = 65
            Width = 300
            Height = 40
            BevelOuter = bvNone
            Color = clWhitesmoke
            ParentBackground = False
            TabOrder = 0
            object edtGTIN: TEdit
              Left = 10
              Top = 8
              Width = 280
              Height = 25
              BorderStyle = bsNone
              Color = clWhitesmoke
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2960685
              Font.Height = -16
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              TabOrder = 0
              Text = '7894900010015'
            end
          end
          object pnlBtnGetTributos: TPanel
            Left = 360
            Top = 65
            Width = 160
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Consultar'
            Color = 15102558
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            Font.Quality = fqClearTypeNatural
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            OnClick = btnGetTributosClick
            OnMouseEnter = NavButtonMouseEnter
            OnMouseLeave = NavButtonMouseLeave
          end
        end
      end
      object tsSearch: TTabSheet
        Caption = 'Pesquisa Descri'#231#227'o'
        ImageIndex = 1
        TabVisible = False
        object pnlSearch: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 300
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          Padding.Left = 40
          Padding.Top = 40
          Padding.Right = 40
          Padding.Bottom = 40
          ParentBackground = False
          TabOrder = 0
          object lblSearch: TLabel
            Left = 40
            Top = 40
            Width = 57
            Height = 17
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object lblLimit: TLabel
            Left = 320
            Top = 40
            Width = 36
            Height = 17
            Caption = 'Limite'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object pnlInputSearch: TPanel
            Left = 40
            Top = 65
            Width = 260
            Height = 40
            BevelOuter = bvNone
            Color = clWhitesmoke
            ParentBackground = False
            TabOrder = 0
            object edtSearch: TEdit
              Left = 10
              Top = 8
              Width = 240
              Height = 25
              BorderStyle = bsNone
              Color = clWhitesmoke
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2960685
              Font.Height = -16
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              TabOrder = 0
              Text = 'Coca Cola'
            end
          end
          object pnlInputLimit: TPanel
            Left = 320
            Top = 65
            Width = 60
            Height = 40
            BevelOuter = bvNone
            Color = clWhitesmoke
            ParentBackground = False
            TabOrder = 1
            object edtLimit: TEdit
              Left = 10
              Top = 8
              Width = 40
              Height = 25
              BorderStyle = bsNone
              Color = clWhitesmoke
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2960685
              Font.Height = -16
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              TabOrder = 0
              Text = '10'
            end
          end
          object pnlBtnExecuteSearch: TPanel
            Left = 400
            Top = 65
            Width = 160
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Pesquisar'
            Color = 15102558
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            Font.Quality = fqClearTypeNatural
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            OnClick = btnSearchClick
            OnMouseEnter = ActionButtonMouseEnter
            OnMouseLeave = ActionButtonMouseLeave
          end
        end
      end
      object tsImage: TTabSheet
        Caption = 'Imagem'
        ImageIndex = 2
        TabVisible = False
        object pnlImage: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 300
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          Padding.Left = 40
          Padding.Top = 40
          Padding.Right = 40
          Padding.Bottom = 40
          ParentBackground = False
          TabOrder = 0
          object lblImageGTIN: TLabel
            Left = 40
            Top = 40
            Width = 30
            Height = 17
            Caption = 'GTIN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object lblImageHint: TLabel
            Left = 40
            Top = 115
            Width = 323
            Height = 15
            Caption = 'A imagem ser'#225' exibida permanentemente no painel abaixo.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Height = -12
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsItalic]
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object pnlInputImageGTIN: TPanel
            Left = 40
            Top = 65
            Width = 260
            Height = 40
            BevelOuter = bvNone
            Color = clWhitesmoke
            ParentBackground = False
            TabOrder = 0
            object edtImageGTIN: TEdit
              Left = 10
              Top = 8
              Width = 240
              Height = 25
              BorderStyle = bsNone
              Color = clWhitesmoke
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 2960685
              Font.Height = -16
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentFont = False
              TabOrder = 0
              Text = '7894900010015'
            end
          end
          object pnlBtnGetImage: TPanel
            Left = 320
            Top = 65
            Width = 160
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Buscar Imagem'
            Color = 15102558
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            Font.Quality = fqClearTypeNatural
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            OnClick = btnGetImageClick
            OnMouseEnter = NavButtonMouseEnter
            OnMouseLeave = NavButtonMouseLeave
          end
        end
      end
      object tsBatch: TTabSheet
        Caption = 'Batch Update'
        ImageIndex = 3
        TabVisible = False
        object pnlBatch: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 90
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          Padding.Left = 40
          Padding.Top = 20
          Padding.Right = 40
          Padding.Bottom = 20
          ParentBackground = False
          TabOrder = 0
          object pnlBtnTestBatch: TPanel
            Left = 40
            Top = 25
            Width = 220
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Testar Batch (Popula Grid)'
            Color = 13225472
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            Font.Quality = fqClearTypeNatural
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = btnTestBatchClick
            OnMouseEnter = NavButtonMouseEnter
            OnMouseLeave = NavButtonMouseLeave
          end
        end
        object dbgBatch: TDBGrid
          Left = 0
          Top = 90
          Width = 812
          Height = 210
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsBatch
          Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 4210752
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = []
          TitleFont.Quality = fqClearTypeNatural
          Columns = <
            item
              Expanded = False
              FieldName = 'GTIN'
              Title.Caption = 'GTIN / EAN'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AliqIcms'
              Title.Caption = 'Aliq. ICMS'
              Width = 80
              Visible = True
            end>
        end
      end
    end
    object pnlResult: TPanel
      Left = 0
      Top = 400
      Width = 820
      Height = 320
      Align = alClient
      BevelOuter = bvNone
      Color = clWhitesmoke
      Padding.Left = 20
      Padding.Top = 15
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 2
      object pnlResultData: TPanel
        Left = 20
        Top = 15
        Width = 480
        Height = 285
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object lblResultTitle: TLabel
          Left = 0
          Top = 0
          Width = 124
          Height = 13
          Caption = 'DETALHES DO PRODUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          ParentFont = False
        end
        object mmoResult: TMemo
          Left = 0
          Top = 0
          Width = 480
          Height = 285
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210752
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object pnlResultImage: TPanel
        Left = 500
        Top = 15
        Width = 300
        Height = 285
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object imgProduto: TImage
          Left = 10
          Top = 10
          Width = 200
          Height = 200
          Center = True
          Proportional = True
          Stretch = True
        end
        object lblImageInfo: TLabel
          Left = 0
          Top = 272
          Width = 123
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = 'Visualiza'#231#227'o do Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDarkgray
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentFont = False
        end
      end
    end
  end
  object BuscaFiscal: TBuscaFiscal
    BaseURL = 'https://portalapi.buscafiscal.com.br'
    Left = 40
    Top = 320
  end
  object cdsBatch: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 320
  end
  object dsBatch: TDataSource
    DataSet = cdsBatch
    Left = 184
    Top = 320
  end
end
