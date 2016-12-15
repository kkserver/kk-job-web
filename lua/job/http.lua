
local job = {}
local kk = require("kk")
local conf = require("conf/job")
local table = require("table")

return function(uri,data) 
	return http.send({ url = conf.baseURL .. uri, headers = { ["Content-Type"] = "text/json" }, body = kk.json.encode(data) })
end

