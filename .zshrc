#Python Path Adding
export PATH="/usr/local/bin:$PATH"
alias python=python3

# Ensuring zsh completion is enabled
autoload -U compinit
compinit

# Starship
eval "$(starship init zsh)"