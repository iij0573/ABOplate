/**
 * index에서 검색창 id를 autocomplete자리에 넣기
 */

$("document").ready(() => {
	$("#search").keyup(() => {
		var filter = $("#filter option:selected").val();
		var search = $("#search").val();
		var keywords;
		$.ajax({
			type: 'GET',
			url: contextPath + "/restaurant/restaurantAutoComplete.re?filter=" + filter + "&search=" + search,
			dataType: "text",
			success: function(data) {
		       	data = data.trim();
		       	//data는 구분자를 가진 String
		       	data = data.replace('[', '');
		       	data = data.replace(']', '');
		       	keywords = Array.from(data.split(','));
		       	console.log(typeof(keywords));
		       	console.log(keywords);
		       	
				$("#search").autocomplete({
			        source : keywords,
			        select : function( event, ui ) {
			        	goTo(ui.item.value);
//			        	s${"#search"}.text(ui.item);//검색창 값을 ui.item
			        },

//			        focus : function(event, ui){
//			        	return false;
//			        },
			        minLength : 1
//			        autoFocus : true
				});
			}
 	});
	});
});