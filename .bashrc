...

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;90m\]\u:\[\033[01;94m\]\w\[\033[01;95m\] $(parse_git_branch)\$ \[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w $(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
...

# some git aliases commands
alias gs="git status"
alias ga="git add"
alias gco="git commit"
alias gb="git branch"
alias gch="git checkout"
alias gst="git stash"
alias gm="git merge"
alias grb="git rebase"
alias gre="git reset"
alias gd="diff --color --color-words --abbrev"
alias gbl="git blame"
alias gf="git fetch -ap"
alias gpl="git pull"
alias gps="git push"

# some docker aliases commands
alias docker-clean-containers="docker container rm -f \$(docker container ls -aq)"
alias docker-clean-images="docker image rm -f \$(docker image ls -aq)"
alias docker-clean-networks="docker network rm \$(docker network ls -q)"
alias docker-clean-volumes="docker volume rm \$(docker volume ls -q)"
alias docker-clean="docker-clean-containers;docker-clean-images;docker-clean-networks;docker-clean-volumes"
