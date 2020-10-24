set -o vi
stty -ixon

export PROMPT='%~$ '
export HISTCONTROL=ignoreboth:erasedups

export WORK="${HOME}/work"

alias resh="source ~/.zshrc"
alias ll="ls -lsah"
alias vimo="vim -O"
alias grp="grep -EIirn --color --exclude-dir={pkg,bin,node_modules}"

export GO111MODULE=on
export GOPATH="${WORK}/go"
export PATH="${PATH}:${GOPATH}/bin"

notes() {
  mkdir -p $WORK/notes
  cd $WORK/notes
  notesfile="`date +"%Y-%m-%d"`.md"
  if [ ! -f $notesfile ]; then
    printf "== `date +"%A %D"` ==\n\n\n" >> $notesfile
  else
    printf "\n---\n\n\n" >> $notesfile
  fi
  vim $notesfile
}
