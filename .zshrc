# init zplug
export ZPLUG_HOME=/home/lorenz/zplug
source $ZPLUG_HOME/init.zsh

# load oh-my-zsh lib components
zplug "lib/*", from:oh-my-zsh

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/gh", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/kubernetes", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/kubectx", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/poetry", from:oh-my-zsh

# plugins
zplug "MichaelAquilina/zsh-autoswitch-virtualenv", from:github, as:plugin
zplug "djui/alias-tips", from:github, as:plugin
zplug "zsh-users/zsh-autosuggestions", from:github, as:plugin
zplug "zsh-users/zsh-syntax-highlighting", from:github, as:plugin, defer:2

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

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Poetry
# export PATH="$HOME/.local/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Fix tty for gpg signing
export GPG_TTY=$(tty)

# source custom commands
source ~/.aliases

# Add python poetry to PATH
export PATH="$PATH:/home/lorenz/.local/share/pypoetry/venv/bin"

# Add tofuenv to PATH
export PATH="$PATH:/home/lorenz/.tofuenv/bin"

# Add .local/bin to PATH, here is e.g. go-task installed
export PATH="$PATH:/home/lorenz/.local/bin"

# Rust/Cargo setup
. "$HOME/.cargo/env"

# Homebrew (package manager)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

