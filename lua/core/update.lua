local Job = require('plenary.job')

local M = {}
local function check_updates(branch, callback)
    local cwd = vim.fn.stdpath('config')

    if branch == 'stable' then
      -- For the "stable" branch, we look for the latest release tag
        Job:new({
            command = 'git',
            args = { 'fetch', '--tags' },
            cwd = cwd,
            on_exit = function(_, fetch_return_val)
                if fetch_return_val == 0 then
                    Job:new({
                        command = 'git',
                        args = { 'describe', '--tags', '--abbrev=0' },
                        cwd = cwd,
                        on_exit = function(job, describe_return_val)
                            if describe_return_val == 0 then
                                local latest_release = job:result()[1]
                                Job:new({
                                    command = 'git',
                                    args = { 'rev-list', '--count', 'HEAD..' .. latest_release },
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
                                                vim.notify('Failed to check updates for stable release.', vim.log.levels.ERROR)
                                            end)
                                        end
                                    end,
                                }):start()
                            else
                                vim.schedule(function()
                                    vim.notify('Failed to get the latest release tag.', vim.log.levels.ERROR)
                                end)
                            end
                        end,
                    }):start()
                else
                    vim.schedule(function()
                        vim.notify('Failed to fetch updates for stable release.', vim.log.levels.ERROR)
                    end)
                end
            end,
        }):start()
    else
    -- For the "main" branch, we fetch the difference of commits as it was
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
                        if branch == 'stable' then
                            -- For "stable", let's get the last tag
                            Job:new({
                                command = 'git',
                                args = { 'checkout', 'tags/$(git describe --tags --abbrev=0)' },
                                cwd = cwd,
                                on_exit = function(_, tag_checkout_return_val)
                                    if tag_checkout_return_val == 0 then
                                        vim.schedule(function()
                                            vim.notify('FastVim successfully updated to the latest stable release.', vim.log.levels.INFO)
                                        end)
                                    else
                                        vim.schedule(function()
                                            vim.notify('Failed to checkout the latest stable release.', vim.log.levels.ERROR)
                                        end)
                                    end
                                end,
                            }):start()
                        else
                            -- For "main", we will pull normally
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
                        end
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
