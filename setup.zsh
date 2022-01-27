#!/usr/bin/env zsh

ZSH=$ZSH || ~/.oh-my-zsh


mv ~/.zshrc ~/.zshrc-pre-jarv || exit

ln ./zsh/.zshrc ~/.zshrc

ln ./zsh/themes/kali-simple.zsh-theme $ZSH/themes/kali-simple.zsh-theme

ln .aliases $ZSH/custom/aliases 

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

clear
echo "Enjoy!"
#printf "\e[1B"    # linedown
printf "\n"    # linedown
exec zsh 

