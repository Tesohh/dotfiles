source "$HOME/zsh-scripts/supercharge.zsh"
source "$HOME/zsh-scripts/zsh-autosuggestions.zsh"
source "$HOME/zsh-scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/zsh-scripts/.zsh-lazy-nvm.sh"

# .zshenv
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# PS1="o%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}air %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
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
PS1='%F{#ebbcba}%B❰%b%f %F{#9ccfd8}%n%f %F{#c4a7e7}%B%~%b%f %F{#ebbcba}%B❱%b%f$(git_branch_name)%F{#eb6f92}❤ %f '

jmain() {
    javac Main.java
    java Main
    find . -type f -name "*.class" -delete
}

p() {
  cd "$(find ~/Developer ~/Developer/scratchpad ~/dotfiles ~/dotfiles/.config ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents -mindepth 1 -maxdepth 1 -type d | fzf)"
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

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export EDITOR="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
