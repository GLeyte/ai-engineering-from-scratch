#!/usr/bin/env bash
# Traz o main local para o branch de estudo e publica no fork.
# Uso: ./sync-branch.sh [branch]   (padrão: my-progress)
# Rode ./sync-main.sh antes, para o main estar atualizado.
set -euo pipefail
cd "$(dirname "$0")"

branch="${1:-my-progress}"

git switch "$branch"
git merge main
git push
