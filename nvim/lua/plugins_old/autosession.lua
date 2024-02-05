local utils = require("config.utils")
local auto_session = utils.must_require("auto-session")

auto_session.setup({
    log_level = "error",
    auto_session_use_git_branch = true,
})
