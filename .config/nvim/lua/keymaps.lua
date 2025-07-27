-- Horizontal movement
local M = {}

function M.apply_horizontal_movement()
	vim.keymap.set({ "n", "x", "o" }, "H", "^") -- go to the first char
	vim.keymap.set({ "n", "x", "o" }, "L", "g_") -- go to the last char
end

-- Navigation
function M.apply_navigation()
	vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", "<C-S-6>") -- alternate file
	vim.keymap.set("n", "-", "<CMD>Oil<CR>") -- open oil / go to parent dir
end

-- Windows
function M.apply_windows()
	vim.keymap.set({ "n", "x" }, "<C-h>", "<C-w>h")
	vim.keymap.set({ "n", "x" }, "<C-j>", "<C-w>j")
	vim.keymap.set({ "n", "x" }, "<C-k>", "<C-w>k")
	vim.keymap.set({ "n", "x" }, "<C-l>", "<C-w>l")
end

-- Pickers
function M.apply_pickers()
	vim.keymap.set({ "n", "x" }, "<leader>f", MiniPick.builtin.files)
	vim.keymap.set({ "n", "x" }, "<leader>sw", MiniPick.builtin.grep_live)
	vim.keymap.set({ "n", "x" }, "<leader>ss", function()
		MiniExtra.pickers.lsp({ scope = "document_symbol" })
	end)
	vim.keymap.set({ "n", "x" }, "<leader>S", function()
		MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
	end)
end

-- LSP
function M.apply_lsp()
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Go if err" })
end

-- Tools
function M.apply_tools()
	vim.keymap.set({ "n", "x" }, "<leader>gs", "<cmd>Neogit kind=vsplit<CR>")
end

return M
