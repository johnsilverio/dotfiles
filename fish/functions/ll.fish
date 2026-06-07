function ll --wraps='eza -la --icons --git' --description 'alias ll eza -la --icons --git (margem esquerda)'
    # Mesma margem de 1 espaço do ls; modo limpo quando não é terminal.
    set -l pad ' '
    if isatty stdout
        set -l cols $COLUMNS
        test -n "$cols"; or set cols 80
        eza -la --icons=always --color=always --git --width=(math $cols - 1) $argv | sed "s/^/$pad/"
    else
        eza -la --icons --git $argv
    end
end
