---Auto set noremap and silent on remaps, allowing for extended config
---@param mode string | table n|v|i|t|x
---@param lhs string Key map to press
---@param rhs string | function Command to be executed
---@param opts table Options table
function Remap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

---Temporarily change colorscheme
---@param theme string Theme name
function ChangeTheme(theme)
	vim.cmd.colorscheme(theme)
end

---Check if plugin exists in specs by name
---@param name string Plugin name from spec (e.g. "nvim-jdtls")
---@return boolean
local function plugin_exists(name)
	local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
	for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
		if file:match("%.lua$") then
			local mod = require("plugins." .. file:gsub("%.lua$", ""))
			if type(mod) == "table" then
				for _, spec in ipairs(mod) do
					if type(spec) == "table" and spec[1] then
						local plugin_name = spec[1]:match("/(.+)$") or spec[1]
						if plugin_name == name then
							return true
						end
					end
				end
			end
		end
	end
	return false
end

--- Toggle plugins
---@param plugin string Actual name of the plugin
function TogglePlugin(plugin)
	if not plugin_exists(plugin) then
		vim.notify("Plugin not found: " .. plugin, vim.log.levels.ERROR)
		return
	end

	local path = vim.fn.stdpath("config") .. "/lua/disabled.lua"
	local content = io.open(path):read("*a")

	local list = {}
	for name in content:gmatch('"%s*([^",]+)%s*"') do
		table.insert(list, name)
	end

	local found = false
	for i, name in ipairs(list) do
		if name == plugin then
			table.remove(list, i)
			found = true
			break
		end
	end

	if not found then
		table.insert(list, plugin)
	end

	local new_disabled = "return {\n"
	for _, name in ipairs(list) do
		new_disabled = new_disabled .. '"' .. name .. '",\n'
	end

	new_disabled = new_disabled .. "}"

	content = content:gsub("return %b{}", new_disabled)
	io.open(path, "w"):write(content)

	local state = found and "enabled" or "disabled"
	vim.notify(plugin .. " " .. state .. ". Restart to apply.", vim.log.levels.INFO)
end
