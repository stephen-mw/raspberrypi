# make less case insensitive for searches and display verbose prompt by default
export LESS="-irMS"

# Add terminal colors
export CLICOLOR=1

export FZF_DEFAULT_OPTS='--multi --no-height --extended'

# Don't put duplicate lines in the history. also, don't save lines that begin
# with a whitespace character
export HISTCONTROL=erasedups:ignorespace
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=20000
shopt -s histappend

# Make the bash history save for all open terminals
export PROMPT_COMMAND='history -a'

# Collapses multi-line commands into a single history item
shopt -s cmdhist

# ignore these short commands in the history
export HISTIGNORE="&:cd:fg:bg:pwd:pd:po:pushd:popd:dirs:ls:jobs:top"

alias grp="grep -rnI"

# Better ls
alias ll="ls -ltr"

# Format python
function lint {
    if [[ -z "${1+x}" ]]; then
        echo "First argument must be a python file."
        return
    fi
    black --line-length=120 ${1}
    isort --profile=black ${1}
}
