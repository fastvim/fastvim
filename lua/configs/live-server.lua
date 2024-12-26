local live_server = {}

live_server.setup = function()
    require('live-server').setup {
        args = { '--port=3333' } -- Default port configuration
    }
end

return live_server

