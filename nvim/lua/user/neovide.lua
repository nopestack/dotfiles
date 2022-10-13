if vim.g.neovide then
    print("Neovide up and running")
    -- vim.o.guifont="Fira Mono:h17"
    vim.o.guifont = "IBM Plex Mono:h15.6"
    vim.g.neovide_input_use_logo = true
    vim.g.neovide_input_macos_alt_is_meta = false
    vim.g.neovide_scale_factor = 1.4
end

-- vim.cmd [[
--     if exists("g:neovide")
--        set guifont=Fira\ Mono:h16.5
--        let g:neovide_input_use_logo = v:true
--        let g:neovide_input_macos_alt_is_meta = v:false
--        let g:neovide_scale_factor = 1.4
--     endif
-- ]]
