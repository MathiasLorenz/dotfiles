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
source ~/.aliases

# Rust/Cargo setup
. "$HOME/.cargo/env"

if [[ "$(uname)" == "Darwin" ]]; then

    # Docker (colima)
    export DOCKER_HOST=unix://$HOME/.colima/docker.sock

    # some stupid package needed in draw-map-service, installed via brew
    export GEOS_DIR="/opt/homebrew/Cellar/geos/3.12.0"

    # roc
    export PATH=$PATH:~/roc/roc_nightly-macos_apple_silicon-2023-12-01-a56d7adc17

    # nvm (node manager)
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    # Alias for awsp, https://github.com/johnnyopao/awsp
    alias awsp="source _awsp"
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

else

    # Add python poetry to PATH
    export PATH="$PATH:/home/lorenz/.local/share/pypoetry/venv/bin"

    # Add tofuenv to PATH
    # tofuenv should be deprecated for tenv
    # export PATH="$PATH:/home/lorenz/.tofuenv/bin"

    # Add .local/bin to PATH, here is e.g. go-task installed
    # export PATH="$PATH:/home/lorenz/.local/bin"

    # Homebrew (package manager)
    # eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # nvm (node manager)
    # export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # asdf 'package manager' setup
    # . /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

    # export PATH="$PATH:/opt/nvim-linux64/bin"

fi

# Poetry
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# zoxide
eval "$(zoxide init zsh)"
