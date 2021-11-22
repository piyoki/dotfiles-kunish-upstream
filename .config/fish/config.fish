set -x fish_greeting

set -x VISUAL nvim
set -x EDITOR nvim

set -x BAT_THEME gruvbox-dark
set -x fzf_fd_opts -HE .git
set -x GOPROXY https://goproxy.io,direct
set -x GOPATH $HOME/.go
set -x PUB_HOSTED_URL https://pub.flutter-io.cn
set -x FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
set -x PEPPA_OUTPUT $HOME/work/peppa-output
set -x KUBECONFIG $HOME/.kube/kubeconfig.yml

set -x HOMEBREW_BREWFILE_APPSTORE 0

fish_add_path /usr/local/sbin
fish_add_path /usr/local/opt/gnu-tar/libexec/gnubin
fish_add_path /usr/local/opt/openssl/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/gnu-tar/libexec/gnubin
fish_add_path $HOME/.krew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin

abbr t "trans :zh"

alias d docker
alias icat "kitty +kitten icat"
alias k kubectl
alias kx kubectx
alias l la
alias ld lazydocker
alias lg lazygit
alias ls exa
alias n nvim
alias v vim

if status is-interactive
    fnm env | source
    pyenv init --path | source
    starship init fish | source
end
