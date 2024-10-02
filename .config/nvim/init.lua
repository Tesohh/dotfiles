vim.g.mapleader = " "

if vim.loop.os_uname().sysname == "Darwin" then
    vim.cmd([[language en_US]])
end

if vim.g.vscode then
    require("vsc.keymaps")
    require("vsc.opts")
else
    -- ordinary Neovim
    require("nv.opts")
    require("nv.lazy")
    require("nv.keymaps")
    require("nv.tms")
    require("nv.runner")
    require("nv.highlightyank")
    require("nv.loadsnippets")
    require("nv.fixhttp")
end
