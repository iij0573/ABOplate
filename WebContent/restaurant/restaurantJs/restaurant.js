/**
 * recommend() 추천
 * notify() 신고
 */

function recommend(reviewNum){
        var icon = document.getElementById("likeIcon");
      $.ajax({
         url : contextPath + "/restaurant/ReviewRecommend.re?reviewNum=" + reviewNum,
         type : 'GET',
         dataType : 'text',
         success : function(data) {
            if (data.trim() == 'add') {
               icon.src = "../images/recommend.jpg";
               /*'좋아요'가 취소되었습니다.*/
            } else{
               icon.src = "../images/좋아요.jpg";
            }
         },
         error : function() {
            console.log("recommend() 오류");
         }
      })
   }



function notify(reviewNum){
   var icon = document.getElementById("notifyIcon");
      $.ajax({
         url : contextPath + "/restaurant/ReviewNotify.re?reviewNum=" + reviewNum,
         type : 'GET',
         dataType : 'text',
         success : function(data) {
            if (data.trim() == 'add') {
               icon.src = "../images/notify.jpg"; 
               /*신고가 취소되었습니다.*/
            } else{
               icon.src = "../images/신고.jpg";
            }
         },
         error : function() {
            console.log("notify() 오류");
         }
      })
   }



function bookmark(restaurantNum){
	console.log(restaurantNum);
	jQuery.ajaxSettings.traditional = true;
		var icon = document.getElementById("bookmarkIcon");
	$.ajax({
		url : contextPath +"/restaurant/restaurantBookmarkOk.re?restaurantNum=" + restaurantNum,
		type : 'GET',
		dataType : 'text',
		success : function(data){
			if(data.trim() == 'pop'){
				icon.src = "../images/favorite.png";
			}else{
				icon.src =" ../images/favoritecolor.png";
			}
		},
		error : function(){
			console.log("enroll() 오류");
		}
	})
}

$('#review').on('keyup', function() {
   if($(this).val().length > 50) {
      alert("글자수는 50자로 이내로 제한됩니다.");
      $(this).val($(this).val().substring(0, 50));
   }
});
