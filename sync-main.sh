#!/usr/bin/env bash
# Atualiza o main local e o main do fork com o repositório original (upstream).
# Só avança (fast-forward): se falhar, o main local tem commits que não deveria ter.
set -euo pipefail
cd "$(dirname "$0")"

origem="$(git branch --show-current)"

git fetch upstream
git switch main
git merge --ff-only upstream/main
git push origin main

# Volta para o branch em que você estava.
if [ -n "$origem" ] && [ "$origem" != "main" ]; then
  git switch "$origem"
fi
