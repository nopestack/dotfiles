return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                },
            },
        },
    },
}
