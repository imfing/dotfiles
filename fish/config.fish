if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting # disable greeting
# set -U fish_key_bindings fish_vi_key_bindings

# Homebrew
fish_add_path /opt/homebrew/bin

# Rust
fish_add_path $HOME/.cargo/bin

# Go
if type -q go
    fish_add_path $(go env GOPATH)/bin
    set -x GOPATH (go env GOPATH)
end

# Local tools
fish_add_path $HOME/.local/bin

# iTerm2 shell integration
if test -e $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
end

# zoxide - smarter cd command
# https://github.com/ajeetdsouza/zoxide
if type -q zoxide
    zoxide init fish | source
end

# fzf - fuzzy finder
# https://github.com/junegunn/fzf
if type -q fzf
    fzf --fish | source
    set -x FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    set -x FZF_CTRL_T_OPTS '--walker-skip .git,node_modules,target --preview "bat -n --color=always {}" --bind "ctrl-/:change-preview-window(down|hidden|)"'
end

# https://starship.rs/
if type -q starship
    starship init fish | source
end

# Aliases
alias c="clear"

# eza - modern alternative to ls
# https://github.com/eza-community/eza
if command -q eza
    alias ls="eza"
    alias ll="eza --long --git --git-repos-no-status --header --icons"
    alias tree='eza -lh --git --time-style long-iso --tree --all --icons auto'
end

# pnpm
set -gx PNPM_HOME $HOME/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
