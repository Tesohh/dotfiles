source "$HOME/zsh-scripts/supercharge.zsh"
source "$HOME/zsh-scripts/zsh-autosuggestions.zsh"
source "$HOME/zsh-scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/zsh-scripts/zsh-lazy-nvm.zsh"
source "$HOME/zsh-scripts/fzf-rose-pine.zsh"
source "$HOME/zsh-scripts/fzf-tab/fzf-tab.plugin.zsh"

# .zshenv
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# PS1="o%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}air %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

if [[ "$OSTYPE" == darwin* ]]; then
  PROMPT_HOST="mac"
else
  PROMPT_HOST="$(hostname)"
fi

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
      echo '%F{#eb6f92}   '$branch'%f'
  fi
}
setopt prompt_subst
PS1='%F{#ebbcba}%B❰%b%f %F{#9ccfd8}%n%f%F{#31748f}@${PROMPT_HOST}%f %F{#c4a7e7}%B%~%b%f %F{#ebbcba}%B❱%b%f$(git_branch_name) %F{#eb6f92}❤ %f '

jmain() {
    javac Main.java
    java Main
    find . -type f -name "*.class" -delete
}

source ~/.config/p_targets.sh
p() {
  cd "$(find $p_targets[@] -mindepth 1 -maxdepth 1 -type d | fzf)"
}

function workdir
{
    mkdir -p $1 && cd $1
}
bindkey -e
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^[^H" backward-kill-word
bindkey "^[^?" backward-kill-word

alias wk="workdir"
alias ll="ls -al"
alias dc="docker-compose"
alias vim="nvim"
alias td="tmux detach"
alias GIAVADEVVELOMMENKITT="javac"
alias tms="tmux-sessionizer"
alias cl="clear"
alias tree="tree -C"

export OBSIDIAN="~/Library/Mobile Documents/iCloud~md~obsidian/Documents/bigvault/"
export PATH=$PATH:$HOME/go/bin
export CLANG_FORMAT_STYLE_FILE=~/.config/clang-format/.clang-format

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export EDITOR="nvim"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
