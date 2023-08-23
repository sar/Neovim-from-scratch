local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
    return
end
local run_root = "/blade0/pub.dev/nvim-config/.nvim/"

neotree.branch = "v2.x"

neotree.requires = {
    run_root .. "plenary.nvim",
    run_root .. "nui.nvim",
}

local opts = {
    enable_git_status = true,  -- BUG: debounce cpu%
    git_status_async = true,
    enable_diagnostics = true,
    window = {
        width = 40,
        position = "left",
    },
    filesystem = {
        hijack_netrw_behavior = "open_default",
        follow_current_file = true,
        group_empty_dirs = false,
        buffers = {
            follow_current_file = true,
            group_empty_dirs = false,
            show_unloaded = true,
        },
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
            hide_by_name = {
                "node_modules",
                "__pycache__",
            }
        },
        find_command = "fd",
        find_args = {
            fd = {
                "--exclude", ".git",
                "--exclude", "node_modules",
            },
        },
    },
    git_status = {
        window = {
            position = "float",
        },
    },
}

neotree.setup(opts)
