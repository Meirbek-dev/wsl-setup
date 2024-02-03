# Add to the bottom of the runcom file

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/meirb/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/meirb/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/meirb/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/meirb/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# manually added

alias bashrc="nvim ~/.bashrc"
alias c="code"
alias n="nvim"
alias jl='jupyter-lab'
alias jn='jupyter-notebook'

alias up='sudo apt-get update && sudo apt-get upgrade -y'
alias cc="sudo apt autoremove -y"
alias apti="sudo apt-get install"
