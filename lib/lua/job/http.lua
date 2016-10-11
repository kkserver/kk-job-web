
local job = {}
local kk = require("kk")
local conf = require("conf/job")
local table = require("table")

return function(uri,data) 
	ngx.log(ngx.ALERT,'[HTTP] '..conf.baseURL .. uri)
	return kk.http.json(conf.baseURL .. uri,data)
end

