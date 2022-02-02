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
rm ~/.zshrc
ln ./.zshrc ~/.zshrc

ln ./themes/kali-simple.zsh-theme $ZSH/themes/kali-simple.zsh-theme

ln .aliases $ZSH/custom/aliases 

touch $ZSH/custom/my.aliases

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || echo "autosuggestions plugin already installed"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || echo "syntax highlighting plugin already installed"

clear
echo "Enjoy!"
printf "\n"
exec zsh 

