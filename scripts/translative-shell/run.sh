#!/bin/sh

# https://github.com/soimort/translate-shell
brew install gawk

cd ~/tools 
take translative-shell 
wget git.io/trans 
chmod +x ./trans

cat <<EOT >> ~/.zshrc
 export PATH="$HOME/tools/translative-shell:$PATH"

 # translative-shell
 tpl() { trans en:pl "$1" }
 ten() { trans pl:en "$1"}
EOT