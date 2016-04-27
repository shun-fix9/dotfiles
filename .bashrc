if [ "$PS1" ]; then
	. $HOME/plugins/mybashrc/bin/mybashrc.sh
	eval "$(direnv hook bash)"
fi
