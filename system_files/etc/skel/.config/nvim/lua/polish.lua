-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Move by visual lines instead of logical ones
vim.api.nvim_set_keymap("n", "<Down>", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Down>", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Up>", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Down>", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "<Up>", "gk", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "k", "gk", { noremap = true, silent = true })
