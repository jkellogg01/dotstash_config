vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

-- this is kinda unnecessary since i _never_ use splits
-- but any day now, i might start!
-- (i won't)
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "> ",
	trail = "*",
}

-- haven't actually noticed the difference with this but I like it in theory
vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.tabstop = 4
-- uncomment the following if you don't plan on using sleuth anymore
-- vim.opt.expandtab = false
-- or set it to true, I don't care. I'm not your dad.
-- Go enforces tabs anyways so I don't really care much.

vim.opt.hlsearch = false

-- THUS BEGINS THE KEYMAPS PART

local function callbackExplore(dir)
	return function()
		vim.cmd({ cmd = "Explore", args = { dir } })
	end
end

vim.keymap.set("n", "<leader>xf", callbackExplore(), { desc = "E[x]plore [F]iles" })
vim.keymap.set("n", "<leader>xp", callbackExplore(vim.fn.getcwd()), { desc = "E[x]plore [P]roject" })
vim.keymap.set("n", "<leader>xn", callbackExplore(vim.fn.stdpath("config")), { desc = "E[x]plore [N]eovim" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- prevent sillies from using arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- THUS BEGINS THE AUTOCOMMANDS PART

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("hl-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("config.lazy")
