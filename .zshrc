# PATH
export PATH="$HOME/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin"

## PATH > x11
export PATH="/opt/X11/bin:/usr/X11/bin:$PATH"

## PATH > git
export PATH="/usr/local/git/bin:$PATH"

## PATH > rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

## PATH > xampp
export PATH="$PATH:/Applications/XAMPP/xamppfiles/bin"

## PATH > node_modules
export PATH="$PATH:./node_modules/.bin"

# ARCHFLAGS
ARCHFLAGS='-arch x86_64'

# perlbrew
source ~/.perlbrew/etc/bashrc

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Google Cloud
source "$HOME/google-cloud-sdk/path.zsh.inc"
source "$HOME/google-cloud-sdk/completion.zsh.inc"

#source ~/.git-completion.zsh
