function ls --wraps='eza --icons' --description 'alias ls eza --icons (margem esquerda)'
    # Indenta a saída 1 espaço (mesma margem do prompt) só quando vai pro
    # terminal. Em pipe/redirecionamento usa o modo limpo, sem margem nem cor.
    set -l pad ' '
    if isatty stdout
        set -l cols $COLUMNS
        test -n "$cols"; or set cols 80
        eza --icons=always --color=always --grid --width=(math $cols - 1) $argv | sed "s/^/$pad/"
    else
        eza --icons $argv
    end
end
