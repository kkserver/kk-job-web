
local job = require("job/job")
local table = require("table")

return function(page)

	local data,_ = job.http("job/get",page.values)

	if data and data.job then
		
		page.job = data.job

		data,_ = job.http("job/version/query",{ jobId = data.job.id , maxVersion = "-1", limit="100" })

		if data and data.versions then

			page.versions = require("job/version/item")(data.versions)

		end
	else
		page.job = {}
	end

end
