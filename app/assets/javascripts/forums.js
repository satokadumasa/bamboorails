// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// $(function() {
// 	if($('.watch_forum').is('*')){
// 		$('.watch_forum').on('click', function(){
// 			var authenticity_token = $('#authenticity_token').val();
//       $.ajax({
//         url: '/watch_forums',
//         type: 'POST',
//         data:{
//           'watch_forum[forum_id]': $('#watch_forum_forum_id').val(),
//           'watch_forum[user_id]': $('#watch_forum_user_id').val(),
//           'authenticity_token': authenticity_token
//         }
//       })
//       .done( (data) => {
//       	if(data['status'] == 'success') {
//       		$(".watch_forum").removeClass("btn-primary");
//       		$(".watch_forum").addClass("btn-success");
//       		$(".watch_forum").text("watch_forumed");
//       	}
//       	else if(data['status'] == 'remove') {
//       		$(".watch_forum").removeClass("btn-success");
//       		$(".watch_forum").addClass("btn-primary");
//       		$(".watch_forum").text("watch_forum");
//       	}
//       })
//       .fail( (data) => {
//       	alert('watch_forum fail')
//       })
//       .always( (data) => {

//       });
//     });
//   }
// });
