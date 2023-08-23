local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    icons_enabled = false,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 0,
}

local colors = {
    blue = "#80a0ff",
    red = "#ff5189",
    black = "#000000",
    white = "#ffffff",
    orange = "#ff500a",
    green = "#32cd32",
    grey = "#080808",
}

local black_theme = {
    normal = {
        a = { fg = colors.gray, bg = colors.black }
    },

    insert = { a = { fg = colors.black, bg = colors.orange } },
    visual = { a = { fg = colors.black, bg = colors.green } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
    }
}

local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    -- return chars[index]
    return math.ceil(line_ratio * 100)
end

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = black_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode, location },
        lualine_b = { diagnostics },
        lualine_c = { tabs, lsp_progress },
        lualine_x = { spaces, "encoding", "fileformat", filetype },
        lualine_y = { diff, branch },
        lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
