# key bindings - so see what the key outputs try shift+ctrl+v
# only needed on windows at the moment...
if [[ $WINDIR = 'C:\Windows' ]]
then
   bindkey "^[[1~" beginning-of-line   # home key
   bindkey "^[[4~" end-of-line         # end key
   bindkey "^[[3~" delete-char         # del key
   bindkey "^[[A" history-beginning-search-backward   # up arrow
   bindkey "^[[B" history-beginning-search-forward    # down arrow
   bindkey "^[Oc" forward-word         # ctrl + right arrow
   bindkey "^[Od" backward-word        # ctrl + left arrow
   bindkey "^H" backward-kill-word     # ctrl + backspace
   bindkey "^[[3^" kill-word           # ctrl + delete
fi