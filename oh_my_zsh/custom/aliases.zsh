# export LSCOLORS='Exfxcxdxbxegedabagacad'
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS


alias dev="cd /c/devel"
alias cdws="cd /c/projects"
alias sandbox="source /c/projects/config/dotfiles/sandbox/sandbox_win.zsh"
alias vconf="vim ~/.vimrc"
alias zconf="vim ~/.zshrc"
alias zsrc="source ~/.zshrc"

alias ds="dd if=/dev/zero of=/tmp/output.img bs=8k count=256k"
alias vi="/usr/bin/vim"
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias ll="ls -Gla"
alias cls=clear
