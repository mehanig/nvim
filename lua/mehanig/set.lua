vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

if vim.fn.has('macunix') then
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Define the function to run the current file based on its extension
function _G.run_file()
    local filetype = vim.bo.filetype
    local cmd = ""

    if filetype == "python" then
        cmd = "python3 " .. vim.fn.expand('%')
    elseif filetype == "sh" then
        cmd = "bash " .. vim.fn.expand('%')
    elseif filetype == "javascript" then
        cmd = "node " .. vim.fn.expand('%')
    else
        print("No run command configured for filetype: " .. filetype)
        return
    end

    vim.cmd("w")
    vim.cmd("!" .. cmd)
end

-- Map the function to a key, for example F5
vim.api.nvim_set_keymap('n', '<F5>', ':lua _G.run_file()<CR>', { noremap = true, silent = true })
