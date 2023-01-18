local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neotree.branch = "v1.x"

neotree.requires = {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
}

neotree.setup {
  filesystem = {
    follow_current_file = true,
    filters = {
      show_hidden = true,
    },
  },
}

