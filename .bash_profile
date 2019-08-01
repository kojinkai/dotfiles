# Load Bash It
source "$BASH_IT"/bash_it.sh

# Load z for directory jumping
. /Users/lewis/bin/z.sh

# Add my own executables to PATH
export PATH=$PATH:$HOME/bin

# Configure NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias gti="git"
alias l="ls -la"
alias gst='git status '
alias gd='git diff'
alias go='git checkout '
alias cbr='git rev-parse --abbrev-ref HEAD'
alias glas='git log --date=short --color --decorate=no -1 HEAD'
alias pyg='pygmentize'
alias timestamp="date +%s | tee >(tr -d '\n' | pbcopy)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Create directories and cd to them straight away
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Load .nvrmc for every new shell session if it's found
loadnvmrc () {
  if [ -e "./.nvmrc" ]
  then
    echo "nvmrc found, using node version found in this folder..."
    nvm use

  fi
}

# load .env into the shell
dotenv () {
  set -a
  [ -f .env ] && . .env
  set +a
}

# configure the shell environment on login
dotenv
loadnvmrc


