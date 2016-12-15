
return function(page)
	local job = require("job/job")
	local data,_ = job.http("job/version/log/pull",page.data)
	return data
end
