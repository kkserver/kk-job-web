
local job = {}
local kk = require("kk")
local conf = require("conf/job")
local table = require("table")

return function(uri,data) 
	local resp,err = http.send({ url = conf.baseURL .. uri, headers = { ["Content-Type"] = "text/json" }, body = kk.json.encode(data) })
	if err then
		return { errno = 0x9000, errmsg = err }
	end
	return resp
end

