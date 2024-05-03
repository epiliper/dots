export PATH=/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export BASH_SILENCE_DEPRECATION_WARNING=1
export JUPYTER_PATH=/opt/homebrew/lib/python@3.10/bin/python3.10:$JUPYTER_PATH
export PATH=~/.cargo/bin:~/.local/bin:$PATH
export PYTHONPATH="/opt/homebrew/bin/python3.11"
export PYTHONPATH="${PYTHONPATH}:~/stuff/bioinformatics/vapid4"
export EDITOR="/opt/homebrew/bin/nvim"

alias 'od'='cd /Users/eli/Library/CloudStorage/OneDrive-UW/RSV\ serology/neut\ analysis\ EP'
alias 'v'='nvim'
alias 'wj'='jupyter notebook /Users/eli/stuff/work/python' 
alias 'ystop'='yabai --stop-service'
alias 'ygo'='yabai --start-service'
alias 'ls'='ls -a --color'
alias 'vap4'='python3.11 ~/stuff/bioinformatics/vapid4/vapid4.py'

alias 'smooth'='python3.11 ~/smoothing.py s'
alias 'rough'='python3.11 ~/smoothing.py r'

alias 'bi'='cd $HOME/stuff/bioinformatics'

alias 'tsh'='sh test_run_cmd.txt'
alias 'neofetch'='macchina'
alias 'ls'='lsd -ha'

export PS1='\e[1;34m\W \e[0m '


. "$HOME/.cargo/env"

eval "$(zoxide init bash)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
