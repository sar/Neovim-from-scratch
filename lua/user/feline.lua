local status_ok, feline = pcall(require, "feline")
if not status_ok then
  return
end

local opts = {
  theme = {
    bg = '#000000',
    fg = '#040404',
  },
}

feline.setup(opts)
