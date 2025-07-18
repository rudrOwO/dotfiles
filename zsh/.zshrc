export PATH=/usr/local/bin:/home/rudro/.local/bin:/home/rudro/go/bin:/usr/local/go/bin:/home/rudro/.local/share/gem/ruby/3.2.0/bin:/home/rudro/.dotnet/tools:$PATH
export RANGER_LOAD_DEFAULT_RC=false
export ZSH="/home/rudro/.oh-my-zsh"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='/usr/local/bin/nvim'
export VISUAL='/usr/local/bin/nvim'
export TERM='wezterm'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
DISABLE_AUTO_UPDATE="true"

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
)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# My aliases
alias zshconfig="nvim ~/.zshrc"
alias grep="grep -i"
# alias gtop="watch -n0.3 nvidia-smi" # for nvidia GPU stats
alias r="ranger"
alias vim="nvim"
alias cal="cal --sunday"
alias cls="clear"
alias p="pnpm"
alias clip="xclip -selection clipboard"
alias lz="lazygit"
alias ls="eza -w 100 --color=always --icons=always --sort=extension --group-directories-first"
alias l="ls --long --all"

# Use Tab and '\' for autocompletions
bindkey '`' expand-or-complete
bindkey '\t' end-of-line

# Vim-like keybindings for zsh
bindkey '^p' up-line-or-search
bindkey '^n' down-line-or-search
bindkey '^w' forward-word
bindkey '^e' vi-forward-word-end
bindkey '^b' backward-word
bindkey '^[[Z' backward-kill-word
bindkey '^h' backward-char
bindkey '^l' forward-char

# Auto List content on directory change
function list_all() {
  emulate -L zsh
  ls
}

if [[ ${chpwd_functions[(r)list_all]} != "list_all" ]];then
  chpwd_functions=(${chpwd_functions[@]} "list_all")
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

if [ $PWD = $HOME ]; then
  cd ~/Dev
else
  ls
fi

# bun completions
[ -s "/home/rudro/.bun/_bun" ] && source "/home/rudro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
