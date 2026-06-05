if status is-interactive
    # Commands to run in interactive sessions can go here
    # Desabilita a mensagem de boas-vindas do fish
    set -g fish_greeting ""

    # Dentro do tmux: dá um clear UMA única vez por sessão (na primeira shell
    # fish da sessão). Usa uma variável de ambiente da própria sessão tmux como
    # marcador — então panes/janelas novas e reanexos NÃO limpam de novo.
    # IMPORTANTE: só limpa se NÃO há sessão salva pra restaurar. Se houver, deixa
    # o tmux-continuum restaurar sem o clear atrapalhar (ficam mutuamente
    # exclusivos — nunca brigam pela ordem).
    if set -q TMUX; and not test -e ~/.local/share/tmux/resurrect/last
        if not tmux show-environment FISH_CLEARED >/dev/null 2>&1
            clear
            tmux set-environment FISH_CLEARED 1
        end
    end

    # Respiro do topo: 1 linha em branco no início do shell, só pra o primeiro
    # prompt não colar na barra do tmux (o prompt em si não tem padding-top,
    # pra não criar vão entre prompts).
    echo
end
zoxide init fish | source
fzf --fish | source
fnm env --use-on-cd | source
fnm env --use-on-cd | source
set -gx PATH $HOME/.cargo/bin $PATH
direnv hook fish | source

# opencode
fish_add_path /home/johnsilverio/.opencode/bin
