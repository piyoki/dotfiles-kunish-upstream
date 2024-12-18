set -x fish_greeting

set -x VISUAL nvim
set -x EDITOR nvim

set -x fzf_fd_opts -HE .git
set -x PNPM_HOME $HOME/Library/pnpm
set -x GOPATH $HOME/.go
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x GPG_TTY (tty)

set -x HOMEBREW_NO_ENV_HINTS 1
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True

fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/sbin
fish_add_path /usr/local/opt/gnu-tar/libexec/gnubin
fish_add_path /usr/local/opt/openssl/bin
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path (brew --prefix)/sbin
fish_add_path (brew --prefix)/bin
fish_add_path (brew --prefix)/opt/make/libexec/gnubin
fish_add_path (brew --prefix)/opt/llvm/bin
fish_add_path (brew --prefix)/opt/gnu-tar/libexec/gnubin
fish_add_path (brew --prefix)/opt/postgresql@16/bin
fish_add_path $HOME/.krew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.pyenv/bin
fish_add_path $HOME/.jenv/bin
fish_add_path $HOME/.pub-cache/bin
fish_add_path $HOME/Developer/flutter/bin
fish_add_path $PNPM_HOME
fish_add_path $GOPATH/bin

source (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

alias k kubectl
alias kx kubectx
alias ld lazydocker
alias lg lazygit
alias lv lvim
alias n nvim
alias s "kitten ssh"

abbr t trans :zh

function kubectl
    kubecolor $argv
end

if status is-interactive
  if type -q fnm
      fnm env --use-on-cd --log-level quiet | source
  end

  if type -q pyenv
      pyenv init --path | source
  end

  if type -q starship
      starship init fish | source
  end

  if type -q zoxide
      zoxide init fish | source
  end

  if type -q kubectl
      kubectl completion fish | source
  end

  if type -q jenv
    jenv init - | source
  end

  if type -q tailscale
    tailscale completion fish | source
  end

  if type -q netbird
    netbird completion fish | source
  end
end
