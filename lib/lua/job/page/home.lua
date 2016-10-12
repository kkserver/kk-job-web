
local job = require("job/job")

return function(page)

	local data,_ = job.http("job/get",ngx.req.get_uri_args())

	if data and data.job then
		
		page.job = data.job

		data,_ = job.http("job/version/query",{ jobId = data.job.id , maxVersion = "100"})

		if data and data.versions then
			page.versions = data.versions
		end
	else
		page.job = {}
	end

end
