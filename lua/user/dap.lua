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
    command = '/usr/local/sbin/netcoredbg',
    args = { 
        '--interpreter=vscode',
        string.format('--engineLogging=%s/netcoredbg.engine.log', XDG_CACHE_HOME),
        string.format('--log=%s/netcoredbg.log', XDG_CACHE_HOME),
    },
}

dap.configurations.cs = {
    {
        type = 'netcoredbg',
        name = 'launch (netcoredbg)',
        request = 'launch',
        program = function ()
            -- local dll = io.open('find bin/Debug -maxdepth 2 -name "*.dll"')
            -- return pwd() .. '/' .. dll:lines()()
            -- prompt dll
            return vim.fn.input('Arg:DLL:path: ', vim.fn.getcwd() .. '/bin/Debug/net7.0/', 'file')
        end,
        stopAtEntry = false,
        console = 'integratedTerminal',
    },
    {
        type = 'netcoredbg',
        name = 'attach (netcoredbg)',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
        stopAtEntry = false,
    }
}
--#endregion

-- #region cppdbg
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = 'OpenDebugAD7'
}

dap.adapters.codelldb = {
    id = 'codelldb',
    type = "server",
    port = "${port}",
    executable = {
        command = "/blade0/bin/codelldb/adapter/codelldb",
        args = { "--port", "${port}" }
    }
}

local setupCommands = {
    {
        text = '-enable-pretty-printing',
        description = 'format output',
        ignoreFailures = true,
    }
}

dap.configurations.cpp = {
    {
        name = "launch (cppdbg)",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = setupCommands,
    },
    {
        name = "attach (codelldb)",
        type = dap.adapters.codelldb.id,
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = setupCommands,
        -- preLaunchTask = "compile c++ with gdb flags"
    },
    {
        name = 'attach gdbserver:1234 (cppdbg)',
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        setupCommands = setupCommands,
    }
}

dap.configurations.c = dap.configurations.cpp;
-- #endregion

