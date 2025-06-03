#!/usr/bin/env bash
# git-helper.sh — script simples para realizar git clone, commit, commit e push, e pull com confirmações

set -e

# Função para solicitar confirmação s/n. Retorna 0 para sim, 1 para não.
confirm() {
  local prompt_msg="$1"
  while true; do
    read -rp "$prompt_msg [s/n]: " sn
    case $sn in
      [Ss]*) return 0 ;;
      [Nn]*) return 1 ;;
      *) echo "Por favor, responda s ou n." ;;
    esac
  done
}

# Clonar um repositório
do_clone() {
  read -rp "Digite a URL do repositório Git para clonar: " repo_url
  if [[ -z "$repo_url" ]]; then
    echo "Nenhuma URL informada. Abortando o clone."
    return
  fi

  if confirm "Prestes a executar: git clone \"$repo_url\". Deseja continuar?"; then
    git clone "$repo_url"
    echo "Clone concluído."
  else
    echo "Clone cancelado."
  fi
}

# Fazer commit das alterações (git add . && git commit -m "")
do_commit() {
  # Verifica se o diretório atual é um repositório Git
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Não é um repositório Git. Execute dentro de um repositório Git."
    return
  fi

  read -rp "Digite a mensagem de commit: " commit_msg
  if [[ -z "$commit_msg" ]]; then
    echo "Mensagem de commit vazia. Abortando o commit."
    return
  fi

  if confirm "Prestes a executar: git add . && git commit -m \"$commit_msg\". Deseja continuar?"; then
    git add .
    git commit -m "$commit_msg"
    echo "Commit concluído."
  else
    echo "Commit cancelado."
  fi
}

# Fazer commit e push das alterações (git add . && git commit -m "" && git push)
do_commit_and_push() {
  # Verifica se o diretório atual é um repositório Git
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Não é um repositório Git. Execute dentro de um repositório Git."
    return
  fi

  read -rp "Digite a mensagem de commit: " commit_msg
  if [[ -z "$commit_msg" ]]; then
    echo "Mensagem de commit vazia. Abortando commit e push."
    return
  fi

  # Obtém o nome da branch atual para o push
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  if confirm "Prestes a executar: git add . && git commit -m \"$commit_msg\" && git push origin \"$current_branch\". Deseja continuar?"; then
    git add .
    git commit -m "$commit_msg"
    git push origin "$current_branch"
    echo "Commit e push concluídos."
  else
    echo "Commit e push cancelados."
  fi
}

# Fazer pull das alterações (git pull)
do_pull() {
  # Verifica se o diretório atual é um repositório Git
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Não é um repositório Git. Execute dentro de um repositório Git."
    return
  fi

  if confirm "Prestes a executar: git pull. Deseja continuar?"; then
    git pull
    echo "Pull concluído."
  else
    echo "Pull cancelado."
  fi
}

# Loop principal do menu
while true; do
  echo
  echo "Selecione uma opção:"
  echo "  1) Clonar um repositório"
  echo "  2) Fazer commit das alterações"
  echo "  3) Fazer commit e push das alterações"
  echo "  4) Fazer pull das alterações"
  echo "  5) Sair"
  read -rp "Digite sua escolha [1-5]: " choice

  case "$choice" in
    1) do_clone ;;
    2) do_commit ;;
    3) do_commit_and_push ;;
    4) do_pull ;;
    5) echo "Tchau!"; exit 0 ;;
    *) echo "Opção inválida. Digite um número entre 1 e 5." ;;
  esac
done
