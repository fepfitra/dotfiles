export PATH=$HOME/.local/bin:$PATH
HISTFILE=~/.histfile
HISTSIZE=1000
bindkey -v

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

source /usr/share/nvm/init-nvm.sh
export PATH="$PATH:/home/fep/GitProject/flutter/bin"
export PATH="$PATH:/home/fep/conda"

alias "x=xclip -selection clipboard" 
fortune

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fep/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fep/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fep/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fep/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate 3.7.5
