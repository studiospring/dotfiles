# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/sean/.fzf/bin" ]]; then
  export PATH="$PATH:/home/sean/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/sean/.fzf/man" && -d "/home/sean/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/sean/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/home/sean/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/sean/.fzf/shell/key-bindings.zsh"

