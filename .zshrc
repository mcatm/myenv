# compinit
autoload -Uz compinit
compinit

# Language
export LANG=ja_JP.UTF-8

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
# source ~/.perlbrew/etc/bashrc

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Google Cloud
source "$HOME/google-cloud-sdk/path.zsh.inc"
source "$HOME/google-cloud-sdk/completion.zsh.inc"

# setopt
setopt auto_cd # ディレクトリを指定しただけで勝手にcd
setopt auto_pushd # ディレクトリの移動履歴
setopt correct # コマンドのスペルチェック

# Prompt
PROMPT="%m:%n%% "
RPROMPT="[%~]"


# source "$HOME/.git-completion.zsh"
# source "$HOME/.git-prompt.sh"

# tmux

function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session
