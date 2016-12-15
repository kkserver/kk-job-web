
kk.page().onview("/add",{

	url : "add.html",
	container: "#kk-page",
	onload : function(view,options) {

		var options = [];

		if(page && page.job && page.job.options){
			var v = JSON.parse(page.job.options);
			if(typeof v == "object") {
				for(var key in v) {
					var option = v[key];
					if(option.editable) {
						option["key"] = key;
						options.push(option)
					}
				}
			}
		}

		view.set("options",options);

		$("form",view.element).on("submit",function(e){

			var data = {};

			var vs = $(this).serializeArray();

			var options = {};

			for(var i in vs) {
				data[vs[i].name] = vs[i].value;
			}

			if(page && page.job && page.job.options){
				var v = JSON.parse(page.job.options);
				if(typeof v == "object") {
					for(var key in v) {
						var option = v[key];
						if(option.editable) {
							if(data[key] !== undefined) {
								options[key] = data[key];
							}
						}
					}
				}
			}

			var disabled = $("input[type=submit]",this).attr("disabled","disabled");

			$.post("/job/version/add.lua", {jobId:ui.url.queryValue("id"),options:JSON.stringify(options),title: data.title },function(data){

				disabled.removeAttr("disabled");

				if( data && data.errmsg) {
					alert(data.errmsg);
				} else if (data && data.version) {
					window.location = "?id=" + ui.url.queryValue("id") + "#/" + data.version.version;
				} else {
					window.location = "?id=" + ui.url.queryValue("id") ;
				}

				window.location.reload();

			},"json");

			return false;
		}).removeAttr("onsubmit");
	}
});
