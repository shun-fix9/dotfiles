if [ "$PS1" ]; then
	. $HOME/plugins/mybashrc/bin/mybashrc.sh
	if [ "$(which direnv)" ]; then
		eval "$(direnv hook bash)"
	fi
fi
