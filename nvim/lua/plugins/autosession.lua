return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            auto_session_use_git_branch = true,
            auto_restore_lazy_delay_enabled = true,
            pre_restore_cmds = {
                function() require('statuscol') end,
            },
        })
    end,
}
