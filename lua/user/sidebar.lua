local status_ok, sidebar = pcall(require, "sidebar")
if not status_ok then
  return
end

sidebar.setup {
  open = true,
  side = "right",
  initial_width = 35,
  hide_statusline = true,
  sections = { "git", "diagnostics", "todos", "buffers", "symbols" },
}

