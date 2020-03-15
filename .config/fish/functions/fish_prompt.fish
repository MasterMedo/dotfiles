# Defined in /home/medo/.config/fish/functions/fish_prompt.fish @ line 2

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
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

  if set -q VIRTUAL_ENV
    set venv "$magenta (" (basename "$VIRTUAL_ENV") ")"
  else
    set venv ""
  end

  if [ (_git_branch_name) ]
    set -l git_branch $cyan(_git_branch_name)
    set git_info " $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $venv $user ' ' $cwd $git_info $normal ' '
end
