# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Fix tty for gpg signing
export GPG_TTY=$(tty)

# init zplug
if [[ "$(uname)" == "Darwin" ]]; then
    export ZPLUG_HOME=/opt/homebrew/opt/zplug
else
    export ZPLUG_HOME=/home/mlorenz/.zplug
fi
source $ZPLUG_HOME/init.zsh


# load oh-my-zsh lib components
zplug "lib/*", from:oh-my-zsh

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/gh", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/kubectx", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/poetry", from:oh-my-zsh

# plugins
zplug "MichaelAquilina/zsh-autoswitch-virtualenv", from:github, as:plugin
zplug "djui/alias-tips", from:github, as:plugin
zplug "zsh-users/zsh-autosuggestions", from:github, as:plugin
zplug "zsh-users/zsh-syntax-highlighting", from:github, as:plugin, defer:2
zplug "Aloxaf/fzf-tab", from:github, as:plugin

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# load zplug plugins
# zplug load --verbose
zplug load

# use starship prompt, must be installed seperately
# starship is configured in a seperate configuration file
# located in ~/.config/starship.toml
eval "$(starship init zsh)"

# source custom commands
source ~/.env
source ~/.aliases

fastfetch
