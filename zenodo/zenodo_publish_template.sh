#!/usr/bin/env bash
set -euo pipefail

# Uso seguro:
# 1) Exportar token localmente, sem escrever no ficheiro:
#    export ZENODO_TOKEN='COLOCAR_TOKEN_AQUI_NO_TERMINAL_LOCAL'
# 2) Executar:
#    bash zenodo/zenodo_publish_template.sh

: "${ZENODO_TOKEN:?Defina ZENODO_TOKEN como variável de ambiente antes de executar.}"

BASE_URL="https://zenodo.org/api"

curl -sS -X POST "${BASE_URL}/deposit/depositions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${ZENODO_TOKEN}" \
  -d '{}'

# Este template cria apenas um draft vazio. Antes de publicar:
# - anexar ficheiros finais;
# - preencher metadados;
# - validar direitos/licenças;
# - confirmar que não há dados pessoais ou material reservado.
