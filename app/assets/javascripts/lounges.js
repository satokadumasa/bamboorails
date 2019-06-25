// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// var dispatcher = new WebSocketRails("ws://" + base_url + "/websocket");
// var form = document.getElementById("remark_post");

// form.onsubmit = function(e){
//   dispatcher.trigger("create");
//   e.preventDefault();
// }

// var text_input = document.getElementById("remark_content");
// var msg_box = document.getElementById("msg_box");

// form.onsubmit = function(e){
// 	var data = {
// 	  'remark[lounge_id]': $('#remark_lounge_id').val(),
// 	  'remark[user_id]': $('#remark_user_id').val(),
// 	  'remark[content]': $('#remark_content').val(),
// 	  'last_posted_at': $('#last_posted_at').val(),
// 	  'authenticity_token': authenticity_token
// 	};
//   dispatcher.trigger("create", data );
//   e.preventDefault();
// }

// if($('#remark_btn').is('*')) {
// 	$('#remark_btn').on('click', function(){
// 		var data = {
// 		  'remark[lounge_id]': $('#remark_lounge_id').val(),
// 		  'remark[user_id]': $('#remark_user_id').val(),
// 		  'remark[content]': $('#remark_content').val(),
// 		  'last_posted_at': $('#last_posted_at').val(),
// 		  'authenticity_token': authenticity_token
// 		}
// 	  dispatcher.trigger("create", { msg: text_input.value });
// 	  e.preventDefault();
// 	});
// }
// dispatcher.bind("spread_message", function(data) {
// 	$('#remark_content').val('');

// 	for (var i = 0 ; i < data.length; i++) {
// 		var colum = "";
// 		colum = '<div class="col-12">';
// 		colum = colum + data[i]['user_name'] + ':';
// 		colum = colum + data[i]['id'] + ':';
// 		colum = colum + data[i]['content'] + ':';
// 		colum = colum + data[i]['created_at'];
// 		colum = colum + '</div>';
// 		$('#remarks').prepend(colum);
// 	}
// });

// $(function(){
// 	if($('#remark_btn').is('*')) {
// 		//remark_post
// 		$('#remark_btn').on('click', function(){
// 			var form = $('#remark_post');
// 			var uri = form.attr('action');
// 			var url = base_url + form.attr('action');
// 			var authenticity_token = $('input[name="authenticity_token"]').val();
//       $.ajax({
//         url: url,
//         type: 'POST',
//         data:{
//           'remark[lounge_id]': $('#remark_lounge_id').val(),
//           'remark[user_id]': $('#remark_user_id').val(),
//           'remark[content]': $('#remark_content').val(),
//           'last_posted_at': $('#last_posted_at').val(),
//           'authenticity_token': authenticity_token
//         }
//       })
//       .done( (data) => {
//       	$('#remark_content').val('');

//       	for (var i = 0 ; i < data.length; i++) {
//       		var colum = "";
//       		colum = '<div class="col-4">';
//       		colum = colum + data[i]['user_name'] + ':';
//       		colum = colum + data[i]['id'];
//       		colum = colum + '</div>';
//       		colum = colum + '<div class="col-8">';
//       		colum = colum + data[i]['created_at'];
//       		colum = colum + '</div>';
//       		colum = colum + '<div class="col-12">';
//       		colum = colum + data[i]['content'];
//       		colum = colum + '<hr>';
//       		colum = colum + '</div>';
//       		$('#remarks').prepend(colum);
//       	}
//       })
//       .fail( (data) => {
//         alert('bookmark fail')
//       })
//       .always( (data) => {
//       	$('#last_posted_at').val(last_posted_at)
//       });
// 		});
// 	}
// });

// function last_posted_at() {
// 	var weeks = new Array('日','月','火','水','木','金','土');
// 	var now = new Date();

// 	var year = now.getYear(); // 年
// 	var month = now.getMonth() + 1; // 月
// 	var day = now.getDate(); // 日
// 	var week = weeks[ now.getDay() ]; // 曜日
// 	var hour = now.getHours(); // 時
// 	var min = now.getMinutes(); // 分
// 	var sec = now.getSeconds(); // 秒

// 	if(year < 2000) { year += 1900; }

// 	// 数値が1桁の場合、頭に0を付けて2桁で表示する指定
// 	if(month < 10) { month = "0" + month; }
// 	if(day < 10) { day = "0" + day; }
// 	if(hour < 10) { hour = "0" + hour; }
// 	if(min < 10) { min = "0" + min; }
// 	if(sec < 10) { sec = "0" + sec; }

// 	// 表示開始
// 	return year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + sec;
// }