
return function(page)
	local job = require("job/job")
	local data,_ = job.http("job/version/create",page.data)
	return data
end
