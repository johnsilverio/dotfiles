#!/usr/bin/env bash
# dotfiles installer
# Symlinks fish/tmux/kitty into ~/.config, clones the Neovim config from its own
# repo, and bootstraps the tmux plugin manager. Idempotent and non-destructive:
# anything it would overwrite is moved into a timestamped backup first.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
NVIM_REPO="https://github.com/johnsilverio/nvim.git"

link() {
  local src="$1" dest="$2"
  if [ -L "$dest" ]; then
    [ "$(readlink "$dest")" = "$src" ] && { echo "ok    $dest already linked"; return; }
    rm "$dest"
  elif [ -e "$dest" ]; then
    mkdir -p "$BACKUP"
    mv "$dest" "$BACKUP/"
    echo "moved existing $dest -> $BACKUP/"
  fi
  ln -s "$src" "$dest"
  echo "link  $dest -> $src"
}

mkdir -p "$CONFIG"

# shell, multiplexer, terminal
link "$DOTFILES/fish"  "$CONFIG/fish"
link "$DOTFILES/tmux"  "$CONFIG/tmux"
link "$DOTFILES/kitty" "$CONFIG/kitty"

# neovim lives in its own repo
if [ -d "$CONFIG/nvim/.git" ]; then
  echo "ok    nvim already cloned"
else
  [ -e "$CONFIG/nvim" ] && { mkdir -p "$BACKUP"; mv "$CONFIG/nvim" "$BACKUP/"; }
  git clone "$NVIM_REPO" "$CONFIG/nvim"
fi

# tmux plugin manager
TPM="$CONFIG/tmux/plugins/tpm"
if [ ! -d "$TPM" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM"
  echo "tpm   installed"
else
  echo "ok    tpm present"
fi

echo ""
echo "done."
echo "  - open a new shell so fish loads the config"
echo "  - inside tmux: prefix + I to fetch the plugins"
