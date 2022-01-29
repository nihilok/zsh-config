#!/usr/bin/env zsh

ZSH=$ZSH || ~/.oh-my-zsh

FILEDATE=$(date '+%F')

FILE=~/.zshrc.bak.$FILEDATE

if [ -f "$FILE" ]; then
	echo "$FILE exists."
	mkdir -p ~/.backup
	mv $FILE ~/.backup
fi

cp ~/.zshrc ~/.zshrc.bak.$FILEDATE

ln ./zsh/.zshrc ~/.zshrc

ln ./zsh/themes/kali-simple.zsh-theme $ZSH/themes/kali-simple.zsh-theme

ln .aliases $ZSH/custom/aliases 

touch $ZSH/custom/my.aliases

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

clear
echo "Enjoy!"
printf "\n"
exec zsh 

