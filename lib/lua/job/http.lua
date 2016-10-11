
local job = {}
local kk = require("kk")
local conf = require("conf/job")
local table = require("table")

return function(uri,data) 
	
	ngx.log(ngx.ALERT,"===="..ngx.var.remote_addr.."====\n")

	local body = "{}"

	if type(data) == "table" and table.getn(data) > 0 then
		body = kk.json.encode(data)
	end

	local cookie = nil

	local headers = ngx.req.get_headers()

	ngx.log(ngx.ALERT,"===="..kk.json.encode(headers).."====\n")
	ngx.log(ngx.ALERT,"===="..headers["Cookie"].."====\n")

	if headers ~= nil then
		cookie = headers["Cookie"]
	end

	headers = { ["Content-Type"] = "text/json", ["X-CLIENT-IP"] = ngx.var.remote_addr }

	if cookie then
		headers["Cookie"] = cookie
	end

	local resp = kk.http.post(conf.baseURL .. uri, { headers = headers , body = body })

	if resp then
		if resp.header then
			cookie = resp.header["Set-Cookie"]
			if cookie then
				ngx.header["Set-Cookie"] = cookie
			end
		end
		if type(resp.body) == 'string' then
			return kk.json.decode(resp.body), resp.status
		else
			return nil, resp.status
		end
	end

	return nil,500
	
end

