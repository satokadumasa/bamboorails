// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// $(function() {
// 	if($('.bookmark').is('*')){
// 		$('.bookmark').on('click', function(){
// 			var authenticity_token = $('#authenticity_token').val();
//       $.ajax({
//         url: '/bookmarks',
//         type: 'POST',
//         data:{
//           'bookmark[note_id]': $('#bookmark_note_id').val(),
//           'bookmark[user_id]': $('#bookmark_user_id').val(),
//           'authenticity_token': authenticity_token
//         }
//       })
//       .done( (data) => {
//       	if(data['status'] == 'success') {
//       		$(".bookmark").removeClass("btn-primary");
//       		$(".bookmark").addClass("btn-success");
//       		$(".bookmark").text("bookmarked");
//       	}
//       	else if(data['status'] == 'remove') {
//       		$(".bookmark").removeClass("btn-success");
//       		$(".bookmark").addClass("btn-primary");
//       		$(".bookmark").text("bookmark");
//       	}
//       })
//       .fail( (data) => {
//       	alert('bookmark fail')
//       })
//       .always( (data) => {

//       });
//     });
// 	}
// });
