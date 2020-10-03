# JHB custom aliases, to be sourced in ~/.bash_profile
# run include-bash_custom.sh once to include it


# add path to custom shell tools
if [ -d ~/opt/shelltools ]; then
    PATH="${HOME}/opt/shelltools:$PATH"
fi


# make python3 my default python
alias python='python3'
alias pip='pip3'


# detect the operating system
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

# set default editor to vi, on a shared linux machine
if [[ $MACHINE == "Linux" ]]; then
    export EDITOR='vi'
    export VISUAL='vi'
fi


# === mac os ===

# silence warning that default shell is now zsh
# (still using bash after Catalina upgrade)
if [[ $MACHINE == "Mac" ]]; then
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi


# === command line interface ===

# for color in terminal
export CLICOLOR=1
# customize colors
export LSCOLORS=gxfxcxdxcxegedabagacad
# cyan directories, green executables


# on a personal Mac, no need to display username
# also colorize hostname and the working directory
# coloring ref: https://bluesock.org/~willg/dev/ansi.html
# bash special characters ref: https://apple.stackexchange.com/a/219133
if [[ $MACHINE == "Mac" ]]; then
    # export PS1='\h:\W \u\$'    # --- Mac OS default   
    # export PS1='\[\033[1;32m\]\h\[\033[0;39m\]:\[\033[1;34m\]\W\[\033[0;39m\]$ '
    export PS1='\h:\[\033[0;36m\]\W\[\033[0;39m\]$ '
fi


# basic ls aliases
# the -o option lists in long formats, but without the group id
alias ls='ls -h'
if [[ $MACHINE == "Linux" ]]; then
    alias ls='ls -h --color=auto'
fi
alias la='ls -ao'

# group directories first in ls output
# LC_COLLATE=C means uppercase first
#alias ls='LC_COLLATE=C ls -h --group-directories-first'


# === git ===

alias g=git

# -- git aliases
alias glg='git log --graph --oneline --decorate'
alias glga='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gronto='git rebase --committer-date-is-author-date --onto'

# -- git functions

# git log find by commit message
# (ref: https://jonsuh.com/blog/git-command-line-shortcuts/)
# use: `glf text_to_find`
function glf() { git log --all --grep="$1"; }

# modify date of latest commit
# example date format: "31 Jan 2019 23:57"
function gcdate() { GIT_COMMITTER_DATE="$1" git commit --amend --no-edit --date "$1"; }


# === python virtualenv ===

# activate a virtualenv enviroment from a central location
# use: `vvact ENV_NAME`
function vvact() { source "${HOME}/.virtualenvs/$1/bin/activate"; }

# create a new virtualenv environment in a central location
# use: `vvnew ENV_NAME`
function vvnew() { virtualenv "${HOME}/.virtualenvs/$1"; }

