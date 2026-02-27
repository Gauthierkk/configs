#Python Path Adding
export PATH="/usr/local/bin:$PATH"
alias python=python3

# Ensuring zsh completion is enabled
autoload -U compinit
compinit

# Starship config path 
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"