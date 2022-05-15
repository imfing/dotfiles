# Set $EDITOR to 'vim' if it is undefined
[[ -z $EDITOR ]] && EDITOR=vim

# ls colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls -G . &>/dev/null && alias ls='ls -G'

# Common aliases

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias grep='grep --color'

# Enable starship
eval "$(starship init zsh)"
