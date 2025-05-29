set -U fish_greeting # disable greeting

fish_add_path /opt/homebrew/bin  # Homebrew

# Rust
fish_add_path $HOME/.cargo/bin

# Go
if type -q go
    fish_add_path $(go env GOPATH)/bin
    set -x GOPATH (go env GOPATH)
end

# Local tools
fish_add_path $HOME/.local/bin

# zoxide - smarter cd command https://github.com/ajeetdsouza/zoxide
type -q zoxide; and zoxide init fish | source

# fzf - https://github.com/junegunn/fzf
if type -q fzf
    fzf --fish | source
    set -x FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    set -x FZF_CTRL_T_OPTS '--walker-skip .git,node_modules,target --preview "bat -n --color=always {}" --bind "ctrl-/:change-preview-window(down|hidden|)"'
end

# https://starship.rs/
type -q starship; and starship init fish | source

# zellij - mordern terminal multiplexers
# https://github.com/zellij-org/zellij 
type -q zellij; and alias zj="zellij"

# lazygit
type -q lazygit; and alias lg="lazygit"

# eza - modern alternative to ls
# https://github.com/eza-community/eza
if type -q eza
    alias ls="eza"
    alias ll="eza --long --git --git-repos-no-status --header --icons"
    alias tree='eza -lh --git --time-style long-iso --tree --all --icons auto'
end

# cursor
if type -q cursor
    alias c="cursor ."
end

# add other aliases here
