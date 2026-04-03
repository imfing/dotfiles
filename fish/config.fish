set -U fish_greeting # disable greeting

fish_add_path /opt/homebrew/bin # Homebrew

# Local tools
fish_add_path $HOME/.local/bin

# https://starship.rs/
type -q starship; and starship init fish | source

# Rust
if type -q cargo
    fish_add_path $HOME/.cargo/bin
end

# Go
if type -q go
    fish_add_path $(go env GOPATH)/bin
    set -x GOPATH (go env GOPATH)
end

# zoxide - smarter cd command https://github.com/ajeetdsouza/zoxide
type -q zoxide; and zoxide init fish | source

# fzf - https://github.com/junegunn/fzf
if type -q fzf && type -q bat
    fzf --fish | source
    set -x FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    set -x FZF_CTRL_T_OPTS '--walker-skip .git,node_modules,target --preview "bat -n --color=always {}" --bind "ctrl-/:change-preview-window(down|hidden|)"'
else if type -q fzf
    fzf --fish | source
    set -x FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90%'
end

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
    alias tree='eza -lh --git --time-style long-iso --tree --all'
end

alias cl="clear"
alias ll="ls -la"

# Git
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit -m"
alias gp="git pull"
alias gwl="git worktree list"

# AI

# cursor
if type -q cursor
    alias c="cursor ."
end

# Obsidian
fish_add_path /Applications/Obsidian.app/Contents/MacOS

# Added by LM Studio CLI (lms)
set -gx PATH $PATH ~/.lmstudio/bin
# End of LM Studio CLI section

# Added by Antigravity
fish_add_path ~/.antigravity/antigravity/bin

# Vite+ bin (https://viteplus.dev)
source "$HOME/.vite-plus/env.fish"
