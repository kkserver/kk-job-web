
local job = require("job/job")
local table = require("table")

return function(page)

	local data = job.http(page,"job/get",page.values)

	if data and data.job then
		page.job = data.job
	else
		page.job = {}
	end

end
