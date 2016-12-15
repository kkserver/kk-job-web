
local job = require("job/job")
local table = require("table")

return function(page)

	local data,_ = job.http("job/get",page.values)

	if data and data.job then
		page.job = data.job
	else
		page.job = {}
	end

end
