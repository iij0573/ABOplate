/**
 * iteam pg
 * 
 * cookie[]cookies=request.getCookies(); Cookie cookie=null;
 * 
 */
function printSaveCookie() {
	document.Cookie="cookie=menu";	  
	  //var items = getCookie('rBean'); var cookieList={};
	  var split=document.cookie.split(','); 
	  var name_value = split[i].split("=");	 
	  var maxItemNum = 5; 
 
	 if(document.cookie&&dicument.cookie !=''){ 
		 for (var i = 0; i < split.length; i++) { name_value[0]=name_value[0].replace('/^/.');
	 cookieList[decodeURIComponent(name_value[0])] =decodeURIComponent(name_value[1]); } } return cookieList; }
	 
	 
		  if (items) { var itemArray = items.split(',');
		  if(itemArray.indexOf(id) != -1) { // 이미 존재하는 경우 종료
		console.log('Already exists.');
		} else { // 새로운 값 저장 및 최대 개수 유지하기
			itemArray.unshift(id);
			
		  if (itemArray.length > maxItemNum ) 
			  {
			  items = itemArray.join(',');
			  setCookie('productItems', items, expire);
		 } else {  setCookie('productItems', id, expire); } // 신규 id값 저장하기
		  }
		  }