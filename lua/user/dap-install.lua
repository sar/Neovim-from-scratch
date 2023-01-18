--local dap_install, status_ok = pcall(require, "dap-install")
--if not status_ok then
--    return
--end

local dap_install = require('dap-install')

-- config:debuggers
dap_install.config("dnetcs", {})

