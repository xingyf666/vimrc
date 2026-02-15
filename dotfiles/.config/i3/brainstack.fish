#!/usr/bin/env fish

set shot_dir ~/.local/state/brainstack/screenshots
set log_file ~/.local/state/brainstack/entries.log

function add_entry
    set date_time $argv[1]
    set text $argv[2]
    set shot_path $argv[3]
    printf "%s\t%s\t%s\n" $date_time $text $shot_path >>$log_file
end

function menu
    if not test -f $log_file
        notify-send "brainstack" "No entries found"
        return 1
    end

    set entries (tac $log_file)
    set display_lines (printf "%s\n" $entries | awk -F'\t' '{print $1 " | " $2}')
    set selected (printf "%s\n" $display_lines | rofi -dmenu -p brainstack -format i)
    
    if test -z "$selected"
        return 0
    end

    set entry (printf "%s\n" $entries | sed -n (math $selected + 1)"p")
    set date_time (echo $entry | cut -f1)
    set text (echo $entry | cut -f2)
    set shot_path (echo $entry | cut -f3)

    set action (printf "Open Screenshot\nDelete Entry\nCopy Text\n" | rofi -dmenu -p action)
    
    switch $action
        case "Open Screenshot"
            feh -F $shot_path
        case "Delete Entry"
            set total_lines (wc -l <$log_file)
            set target_line (math $total_lines - $selected)
            sed -i $target_line"d" $log_file
            rm -f $shot_path
            notify-send "brainstack" "Entry deleted: $text"
        case "Copy Text"
            echo -n $text | xclip -selection clipboard
            notify-send "brainstack" "Text copied: $text"
    end
end

function main
    if test "$argv[1]" = menu
        menu
        return
    end

    set text (echo -n | rofi -dmenu -p brainstack | tr '\t' ' ' | string trim)
    if test -z "$text"
        return 1
    end
    set shot_name (date +"%Y-%m-%d_%H-%M-%S.jpg")
    set date_time (date +"%m-%d %H:%M")
    test -d $shot_dir; or mkdir -p $shot_dir
    set shot_path $shot_dir/$shot_name
    scrot $shot_path
    add_entry $date_time $text $shot_path
end

main $argv
