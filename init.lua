-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.guifont = "RobotoMono Nerd Font Mono:h12"
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 12

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Delete without copy
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("x", "d", '"_d', { noremap = true })
vim.keymap.set("n", "D", '"_D', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })

-- vim.keymap.set('n', 'o', 'o<Esc>')
-- vim.keymap.set('n', 'O', 'O<Esc>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>o", "o<C-c>", { desc = "Add line under" })
vim.keymap.set("n", "<leader>O", "O<C-c>", { desc = "Add line over" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

-- vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<Enter>', { desc = 'Toggle Nvim Tree', noremap = true, silent = true })

vim.keymap.set("n", "<leader>bv", ":vsplit<CR>", { desc = "Buffer Vertical Split", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", ":split<CR>", { desc = "Buffer Horizontal Split", noremap = true, silent = true })

vim.keymap.set("n", "<leader>bp", ":BufferPin<CR>", { desc = "Buffer Pin", noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", ":BufferRestore<CR>", { desc = "Buffer Restore", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferClose<CR>", { desc = "Buffer Close", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>ba",
	":BufferCloseAllButCurrentOrPinned<CR>",
	{ desc = "Buffer Close all but current/pinned", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>bh",
	":BufferMovePrevious<CR>",
	{ desc = "Buffer Move left", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>bl", ":BufferMoveNext<CR>", { desc = "Buffer Move right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bb", ":BufferPick<CR>", { desc = "Buffer Pick", noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", ":BufferPrevious<CR>", { desc = "previous tab", noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", ":BufferNext<CR>", { desc = "next tab", noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<leader>gs",
	":Gitsigns stage_buffer<CR>",
	{ desc = "git stage buffer", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>gr",
	":Gitsigns reset_buffer<CR>",
	{ desc = "git reset buffer", noremap = true, silent = true }
)
-- vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { desc = 'Open Copilot panel', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { desc = 'Copilot disable', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { desc = 'Copilot enable', noremap = true, silent = true })
vim.keymap.set("n", "<leader>gn", ":NvimTreeRefresh<CR>", { desc = "Refresh Nvim Tree", noremap = true, silent = true })

vim.keymap.set("n", "<A-H>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-J>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-K>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-L>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup("plugins")
-- require("lazy").setup({
--   spec = plugins,
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "habamax" } },
--   -- automatically check for plugin updates
--   checker = { enabled = true },
-- })
--
