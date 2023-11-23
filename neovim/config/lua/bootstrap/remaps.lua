local common = require("bootstrap.common")

common.run("remaps", function()
	vim.keymap.set("n", "<leader>xd", vim.cmd.Ex)
end)

