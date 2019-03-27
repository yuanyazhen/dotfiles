# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit
: ${ZSH_DISABLE_COMPFIX:=false}
# Load all of the config files in ~/oh-my-zsh that end in .zsh
for fn ($ZSH/functions/*.zsh); do
  source $fn
done

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  # If completion insecurities exist, warn the user without enabling completions.
  if ! compaudit &>/dev/null; then
    # This function resides in the "lib/compfix.zsh" script sourced above.
    handle_completion_insecurities
  # Else, enable and cache completions to the desired file.
  else
    compinit -d "${ZSH_COMPDUMP}"
  fi
else
  compinit -i -d "${ZSH_COMPDUMP}"
fi
# zsh, oh-my-zsh theme
source "${ZSH}/themes/${ZSH_THEME}.zsh-theme"
