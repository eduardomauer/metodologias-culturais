# Estrutura pública recomendada de repositório

## Repositório público

```text
atlas-vivo-milk-public/
├── README.md
├── LICENSE
├── openapi/
│   └── openapi_atlas_milk_public.yaml
├── schemas/
│   ├── points.schema.json
│   ├── bootstrap.schema.json
│   └── licence-item.schema.json
├── docs/
│   ├── official-sources.md
│   ├── accessibility.md
│   ├── rgpd-public-layer.md
│   └── data-reuse-policy.md
├── public/
│   ├── index.html
│   ├── assets/
│   └── data/
└── tests/
    ├── validate-openapi.md
    ├── validate-geojson.md
    └── privacy-public-layer.md
```

## Regra de separação

O repositório público deve conter apenas documentação, código e dados autorizados para publicação. Qualquer material com restrições de autoria, licença, protecção de dados, direitos de imagem ou validação jurídica deve permanecer fora da camada pública até existir decisão formal.
