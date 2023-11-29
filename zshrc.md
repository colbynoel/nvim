# Zshrc Example

```bash
# If you come from bash you might have to change your $PATH.
export LANG=en_US.UTF-8
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Path to your oh-my-zsh installation.

ZSH_THEME="steeef"
PROMPT='%n@%m %1~ %# '

HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting python)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias nvconfig="nvim ~/.config/nvim"
alias oldvim="vim"
alias vim="nvim"
alias vi="nvim"
alias ls="colorls"
alias ll="colorls -al"
alias lt="colorls --tree=3"
# alias ohmyzsh="mate ~/.oh-my-zsh"


list_functions(){
	echo "edir {search_term} {editor_option} : Opens directory in editor (default vscode)"
	echo "personal : Switches to personal account"
	echo "work : Switches to work account"
	echo "mkcd {directory_name} : Creates directory and cd's into it"
}

edir() {
    local search_term=$1
    local editor_option=$2
 
    # Check if a search term is provided
    if [ -z "$search_term" ]; then
        echo "❌ Provide a search term."
        return 1
    fi
 
    # Check for required tool: fzf
    if ! command -v fzf >/dev/null 2>&1; then
        echo "❌ Install 'fzf'."
        return 1
    fi
 
    # Find directories matching the search term and select one using fzf
    local selected_dir=$(find ~ ~/ -type d -iname "*$search_term*" 2>/dev/null | fzf --prompt="Select a directory: ")
 
    # Check if a directory was selected
    if [ -n "$selected_dir" ]; then
        case $editor_option in
            -c)
                if command -v code-insiders >/dev/null 2>&1; then
                    code-insiders "$selected_dir"
                else
                    echo "❌ 'code-insiders' is not installed."
                    return 1
                fi
                ;;
            -o) cd "$selected_dir" ;;  # Only change to the selected directory
            *) nvim "$selected_dir" ;;  # Default to code if no option or unrecognized option is given
        esac
    else
        echo "🚫 No directory selected."
    fi
}

personal() {
    eval "$(ssh-agent -s)"
    ssh-add -D
    ssh-add ~/.ssh/id_ed25519_personal
    git config --global user.email "colbynoel02@gmail.com"
    cd ~/personal
    echo "Switched to Personal SSH and Git Config."
}

work() {
    eval "$(ssh-agent -s)"
    ssh-add -D
    ssh-add ~/.ssh/id_ed25519_work
    git config --global user.email "colby.noel@gainwelltechnologies.com"
    cd ~/work
    echo "Switched to Work SSH and Git Config."
}

mkcd(){
	mkdir "$1"
	cd "$1"
}


python_venv() {
  MYVENV=./env  
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv
python_venv






```
