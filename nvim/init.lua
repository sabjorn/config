require('set')
require('plugins')
--
-- Colorscheme
vim.cmd('colorscheme onedark')


-- Autocmds
vim.cmd [[
  autocmd FileType c,cpp,objc,objcpp lua require'rainbow'.load()
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteTags
  autocmd FileType tex set syntax=tex
  autocmd BufNewFile,BufRead *.tex set syntax=tex
  autocmd BufNewFile,BufRead *.cls set syntax=tex
]]

-- Additional configurations for LaTeX, Git, etc.
vim.g.vimtex_view_method = 'skim'
vim.g.airline_extensions_branch_enabled = 1

-- Automatically open NERDTree when starting Neovim without any file or directory arguments
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        if #vim.fn.argv() == 0 then
            vim.cmd("NERDTree")
        end
    end
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "python", -- This line ensures the Python parser is installed
}
-- vim.g.blamer_enabled = true

-- move to own file eventually
-- mappings navigate to the previous and next diagnostic messages
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, {silent = true})
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, {silent = true})

-- dap
vim.keymap.set('n', 'gr', function()
    require('telescope.builtin').lsp_references({ jump_type = "never" })
end, {silent = true})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {silent = true})
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, {silent = true})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {silent = true})
--vim.keymap.set('n', 'gr', vim.lsp.buf.references, {silent = true})
