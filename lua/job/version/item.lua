
local table = require("table")

local fn = nil

fn = function(object) 
	
	if type(object) ~= "table" then
		return object
	end

	if object.id == nil then

		local vs = {}

		for _,v in pairs(object) do
			
			table.insert(vs,fn(v))

		end

		return vs
	else

		return {title = object.title, 
				jobId = object.jobId, 
				version = object.version, 
				status = object.status, 
				ctime = object.ctime,
				id = object.id}

	end

end

return fn

