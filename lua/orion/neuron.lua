require('neural').setup({
    ui = {
        animated_sign_enabled = true,
    },
    source = {
        openai = {
            api_key = vim.env.OPENAI_API_KEY,
        },
    },
})
