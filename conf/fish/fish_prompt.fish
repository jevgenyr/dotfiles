function fish_prompt	
  if not set -q -g __fish_minimalist_functions_defined
    set -g __fish_minimalist_functions_defined

    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end
	
    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end
  end

  set -l yellow (set_color -o yellow)
  set -l blue (set_color -o blue)
  set -l purple (set_color -o purple)
  set -l normal (set_color normal)

  if [ (_git_branch_name) ]
    set -l git_branch $purple(_git_branch_name)
    set git_info "$normal ( $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  set_color $fish_color_cwd
  echo -n (basename $PWD)
  echo -n $git_info
  set_color normal
  echo -n ' ) '
end
