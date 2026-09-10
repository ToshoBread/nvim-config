return function(dir)
	local disabled = {}

	for _, name in ipairs(require("disabled")) do
		disabled[name] = true
	end

	local specs = {}
	for _, name in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. dir)) do
		if not name:match("%.lua$") then
			goto continue
		end

		local mod = require(dir .. "." .. name:gsub("%.lua$", ""))
		if type(mod) ~= "table" then
			goto continue
		end

		for _, spec in ipairs(mod) do
			if type(spec) == "table" and spec[1] then
				local plugin = spec[1]:match("/(.+)$") or spec[1]
				if disabled[plugin] then
					spec.cond = false
				end
			end
			table.insert(specs, spec)
		end
		::continue::
	end

	return specs
end
