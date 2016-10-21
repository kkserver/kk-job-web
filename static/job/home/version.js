
kk.page().onview(/\/[0-9]*/i,{

	url : "version.html",
	container: "#kk-page",
	onload : function(view,options) {

		var version = "0"

		this.path.replace(/\/([0-9]*)/i,function(text,v){
			version = v
		});

		var bcolor = {"40":"#000","41":"#f00","42":"#0f0","43":"#ff0","44":"#00f","45":"#f0f","46":"#0ff","47":"#fff"};
		var fcolor = {"30":"#000","31":"#f00","32":"#0f0","33":"#ff0","34":"#00f","35":"#f0f","36":"#0ff","37":"#fff"};

		$.get("/job/api/version/log.json",{ jobId:ui.url.queryValue("id"),version:version,limit: 500},function(text){

			text = text.replace(/\033\[([0-9]*)(;([0-9]*))?m/g,function(text,bkey,_fkey,fkey){
				
				if(_fkey === undefined && bkey == 0) {
					return "</span>"
				}

				if(_fkey === undefined) {
					return '<span style="color: ' + fcolor[bkey] + ';">';
				}

				return '<span style="background-color: ' + bcolor[bkey] + ';color: ' + fcolor[fkey] + ';">';
				
			});

			var data = JSON.parse(text)

			if(data && data.logs) {
				view.set("logs",data.logs);
			}
			else {
				view.set("logs",[]);
			}

		},"text");

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
