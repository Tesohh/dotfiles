local omni_lsp_command = ""
if vim.loop.os_uname().sysname == "Darwin" then
	omni_lsp_command = "/Users/tesohh/dev/omniscience/target/debug/lsp"
elseif vim.loop.os_uname().sysname == "Linux" then
	omni_lsp_command = "/home/tesohh/dev/omniscience/target/debug/lsp"
end

return {
	cmd = { omni_lsp_command },
	filetypes = { "typst" },
	root_markers = { "omni.toml", ".git" },
	settings = {},
}
