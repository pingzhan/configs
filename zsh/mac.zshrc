VCS_INFO_SHOW_TRACKING_BRANCH="true"
source $HOME/bin/rc/zshrc

setopt ALWAYS_TO_END           # Push that cursor on completions.                        
setopt AUTO_NAME_DIRS          # change directories  to variable names                   
setopt AUTO_PUSHD              # push directories on every cd                            
setopt NO_BEEP                 # self explanatory                                        

######################### history options ############################                   
setopt EXTENDED_HISTORY        # store time in history                                   
setopt HIST_EXPIRE_DUPS_FIRST  # unique events are more usefull to me                    
setopt HIST_VERIFY             # Make those history commands nice                        
setopt INC_APPEND_HISTORY      # immediatly insert history into history file             
HISTSIZE=16000                 # spots for duplicates/uniques                            
SAVEHIST=15000                 # unique events guarenteed                                
HISTFILE=~/.history

#By default when you SSH to a remote host from your Mac, and your remote shell is zsh, you will have issues with the Home/End keys.
if [[ $TERM == "xterm-256color" ]]; then
  #Mac OSX/BSD bindings for Home/End/Del
  bindkey "^[[H" beginning-of-line
  bindkey "^[[F" end-of-line
  bindkey "^[[3~" delete-char
fi


#
ENABLE_VCS_INFO=1
ZSH_THEME=vcs_info
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#


autoload -U compinit
compinit


####### Color #########
autoload -U colors
colors

autoload colors; colors

# The variables are wrapped in \%\{\%\}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE 
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS

# Main change, you can see directories on a dark background
#expor tLSCOLORS=gxfxcxdxbxegedabagacad

export CLICOLOR=1
export LS_COLORS=exfxcxdxbxegedabagacad




#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY


## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0



##===Ping's Key binding===
bindkey -e
#bindkey "^R" history-incremental-search-backward
#bindkey "^E" end-of-line
#bindkey "^A" beginning-of-line
#bindkey "^T" push-line-or-edit

# Fix backspace, delete, home, end
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
#bindkey '\eOH' beginning-of-line
#bindkey '\eOF' end-of-line
#bindkey '^[[6~' end-of-history
#bindkey '^[[Z' reverse-menu-complete
bindkey "^[[1;5C" forward-word
#bindkey "\eOc" emacs-forward-word
bindkey "^[[1;5D" backward-word
#bindkey "\eOd" emacs-backward-word
#bindkey "\e\e[C" forward-word
#bindkey "\e\e[D" backward-word


export PROMPT='%{%B%F{cyan}%}[%n@%2m %~%{%b%}]%{%F{yellow}%}%1v%{%f%} %{%F{red}%}%(?..(%?%))%{%f%}
$ '

alias ll='ls -l'
