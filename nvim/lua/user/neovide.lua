if vim.g.neovide then
    print("Neovide up and running")
    -- vim.o.guifont="Fira Mono:h17"
    -- vim.o.guifont = "IBM Plex Mono:h16"
    vim.o.guifont = "Inconsolata:h17"
    vim.g.neovide_input_use_logo = true
    -- vim.g.neovide_input_macos_alt_is_meta = false
    -- vim.g.neovide_scale_factor = 1.4
    vim.cmd [[
    noremap <D-s>  :w<CR>
    noremap <D-c>  y
    noremap <D-v>  hp   
    ]]
end

-- vim.cmd [[
-- let g:neovide_input_use_logo=v:true
--     if exists("g:neovide")
--        set guifont=Fira\ Mono:h16.5
--        let g:neovide_input_use_logo = v:true
--        let g:neovide_input_macos_alt_is_meta = v:false
--        let g:neovide_scale_factor = 1.4
--     endif
-- ]]
