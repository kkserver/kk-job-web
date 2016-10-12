
$(function(){


	$(document.body).on("click",".ui-list-item",function(e){
		window.location.hash = $("input[type=hidden][name=hash]",this).val();
	});

	var hashchange = function(){

		$("input.kk-job-version").each(function(){

			if("#" + this.value == window.location.hash) {
				$(this.parentNode).addClass("ui-selected");
			}
			else {
				$(this.parentNode).removeClass("ui-selected");
			}

		});

	};

	$(window).on("hashchange",hashchange);

	hashchange();

});
