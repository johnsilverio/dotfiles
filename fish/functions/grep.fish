function grep --wraps=rg --description 'alias grep rg (margem esquerda)'
    # Indenta a saída 1 espaço no terminal; limpo em pipe/redirecionamento.
    set -l pad ' '
    if isatty stdout
        rg --color=always $argv | sed "s/^/$pad/"
    else
        rg $argv
    end
end
