if [[ $WINDIR = 'C:\Windows' ]]
then
   # running on windows

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
fi
