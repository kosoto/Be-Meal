var bemeal = bemeal || {};
bemeal = (()=>{
	var init =x=>{
		bemeal.router.init(x);
	};
	var onCreate =()=>{
		setContentView();
	};
	var setContentView =()=>{
		
	};
	return {init:init};
})();
bemeal.main = (()=>{
	var init =()=>{
		onCreate();
	};
	var onCreate=()=>{
		setContentView();
	};
	var setContentView=()=>{
		bemeal.router.main();
		
	};
	return {init:init};
})();
bemeal.router = {
		init : x=>{
			$.when(
				$.getScript(x+"/resources/js/router.js",()=>{
					$.extend(new Session(x));
				}),
				$.getScript(x+"/resources/js/util.js"),
				$.Deferred(y=>{
					$(y.resolve);
				})
			).done(z=>{
				bemeal.main.init();
			});
		},
		main : ()=>{
			/*메인화면 그리기*/
			$.when(
				$.getScript($.script()+"/navi.js"),
				$.Deferred(y=>{
					$(y.resolve);
				})
			).done(x=>{
				$('#wrapper').html(naviUI());
			})
			;
		}
};













