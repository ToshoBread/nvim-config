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

		if type(mod[1]) == "string" then
			for k in pairs(mod) do
				if type(k) == "string" then
					mod = { mod }
					break
				end
			end
		end

		for _, spec in ipairs(mod) do
			if type(spec) == "string" then
				vim.schedule(function()
					vim.notify("Plugin: " .. name .. " has no config, skipping.", vim.log.levels.WARN)
				end)
				goto continue
			end

			if type(spec) == "table" and spec[1] then
				local has_config = false
				for k in pairs(spec) do
					if type(k) == "string" then
						has_config = true
						break
					end
				end

				if not has_config then
					vim.schedule(function()
						vim.notify("Plugin: " .. name .. " has no config keys, skipping.", vim.log.levels.WARN)
					end)
					goto continue
				end

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
