#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start x at login
if [[ ! $Display && XDG_VTNR -eq 1 ]]; then
				exec startx
fi
