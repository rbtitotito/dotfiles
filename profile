# ~/.profile: executed by the command interpreter for login shells.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# universal includes

source $HOME/.alias
source $HOME/.env-vars
source $HOME/.path

export _JAVA_AWT_WM_NONREPARENTING=1
eval `keychain --eval /home/rbrown/.ssh/id_rsa 122C71AF`
CLASSPATH=/home/rbrown/src/mysql-connector-java-5.1.25/mysql-connector-java-5.1.25-bin.jar:$CLASSPATH

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -n "$ZSH_VERSION" ]; then
    
    if [ -f "$HOME/.zshrc" ]; then
        . "$HOME/.zshrc"
    fi 
fi


PATH=$HOME/.node_modules/.bin:$PATH

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

