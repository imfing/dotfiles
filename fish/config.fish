set -U fish_greeting # disable greeting

fish_add_path /opt/homebrew/bin # Homebrew

# Local tools
fish_add_path $HOME/.local/bin

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

alias cl="clear"
alias ll="ls -la"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit -m"
alias gp="git pull"
alias gwl="git worktree list"

# add other aliases here
alias cc="claude"
alias cdx="codex -m gpt-5-codex --search -c model_reasoning_effort=high"

if type -q gemini
    function google
        set sentence $argv[1]
        if test -z "$sentence"
            read -P "Search: " sentence
        end
        if test -z "$sentence"
            return 1
        end

        gemini -m gemini-3-flash-preview -p "Search google for <query>$sentence</query> and summarize the result. Format the output using ANSI escape codes for terminal display (bold, colors, etc). Do not use Markdown format." | while read -l line; printf '%b\n' $line; end
    end
end

function kimi-claude
    set -x ANTHROPIC_AUTH_TOKEN (op read "op://Private/Moonshot AI/credential")
    set -x ANTHROPIC_BASE_URL https://api.moonshot.ai/anthropic
    claude $argv[1]
end

function deepseek
    set -x ANTHROPIC_AUTH_TOKEN (op read "op://Private/DeepSeek API/credential")
    set -x ANTHROPIC_BASE_URL https://api.deepseek.com/anthropic
    claude $argv[1]
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/xinfu/.lmstudio/bin
# End of LM Studio CLI section

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Added by Antigravity
fish_add_path /Users/xinfu/.antigravity/antigravity/bin
