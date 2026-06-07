# Prompt de 2 linhas (estilo powerlevel10k): a 1ª linha tem o contexto à
# esquerda (ssh, diretório, git, venv) e, alinhado à direita NA MESMA LINHA do
# caminho, o status/duração/hora; a 2ª linha tem só o ❯. Cores Flexoki dark
# (conf.d/flexoki_theme.fish).

function fish_prompt --description 'Prompt 2 linhas, paleta Flexoki'
    set -l last_status $status
    set -l pad ' '

    # ── Lado ESQUERDO: ssh + diretório + git + venv ─────────────────────────
    set -l left $pad
    if set -q SSH_TTY
        set left $left(set_color 3aa99f)(whoami)(set_color 575653)'@'(set_color 4385be)(prompt_hostname)(set_color normal)' '
    end
    set left $left(set_color -o 4385be)(prompt_pwd)(set_color normal)
    # git separado e concatenado com ASPAS: sem git, $git é lista vazia e em
    # aspas vira '' (sem aspas, o produto cartesiano zeraria o left inteiro).
    set -l git (fish_vcs_prompt)
    set left "$left$git"
    if set -q VIRTUAL_ENV
        set left $left' '(set_color 8b7ec8)''(basename "$VIRTUAL_ENV")(set_color normal)
    end

    # ── Lado DIREITO: exit code (se falhou) + duração (se longa) + hora ──────
    # Inicia com '' (não lista vazia): concatenar com lista vazia zeraria tudo.
    set -l right ''
    if test $last_status -ne 0
        set right $right(set_color d14d41)"✘ $last_status "(set_color normal)
    end
    if set -q CMD_DURATION; and test "$CMD_DURATION" -gt 2000
        set right $right(set_color d0a215)(math -s1 "$CMD_DURATION / 1000")s' '(set_color normal)
    end
    set right $right(set_color 575653)(date '+%H:%M:%S')(set_color normal)$pad

    # ── Preenchimento: empurra o lado direito pra borda, na MESMA linha do
    # caminho (string length --visible ignora os códigos de cor na medida).
    set -l cols $COLUMNS
    test -n "$cols"; or set cols 80
    set -l lw (string length --visible -- $left)
    set -l rw (string length --visible -- $right)
    set -l gap (math "$cols - $lw - $rw")
    test "$gap" -lt 1; and set gap 1
    echo -s $left (string repeat -n $gap ' ') $right

    # ── Linha 2: símbolo do comando (verde = ok, vermelho = falhou) ─────────
    set -l sym 879a39
    test $last_status -ne 0; and set sym d14d41
    echo -n -s $pad (set_color $sym)'❯ '(set_color normal)
end
