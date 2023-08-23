local status_ok, dap = pcall(require, "refactoring")
if not status_ok then
   return
end

refactoring.prompt_func_return_type = {
    go = true,
    cpp = true,
    c = true,
    java = true,
}

refactoring.prompt_func_param_type = {
    go = true,
    cpp = true,
    c = true,
    java = true,
}
