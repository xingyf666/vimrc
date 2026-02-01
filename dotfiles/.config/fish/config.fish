if status is-interactive

fish_vi_key_bindings
fzf_configure_bindings
direnv hook fish | source

source $__fish_config_dir/env.fish
source $__fish_config_dir/alias.fish

abbr -a fish-reload-config "source $__fish_config_dir/config.fish"

end
