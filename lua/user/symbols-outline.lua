local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
  return
end

-- BUG: setup config not registered
symbols_outline.after = "nvim-lspconfig"
symbols_outline.setup { }

local options = {
  position = "right",
  width = 24,
  relative_width = false,
  auto_close = false,
  show_numbers = false,
  auto_preview = false,
}

return options

