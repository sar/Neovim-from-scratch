local status_ok, feline = pcall(require, "feline")
if not status_ok then
  return
end

-- BUG: not instantiated
-- feline.setup {}

local opts = {
  preset = "noicon",
  theme = {
    bg = '#000000',
    fg = '#040404',
  },
}

return opts

