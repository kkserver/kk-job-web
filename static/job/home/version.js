
kk.page().onview(/\/[0-9]*/i,{

	url : "version.html",
	container: "#kk-page",
	onload : function(view,options) {

		var version = "0"

		this.path.replace(/\/([0-9]*)/i,function(text,v){
			version = v
		});

		$.get("/job/api/version/log.json",{ jobId:ui.url.queryValue("id"),version:version,limit: 500},function(data){

			if(data && data.logs) {
				view.set("logs",data.logs);
			}
			else {
				view.set("logs",[]);
			}

		},"json");

		$.get("/job/api/version/get.json",{ jobId:ui.url.queryValue("id"),version:version},function(data){

			if(data && data.version) {

				var options = [];
				var optionsMap = {};

				if(page && page.job && page.job.options){
					var v = JSON.parse(page.job.options);
					if(typeof v == "object") {
						for(var key in v) {
							var option = v[key];
							optionsMap[key] = option
							option["key"] = key;
							options.push(option)
						}
					}
				}

				if(data && data.version && data.version.options) {
					var v = JSON.parse(data.version.options);
					if(typeof v == "object") {
						for(var key in v) {
							var option = optionsMap[key];
							if(option) {
								option.value = v[key];
							} 
						}
					}
				}

				view.set("options",options);
			}
			else {
				view.set("options",[]);
			}

		},"json");

	}
});
