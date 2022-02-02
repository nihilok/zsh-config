export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="kali-simple"

plugins=(
    git
    zsh-autosuggestions
)


# Print a new line before the prompt, but only if it is not the first line
new_line_before_prompt=yes
precmd() {
    if [ "$new_line_before_prompt" = yes ]; then
       if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
           _NEW_LINE_BEFORE_PROMPT=1
       else
           print ""
       fi
    fi
}


source $ZSH/oh-my-zsh.sh


export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline




# Functions and aliases
function create_alias() {
    echo "alias $1=\"$2\"" >> $ZSH/custom/aliases/my.aliases 
}

function backup () {
    cp $1 ~/.backup;
}

function sleept () {
    echo "Sleeping in $1";
    sleep $1 && systemctl suspend
}

source $ZSH/custom/aliases/aliases
source $ZSH/custom/aliases/my.aliases
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

AUTO_TMUX_ON=1

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
  	export EDITOR='nvim'
	if [ $AUTO_TMUX_ON -gt 0 ] && [ "$TMUX" = "" ] && [[ $TERMINAL_EMULATOR != "JetBrains-JediTerm" ]]; then exec tmux; fi
fi

