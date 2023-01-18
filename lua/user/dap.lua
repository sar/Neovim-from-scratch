--local status_ok, dap = pcall(require, "dap")
--if not status_ok then
--    return
--end

local dap = require('dap')
local function pwd() return io.popen('pwd'):lines()() end

--#region properties
dap.defaults.fallback = {
    focus_terminal = true,
    terminal_win_cmd = '50vs new',
    force_external_terminal = true,
    external_terminal = {
        command = '/bin/sh',
        args = {'-c'},
    },
}
--#endregion

--#region netcoredbg
dap.adapters.netcoredbg = {
    type = 'executable',
    command = '/tmp/netcoredbg/netcoredbg',
    args = { 
        '--interpreter=vscode',
        string.format('--engineLogging=%s/netcoredbg.engine.log', XDG_CACHE_HOME),
        string.format('--log=%s/netcoredbg.log', XDG_CACHE_HOME),
    },
}

dap.configurations.cs = {
    {
        type = 'netcoredbg',
        name = 'launch - netcoredbg',
        request = 'launch',
        program = function ()
            -- local dll = io.open('find bin/Debug -maxdepth 2 -name "*.dll"')
            -- return pwd() .. '/' .. dll:lines()()
            -- prompt dll
            return vim.fn.input('Arg:DLL:path: ', vim.fn.getcwd() .. '/bin/Debug/net5.0/', 'file')
        end,
        stopAtEntry = false,
        console = 'integratedTerminal',
    },
    {
        type = 'netcoredbg',
        name = 'attach - netcoredbg',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
        stopAtEntry = false,
    }
}
--#endregion

