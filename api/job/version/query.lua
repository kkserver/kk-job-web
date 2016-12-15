
return function(page)
	local job = require("job/job")
	local data,_ = job.http("job/version/query",page.data)
	if data and data.versions then
		data.versions = require("job/version/item")(data.versions)
	end
	return data
end
