# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# use VS Code as the editor
export EDITOR="code"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

########## Prompt related ##########

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

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
# export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# PG
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/14/bin

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
source ~/.iterm2_shell_integration.zsh
