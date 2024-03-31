export ANDROID_SDK_ROOT=$HOME/Android/Sdk  
export ANDROID_HOME=$HOME/Android/Sdk
export RANGER_LOAD_DEFAULT_RC=false

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/home/rudro/.local/bin:/home/rudro/go/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:/home/rudro/.cargo/bin:/usr/local/go/bin:/home/rudro/.local/share/gem/ruby/3.0.0/bin:/home/rudro/.dotnet/tools:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rudro/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    sudo
    copypath
    copyfile
)

source $ZSH/oh-my-zsh.sh

# cd into multiple directories
autoload n-list
autoload n-cd

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export TERM='alacritty'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# My aliases
alias zshconfig="nvim ~/.zshrc"
alias grep="grep -i"
# alias gtop="watch -n0.3 nvidia-smi" # for nvidia GPU stats
alias r="ranger"
alias vim="nvim"
alias cal="cal --sunday"
alias cls="clear"
alias p="pnpm"
alias z="zellij"
alias clipboard="xclip -selection clipboard"

# Use Tab and '\' for autocompletions
bindkey '`' expand-or-complete
bindkey '\t' end-of-line

# Vim-like keybindings for zsh
bindkey '^k' up-line-or-search
# bindkey '^k' end-of-line
bindkey '^j' down-line-or-search
bindkey '^w' forward-word
bindkey '^e' vi-forward-word-end
bindkey '^b' backward-word
bindkey '^[[Z' backward-kill-word
bindkey '^h' backward-char
bindkey '^l' forward-char

# Start shell in ~/Dev directory
if [ $PWD = $HOME ]; then
    cd ~/Dev
fi

# Auto List content on directory change
function list_all() {
  emulate -L zsh
  ls -lh
}

if [[ ${chpwd_functions[(r)list_all]} != "list_all" ]];then
  chpwd_functions=(${chpwd_functions[@]} "list_all")
fi

# zsh syntax highlighting
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/rudro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# List directory on shell start
ls -lh
