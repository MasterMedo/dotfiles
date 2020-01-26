function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  set -l show_untracked (git config --bool bash.showUntrackedFiles)
  set untracked ''
  if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
    set untracked '--untracked-files=no'
  end
  echo (command git status -s --ignore-submodules=dirty $untracked 2> /dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
	set -l magenta (set_color -o magenta)
  set -l normal (set_color normal)

  set -l cwd (basename (prompt_pwd))

  if test $last_status = 0
      set cwd "$green$cwd"
  else
      set cwd "$magenta$cwd"
  end

	if test $USER = "root"
		set user "$magenta root"
	else
		set user ""
	end

  if [ (_git_branch_name) ]
    set -l git_branch $cyan(_git_branch_name)
    set git_info " $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $user ' ' $cwd $git_info $normal ' '
end
