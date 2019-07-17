# - - - - [ DEFAULT ZSH CONFIGS ] - - - -

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Path to your oh-my-zsh installation.
export ZSH=/Users/backup/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(zeus git jump rails ruby colored-man-pages osx gem bundler)

source $ZSH/oh-my-zsh.sh


# - - - -  [ GIT ] - - - - 

alias recentbranches="git for-each-ref --sort=-committerdate refs/heads/ | awk '{ gsub(\"refs/heads/\", \"\") }1'"
# List all recent branches, with commit and banch name, that have been committed to last.
rb(){
  recentbranches | head -n "${@:-5}"
}

# Soft rollback of HEAD
alias "grh^"="git reset HEAD^"

# Override Git Push to use force-with-lease
alias gpf="git push --force-with-lease"

# Manually check rubocop on cached diff
alias rbc="rubocop-git --cached --display-cop-names"
alias rbca="gaa;rbc"

# Add all changes to a fixup commit for given commit hash
fixup(){
  git add . ;  git commit --fixup "$@"
}

# fixup followed by an interactive rebase
fixupr(){
  fixup "$@"; gria head^^
}

# Autosquash alias. Useful with the above fixup command.
alias gria="git rebase -i --autosquash"

# Simple no verify commit command
alias gcn="git commit --no-verify -v"

# See diff of cached changes
alias gdc="git diff --cached"

# Override gwip as introduced by the git plugin, to have the correct [no ci] message for solano
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [no ci]"'

# Gwip and push
alias gwipp="gwip; gp"

# add and commit changelog updates
uc="git add CHANGELOG.md; git commit -n '[skip ci] Update Changelog'"

# - - - - [ GIT FLOW ] - - - -

# feature start
alias gffs='git flow feature start'

# feature finish
alias gfff='git flow feature finish'

# feature publish
alias gffp='git flow feature publish'

# release start
alias gfrs='git flow release start'

# release publish
alias gfrp='git flow release publish'

# - - - - [ OTHER ] - - - -

# Shorten jump command, as introduced by the zsh plugin
alias j=jump

# Mysql root login by default
alias mysqlr='mysql -uroot'

# Bundle
alias be='bundle exec'
