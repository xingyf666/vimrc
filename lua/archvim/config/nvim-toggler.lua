require'nvim-toggler'.setup{
    remove_default_keybinds = true,
    remove_default_inverses = false,
    autoselect_longest_match = false,
}

vim.keymap.set({ 'n', 'v' }, '<C-n>', require('nvim-toggler').toggle)
