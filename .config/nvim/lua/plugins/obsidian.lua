require("obsidian").setup({
    legacy_commands = false,
    workspaces = {
        {
            name = "personal",
            path = "~/Documents/personal",
        },
        {
            name = "work",
            path = "~/Documents/work",
        },
    },
})
