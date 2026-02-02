abbr -a s 'ls'

abbr -a gs 'git status'
abbr -a ga 'git add --all'
abbr -a gad 'git add'
abbr -a gc 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gcm 'git commit'
abbr -a gca 'git commit --amend'
abbr -a gq 'git pull'
abbr -a gk 'git reset'
abbr -a gkh 'git reset --hard'
abbr -a gkha 'git reset --hard HEAD^'
abbr -a gp 'git push'
abbr -a gg 'git switch'
abbr -a ggo 'git switch -c'
abbr -a grs 'git restore --staged'
abbr -a grc 'git rm --cached'
abbr -a gr 'git restore'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gda 'git diff HEAD^'
abbr -a gm 'git merge'
abbr -a gl 'git log'
abbr -a gll 'git log --graph --oneline --decorate'
abbr -a gt 'git stash'
abbr -a gtp 'git stash pop'
abbr -a gcl 'git clone'
abbr -a gcl1 'git clone --depth=1'
abbr -a gsmu 'git submodule update --init --recursive'

abbr -a g 'git'
abbr -a p 'python'
abbr -a b "$EDITOR"
abbr -a v "$PAGER"

abbr -a fish-reload-config "source $__fish_config_dir/config.fish"
abbr -a fish-edit-config "$EDITOR $__fish_config_dir/config.fish"

abbr -a t 'projectdo test'
abbr -a r 'projectdo run'
abbr -a m 'projectdo build'
