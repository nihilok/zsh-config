export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtenv_indicator


PROMPT=$'%F{green}┌──(%B%F{blue}%n@%m%b%F{green})-[%B%F{blue}%2~%b%F{green}]%F{011} %(1V.(%1v).)$(git_prompt_info)\n%F{green}└─%B%F{blue}$%b%F{reset} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}\u2387 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}±%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
