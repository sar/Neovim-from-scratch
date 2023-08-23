local status_ok, dapui = pcall(require, "dap-ui")
if not status_ok then
   return
end

dapui.layouts = {
    {
        elements = {
            'scopes',
            'breakpoints',
            'stacks',
            'watches',
        },
        size = 40,
        position = 'left',
    },
    {
        elements = {
            'repl',
            'console',
        },
        size = 10,
        position = 'bottom',
    },
}

