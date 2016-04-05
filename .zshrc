# User configuration

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin"

PATH=$PATH:/Applications/XAMPP/xamppfiles/bin

ARCHFLAGS='-arch x86_64'

source ~/.perlbrew/etc/bashrc

export PATH=$HOME/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"

#source ~/.git-completion.zsh
