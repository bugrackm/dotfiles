require("xaden.set")
require("xaden.remap")
require("xaden.lazy_init")
require("xaden.layout")

if vim.fn.has("mac") == 1 then
	require("xaden.macos")
end
