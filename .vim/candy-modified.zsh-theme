local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT="
%{$fg[blue]%}%D{[%X]} \
%{$reset_color%}%{$fg[yellow]%}[%~]%{$reset_color%} \
${git_info}\

%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(´∀｀∩)↑age↑ <!(A´∪%)↓sage↓ $)%{${reset_color}%} \
"
