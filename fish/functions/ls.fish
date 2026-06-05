function ls --wraps='eza --icons' --description 'alias ls eza --icons (com padding-left)'
    # Indenta a saída 1 espaço (mesmo padding do prompt) só quando vai pro
    # terminal. Em pipe/redirecionamento (ls | grep, ls > arquivo) usa o
    # modo limpo, sem padding e sem cor forçada.
    set -l pad ' '
    if isatty stdout
        set -l cols $COLUMNS
        test -n "$cols"; or set cols 80
        eza --icons=always --color=always --grid --width=(math $cols - 1) $argv | sed "s/^/$pad/"
    else
        eza --icons $argv
    end
end
