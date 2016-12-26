

Page = {}

Page.progress = function(value) {
	this.style.width = value +"%";
};

Page.status = function(value) {
	$(this).removeClass("progress").removeClass("ok").removeClass("fail");
	if(value == 1) {
		$(this).addClass("progress");
	}
	else if(value == 200) {
		$(this).addClass("ok");
	}
	else if(value == 300 || value == 400) {
		$(this).addClass("fail");
	}
};

$(function(){

	$.post("/job/api/version/query.json", { jobId:ui.url.queryValue("id"), limit: 200, maxVersion:-1},function(data){

		view.set("versions",(data && data.versions) || []);

		$("input.kk-job-version").each(function(){

			if("#/" + this.value == window.location.hash) {
				$(this.parentNode).addClass("ui-selected");
			}
			else {
				$(this.parentNode).removeClass("ui-selected");
			}

		});
		
	},"json");

	kk.page().onchange(/.*/i,function(){

		$("input.kk-job-version").each(function(){

			if("#/" + this.value == window.location.hash) {
				$(this.parentNode).addClass("ui-selected");
			}
			else {
				$(this.parentNode).removeClass("ui-selected");
			}

		});

	});

	$(document.body).on("click",".ui-list-item",function(e){
		window.location.hash = "#/" +$("input[type=hidden][name=hash]",this).val();
	});


});
