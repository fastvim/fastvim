config = function()
		local cppman = require"cppman"
		cppman.setup()


		vim.keymap.set("n", "<C-j>", function()
			cppman.open_cppman_for(vim.fn.expand("<cword>"))
		end)

		-- Open search box
		vim.keymap.set("n", "<C-b>", function()
			cppman.input()
		end)

	end
