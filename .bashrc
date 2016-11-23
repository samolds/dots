alias rmallpyc="find . -name \"*.pyc\" -exec rm -rf {} \;"
alias rmallswp="find . -name \"*.swp\" -exec rm -rf {} \;"
alias rebash="source ~/.bash_profile"
alias ll="ls -lsah"
alias vimo="vim -O"

#set -o vi

export GOPATH="${HOME}/projects/gowork"

# Useful Reminders
# Copy my ssh public key to remote machine:
# cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"

# http://superuser.com/a/239995
export PS1='\h:\w$ '
