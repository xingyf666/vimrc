set -x TERMINAL kitty
set -x EDITOR nvim
set -x PAGE less

if command pgrep 'mihomo|clash' > /dev/null
    set -x https_proxy http://127.0.0.1:7897
    set -x http_proxy http://127.0.0.1:7897
    set -x all_proxy socks5://127.0.0.1:7897
end

set -l fzf_color_theme '--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#6C7086,label:#CDD6F4'
set -l fzf_preview_opts
if command -sq bat
    set fzf_preview_opts '--preview="bat --color=always --style=auto {}"'
end
set -x FZF_DEFAULT_OPTS $fzf_color_theme$fzf_preview_opts

if command -sq fd
    set -x FZF_DEFAULT_COMMAND 'fd --type f'
else
    set -u FZF_DEFAULT_COMMAND
end
