
local job = {}
local kk = require("kk")
local conf = require("conf/job")
local table = require("table")

return function(req,uri,data) 

	local resp,err = req:http({ url = conf.baseURL .. uri, headers = { ["Content-Type"] = "text/json" }, body = kk.json.encode(data) ,method = "POST" })

	if err then
		return { errno = 0xf000 , errmsg = err }
	else
		return json.decode(resp.body)
	end

end

