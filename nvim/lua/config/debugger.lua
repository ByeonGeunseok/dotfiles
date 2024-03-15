local g = vim.g
local o = vim.o
local opt = vim.opt
local fn = vim.fn

local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")

-- dap.adapters.codelldb = {
--     type = "server",
--     port = "${port}",
--     executable = {
--         -- Change this to your path!
--         command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
--         args = {"--port", "${port}"},
--     }
-- }
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}" },
    },
}

dap.configurations.rust = {
    {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
            return fn.input("Path to executable: ", fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = true,
        terminal = "integrated",
        args = function()
            local args = {}
            local i = 1
            while true do
                local arg = fn.input("Argument [" .. i .. "]: ")
                if arg == "" then
                    break
                end
                args[i] = arg
                i = i + 1
            end
            return args
        end,
    },
    {
        name = "attach PID (codelldb)",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
    },
    {
        name = "Attach to Name (wait) (codelldb)",
        type = "codelldb",
        request = "attach",
        program = function()
            return fn.input("Path to executable: ", fn.getcwd() .. "/", "file")
        end,
        waitFor = true,
    },
}

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

dapui.setup()

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

