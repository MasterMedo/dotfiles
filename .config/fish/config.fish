# Start x at login

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

# cat ~/.cache/wal/sequences
if status is-interactive
  cat ~/.cache/wal/sequences
end

set fish_color_normal 'normal'
set fish_color_command 'brwhite' --bold
set fish_color_quote 'magenta'
set fish_color_redirection 'brred'
set fish_color_end '00d700'
set fish_color_error 'ff0000'
set fish_color_param 'cyan'
set fish_color_comment 'yellow'
set fish_color_match --background='white'
set fish_color_selection --background='brblack'
set fish_color_search_match --background='brblack'
set fish_color_operator 'green' --bold
set fish_color_escape 'brred' --bold
set fish_color_cwd 'green' --bold
set fish_color_autosuggestion 'brblack'
set fish_color_user 'magenta' --bold
set fish_color_host 'green' --bold
set fish_color_host_remote 'red' --bold
set fish_color_cancel 'ff0000' --bold
