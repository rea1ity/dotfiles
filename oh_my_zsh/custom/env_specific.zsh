case $OSTYPE in
  darwin*)
    export LSCOLORS="exfxcxdxbxegedabagacad"
    alias ls="ls -G $*"
    alias ll="ls -Gla $*"

    alias dev="cd /Applications/dev_sandbox"
    alias cdws="cd ~/development"
    alias sandbox="source ~/development/dotfiles/sandbox/sandbox.zsh"

    #alias idea="/Applications/dev_stuff/ide/IntelliJ\ IDEA.app/Contents/MacOS/idea >& /dev/null &"
    alias idea="open -a IntelliJ\ IDEA"
    alias astudio="open -a Android\ Studio"
    alias atom="open -a Atom"
    alias wakedougal="wakeonlan -i 255.255.255.0 00:24:1D:D1:C3:B0"
    ;;

  linux-gnu)
    # running on fedora laptop
    export LS_COLORS='rs=0:di=34;40:ln=35;40:pi=33;40:so=32;40:do=01;35:bd=34;46;01:cd=34;43;01:or=40;31;01:su=0;41:sg=0;46:tw=0;42:ow=0;43:st=37;44:ex=31;40:'
    alias ls="ls --group-directories-first --color"
    alias ll="ls --group-directories-first --color -la"

    alias dev="cd /mnt/development/sandbox"
    alias cdws="cd /mnt/development/sandbox/workspaces"
    alias sandbox="cd /mnt/development/sandbox; source /mnt/development/sandbox/workspaces/dotfiles/sandbox/sandbox.zsh"
  ;;

  msys)
    # running on windows under msys
    # export LSCOLORS="exfxcxdxbxegedabagacad"
    alias ls="ls -G $*"
    alias ll="ls -Gla $*"
    alias dev="cd /c/devel"
    alias cdws="cd /c/projects"
    alias sandbox="source /c/projects/config/dotfiles/sandbox/sandbox.zsh"
    alias idea="/c/devel/ide/idea/bin/idea64.exe"

    # update key bindings to get home/end and arrow keys working properly
    bindkey "^[[1~" beginning-of-line   # home key
    bindkey "^[[4~" end-of-line         # end key
    bindkey "^[[3~" delete-char         # del key
    bindkey "^[[A" history-beginning-search-backward   # up arrow
    bindkey "^[[B" history-beginning-search-forward    # down arrow
    bindkey "^[Oc" forward-word         # ctrl + right arrow
    bindkey "^[Od" backward-word        # ctrl + left arrow
    bindkey "^H" backward-kill-word     # ctrl + backspace
    bindkey "^[[3^" kill-word           # ctrl + delete

    # remove the trailing % following command execution - http://zsh.sourceforge.net/FAQ/zshfaq03.html#l40
    unsetopt promptcr
  ;;

esac
