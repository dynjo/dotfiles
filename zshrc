# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# use atom as the editor
export EDITOR="atom -nw"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# expand functions in the prompt
setopt prompt_subst

# prompt
# export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# Try to correct command line spelling
# setopt CORRECT CORRECT_ALL

# Enable extended globbing
# setopt EXTENDED_GLOB

########## Prompt related ##########

LSCOLORS="gxfxcxdxbxegedabagacad"
export LSCOLORS

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# prompt
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[yellow]%}%~%{$reset_color%}] '

# recommended by brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/share/npm/bin:$PATH"

# Yarn
export PATH="$PATH:`yarn global bin`"

# PG
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
