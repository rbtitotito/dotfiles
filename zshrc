# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/rob.brown/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=~/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH

alias vpn="sudo openconnect --user=rob.brown --cafile=/Users/rob.brown/.ssh/DigiCert_High_Assurance_EV_Root_CA.pem sslvpn.wholefoods.com"

source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle djui/alias-tips
antigen bundle peterhurford/git-aliases.zsh
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle vagrant

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply
