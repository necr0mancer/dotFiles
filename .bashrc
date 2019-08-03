#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

export VISUAL="vim"

#export PS1='[\u@\h \W]\$'
PS1='[ \u@\h: \w ] \$ '

alias ls="ls --color"
alias spotify="spotify --force-device-scale-factor=2"
# alias poe="wine /home/rob/.wine/drive_c/Program Files/Grinding Gear Games/Path of Exile/PathOfExile.exe -window"
alias poe="/home/rob/.local/share/lutris/runners/wine/tkg-4.6-x86_64/bin/wine /home/rob/Games/path-of-exile/drive_c/Program\ Files\ \(x86\)/Grinding\ Gear\ Games/Path\ of\ Exile/PathOfExile.exe"
alias steam="STEAM_RUNTIME=1 steam"


#function _update_ps1() {
#  PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
