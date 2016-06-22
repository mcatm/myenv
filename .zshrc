# compinit
autoload -Uz compinit
compinit

# Language
export LANG=ja_JP.UTF-8

# setopt
setopt auto_cd # ディレクトリを指定しただけで勝手にcd
setopt auto_pushd # ディレクトリの移動履歴
setopt correct # コマンドのスペルチェック

# Prompt
PROMPT="%m:%n%% "
RPROMPT="[%~]"


# source "$HOME/.git-completion.zsh"
# source "$HOME/.git-prompt.sh"
