# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jase/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jase/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jase/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jase/.fzf/shell/key-bindings.bash"
