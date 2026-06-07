# Paleta Flexoki (dark / moon) aplicada às "letras" do fish: o syntax
# highlighting da linha de comando, o pager de autocomplete e as cores do git
# prompt. Só o texto do fish — o tema do terminal/tmux é separado.
#
# Flexoki moon: fg cecdc3  muted 575653  blue 4385be  cyan 3aa99f
#               green 879a39  yellow d0a215  orange da702c  red d14d41
#               magenta ce5d97  purple 8b7ec8  selection 343331

# ── Syntax highlighting da linha de comando ─────────────────────────────────
set -g fish_color_normal          cecdc3
set -g fish_color_command         4385be            # comandos (azul)
set -g fish_color_keyword         ce5d97            # keywords (magenta)
set -g fish_color_quote           879a39            # strings (verde)
set -g fish_color_redirection     3aa99f            # > >> | (ciano)
set -g fish_color_end             8b7ec8            # ; & terminadores (roxo)
set -g fish_color_error           d14d41            # erro (vermelho)
set -g fish_color_param           cecdc3            # parâmetros
set -g fish_color_option          878580            # --flags (subtle)
set -g fish_color_comment         575653 --italic   # comentários (muted)
set -g fish_color_operator        da702c            # operadores (laranja)
set -g fish_color_escape          ce5d97            # \n \t (magenta)
set -g fish_color_autosuggestion  575653            # sugestão fantasma (apagada)
set -g fish_color_selection       --background=343331
set -g fish_color_search_match    --background=343331
set -g fish_color_valid_path      --underline
set -g fish_color_cwd             4385be            # cwd (azul)
set -g fish_color_user            3aa99f
set -g fish_color_host            4385be
set -g fish_color_host_remote     d0a215

# ── Pager de autocomplete ───────────────────────────────────────────────────
set -g fish_pager_color_progress            575653
set -g fish_pager_color_prefix              4385be --bold
set -g fish_pager_color_completion          cecdc3
set -g fish_pager_color_description         575653 --italic
set -g fish_pager_color_selected_background --background=343331

# ── Diretório no prompt: nomes completos (mais explícito que o abreviado) ────
set -g fish_prompt_pwd_dir_length 0

# ── Git prompt: status informativo e explícito ──────────────────────────────
set -g __fish_git_prompt_prefix '  '   # espaço + ícone de branch (nerd font)
set -g __fish_git_prompt_suffix ''
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_dirtystate '●'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_upstream_ahead '↑'
set -g __fish_git_prompt_char_upstream_behind '↓'
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_color_branch     8b7ec8       # branch (roxo)
set -g __fish_git_prompt_color_dirtystate d0a215       # modificado (amarelo)
set -g __fish_git_prompt_color_stagedstate 879a39      # staged (verde)
set -g __fish_git_prompt_color_untrackedfiles da702c   # untracked (laranja)
set -g __fish_git_prompt_color_cleanstate 879a39       # limpo (verde)
set -g __fish_git_prompt_color_upstream   3aa99f       # ahead/behind (ciano)
