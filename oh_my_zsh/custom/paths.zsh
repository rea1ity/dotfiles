case $OSTYPE in
   linux-gnu)
      workspaces_locn="/mnt/development/sandbox/workspaces"
      ;;
   msys)
      workspaces_locn="/c/projects"
      git_path="/c/devel/scm/git"
      ;;
   darwin19.0)
      workspaces_locn="$HOME/development"
      ;;
esac


# Export existing paths
typeset -gxU path PATH
typeset -gxU cdpath CDPATH
typeset -gxU manpath MANPATH

# Create and export new paths.
typeset -gxU infopath INFOPATH

# Tie the new paths.
typeset -gxTU INFOPATH infopath


# Set the list of directories that zsh searches for commands.
path=(
  $HOME/bin
  /usr/local/{sbin,bin}
  /opt/{sbin,bin}
  /opt/local/{sbin,bin}
  /usr/{sbin,bin}
  /{sbin,bin}
  $git_path/bin
)
path=($^path(N-/))

# set the search path for functions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set the list of directories that cd searches for directories.
setopt auto_cd
cdpath=(
  .
  $HOME
  $workspaces_locn
)
cdpath=($^cdpath(N-/))

# Set the list of directories that info searches for manuals.
infopath=(
  /usr/local/info
  /usr/local/share/info
  /usr/share/info
)
infopath=($^infopath(N-/))

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/man
  /usr/local/share/man
  /usr/share/man
)
manpath=($^manpath(N-/))
