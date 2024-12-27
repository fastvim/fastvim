local Job = require('plenary.job')

local M = {}

local function check_updates(branch, callback)
    local cwd = vim.fn.stdpath('config')

    Job:new({
        command = 'git',
        args = { 'fetch', 'origin', branch },
        cwd = cwd,
        on_exit = function(_, fetch_return_val)
            if fetch_return_val == 0 then
                Job:new({
                    command = 'git',
                    args = { 'rev-list', '--count', 'HEAD..origin/' .. branch },
                    cwd = cwd,
                    on_exit = function(job, rev_return_val)
                        if rev_return_val == 0 then
                            local result = tonumber(job:result()[1] or "0")
                            if result > 0 then
                                callback(true, result)
                            else
                                callback(false, nil)
                            end
                        else
                            vim.schedule(function()
                                vim.notify('Failed to check updates for ' .. branch .. ' branch.', vim.log.levels.ERROR)
                            end)
                        end
                    end,
                }):start()
            else
                vim.schedule(function()
                    vim.notify('Failed to fetch updates for ' .. branch .. ' branch.', vim.log.levels.ERROR)
                end)
            end
        end,
    }):start()
end

local function update_branch(branch)
    local cwd = vim.fn.stdpath('config')

    check_updates(branch, function(has_updates, _)
        if has_updates then
            Job:new({
                command = 'git',
                args = { 'checkout', branch },
                cwd = cwd,
                on_exit = function(_, checkout_return_val)
                    if checkout_return_val == 0 then
                        Job:new({
                            command = 'git',
                            args = { 'pull', 'origin', branch },
                            cwd = cwd,
                            on_exit = function(_, pull_return_val)
                                if pull_return_val == 0 then
                                    vim.schedule(function()
                                        vim.notify('FastVim successfully updated to ' .. branch .. ' branch.', vim.log.levels.INFO)
                                    end)
                                else
                                    vim.schedule(function()
                                        vim.notify('Failed to pull the latest changes for ' .. branch .. ' branch.', vim.log.levels.ERROR)
                                    end)
                                end
                            end,
                        }):start()
                    else
                        vim.schedule(function()
                            vim.notify('Failed to switch to ' .. branch .. ' branch.', vim.log.levels.ERROR)
                        end)
                    end
                end,
            }):start()
        else
            vim.schedule(function()
                vim.notify('Your version is already up-to-date on the ' .. branch .. ' branch.', vim.log.levels.INFO)
            end)
        end
    end)
end

function M.update_to_latest()
    update_branch('main')
end

function M.update_to_stable()
    update_branch('stable')
end

vim.api.nvim_create_user_command('FastUpdate', function()
    M.update_to_latest()
end, {})

vim.api.nvim_create_user_command('FastStable', function()
    M.update_to_stable()
end, {})

return M

