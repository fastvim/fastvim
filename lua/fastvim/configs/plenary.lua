local Job = require("plenary.job")

local PlenaryUtils = {}

function PlenaryUtils.run_job(opts)
    if not opts.command or type(opts.command) ~= "string" then
        error("PlenaryUtils.run_job: 'command' must be a valid string")
    end

    Job:new({
        command = opts.command,
        args = opts.args or {},
        cwd = opts.cwd or vim.fn.getcwd(),
        on_start = opts.on_start or function()
            vim.schedule(function()
                vim.notify("Starting job: " .. opts.command, vim.log.levels.INFO)
            end)
        end,
        on_exit = function(job, return_val)
            if return_val == 0 then
                if opts.on_success then
                    opts.on_success(job:result())
                else
                    vim.schedule(function()
                        vim.notify("Job completed: " .. opts.command, vim.log.levels.INFO)
                    end)
                end
            else
                if opts.on_error then
                    opts.on_error(job:stderr_result())
                else
                    vim.schedule(function()
                        vim.notify("Job failed: " .. opts.command, vim.log.levels.ERROR)
                    end)
                end
            end
        end,
    }):start()
end

return PlenaryUtils