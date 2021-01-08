PROMPT='%F{166}%m%{$reset_color%} %{$fg[green]%}%~ $(git_prompt_info)$(hg_prompt_info)%{$fg[magenta]%}>> %{$reset_color%}'
RPROMPT='%F{102}%T%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%F{160}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}) %{$reset_color%}"
ZSH_THEME_HG_PROMPT_PREFIX="λ %{$fg[blue]%}hg %{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[yellow]%} :: %{$reset_color%}"
