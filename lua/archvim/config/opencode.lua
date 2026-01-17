vim.g.opencode_opts = {
  -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
}

-- Required for `opts.events.reload`.
vim.o.autoread = true

-- Recommended/example keymaps.
vim.keymap.set({ "n", "x" }, "<C-p>a", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
vim.keymap.set({ "n", "x" }, "<C-p>s", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<C-p>p", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "zv",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
vim.keymap.set("n",          "zvv", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })

vim.keymap.set("n", "<C-p><C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
vim.keymap.set("n", "<C-p><C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })
vim.keymap.set("n", "<C-p><C-p>", "<C-p>", { noremap = true })



-- Handle `opencode` events
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "OpencodeEvent:*", -- Optionally filter event types
--   callback = function(args)
--     local event = args.data.event
--     local port = args.data.port
--
--     -- See the available event types and their properties
--     -- vim.notify(vim.inspect(event))
--     -- Do something useful
--     -- if event.type == "session.idle" then
--     --   vim.notify("OpenCode finished responding.")
--     -- end
--   end,
-- })

vim.g.opencode_opts = {
  provider = {
    enabled = "tmux",
    tmux = {
    }
  }
}
