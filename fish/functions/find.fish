function find --wraps=fd --description 'alias find fd (margem esquerda)'
    # Indenta a saída 1 espaço no terminal; limpo em pipe/redirecionamento.
    set -l pad ' '
    if isatty stdout
        fd --color=always $argv | sed "s/^/$pad/"
    else
        fd $argv
    end
end
