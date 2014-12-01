# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nocorrect vim"
alias aptitude="nocorrect aptitude"
# alias scrot="scrot -s '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/screenshots/$f'"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails rvm ssh-agent sublime themes history gem)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
source /usr/share/git-flow/git-flow-completion.zsh
export _JAVA_AWT_WM_NONREPARENTING=1
eval `keychain --eval /home/rbrown/.ssh/id_rsa 122C71AF`

LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH
SQLPATH=/usr/lib/oracle/11.2/client64/lib:${SQLPATH}
export SQLPATH
TNS_ADMIN=/home/rbrown/.oracle
export TNS_ADMIN

# Customize to your needs...
export PATH=/home/rbrown/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/rbrown/.rvm/bin:$ORACLE_HOME:$ORACLE_HOME/bin:$PATH
export CLASSPATH=/home/rbrown/src/mysql-connector-java-5.1.25/mysql-connector-java-5.1.25-bin.jar:$CLASSPATH

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=$HOME/local/bin:$PATH
