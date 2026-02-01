if status is-interactive

    fish_add_path ~/.local/bin
    fish_add_path ~/.cargo/bin

    if command -sq direnv
        direnv hook fish | source
    end
    if command -sq atuin
        atuin init fish --disable-up-arrow | source
    end

    function fish_greeting
        echo "
$(set_color red) 88888$(set_color yellow)888b oo          $(set_color green)dP       
$(set_color red) 88                    $(set_color cyan)88       
$(set_color red)a88$(set_color yellow)aaaa    $(set_color green)dP .d8888b$(set_color cyan). 8$(set_color blue)8d888$(set_color magenta)b. 
$(set_color red) 88        $(set_color green)88 Y$(set_color cyan)8ooooo. $(set_color blue)88'  $(set_color magenta)`88 
$(set_color red) 8$(set_color yellow)8        $(set_color green)8$(set_color cyan)8       8$(set_color blue)8 88    $(set_color magenta)88 
$(set_color yellow) dP        $(set_color cyan)dP `88888$(set_color blue)P' dP    $(set_color magenta)dP $(set_color normal)
        "
        echo "       $(set_color green)$(date +%Y/%m/%d)$(set_color normal) $(set_color yellow)$(date +%H:%M)$(set_color normal)"
        echo
    end

    fish_vi_key_bindings
    if false; fish_default_key_bindings; end
    bind -M insert ctrl-p up-or-search
    bind -M insert ctrl-n down-or-search
    bind -M insert ctrl-a beginning-of-line
    bind -M insert ctrl-e end-of-line
    bind -M insert ctrl-f forward-bigword forward-single-char
    bind -M insert ctrl-b backward-bigword
    bind -M visual ctrl-a beginning-of-line
    bind -M visual ctrl-e end-of-line
    bind -M visual ctrl-f forward-bigword forward-single-char
    bind -M visual ctrl-b backward-bigword
    bind -M default ctrl-e end-of-line
    bind -M default ctrl-f forward-bigword forward-single-char
    bind -M default ctrl-b backward-bigword
    bind -M insert ctrl-t transpose-words
    bind -M insert ctrl-/ undo
    bind -M insert alt-/ redo
    bind -M insert alt-u upcase-word
    bind -M insert alt-c capitalize-word
    bind -M default ctrl-r redo

    source $__fish_config_dir/env.fish
    source $__fish_config_dir/alias.fish

    abbr -a fish-reload-config 'source $__fish_config_dir/config.fish'
    abbr -a fish-edit-config '$EDITOR $__fish_config_dir/config.fish'

    abbr -a m --function projectdo_build
    abbr -a r --function projectdo_run
    abbr -a t --function projectdo_test
    abbr -a tool --function projectdo_tool

end
