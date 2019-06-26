  //remark_post
$(function() {
  if( $('#room_name').is('*')) {
    var room_name = $('#room_name').text();
    var username = $('#username').text();

    App.chat = App.cable.subscriptions.create({channel: "ChatChannel", room: room_name, username: username})
    
    App.chat.connected = function() {
        // Called when the subscription is ready for use on the server
      var authenticity_token = $('input[name="authenticity_token"]').val();
      var data = {
        'room': room_name,
        'lounge_id': $('#remark_lounge_id').val(),
        'user_id': $('#remark_user_id').val(),
        'content': '[' + username + ']さんが入室しました。',
        'last_posted_at': $('#last_posted_at').val(),
        'authenticity_token': authenticity_token
      };
      $('#last_posted_at').val(last_posted_at())
      $('#remark_content').val('');
      App.chat.remark(data);
    };

    App.chat.disconnected = function(){
      var authenticity_token = $('input[name="authenticity_token"]').val();
      var data = {
        'room': room_name,
        'lounge_id': $('#remark_lounge_id').val(),
        'user_id': $('#remark_user_id').val(),
        'content': '[' + username + ']さんが退室しました。',
        'last_posted_at': $('#last_posted_at').val(),
        'authenticity_token': authenticity_token
      };
      $('#last_posted_at').val(last_posted_at())
      $('#remark_content').val('');
      App.chat.remark(data);
    }

    App.chat.received = function(data) {
        // Called when there's incoming data on the websocket for this channel
        for (var i = 0 ; i < data.length; i++) {
          var colum = "";
          colum = '<div class="col-4">';
          colum = colum + data[i]['user_name'] + ':';
          colum = colum + data[i]['id'];
          colum = colum + '</div>';
          colum = colum + '<div class="col-8">';
          colum = colum + data[i]['created_at'];
          colum = colum + '</div>';
          colum = colum + '<div class="col-12">';
          colum = colum + data[i]['content'];
          colum = colum + '<hr>';
          colum = colum + '</div>';
          $('#last_posted_at').val(data[i]['created_at']);
          if($('#remarks').is('*')) {
            $('#remarks').prepend(colum);
          }
        }
    }

    App.chat.remark = function(data) {
      return this.perform('remark', data);
    }

    $('#remark_btn').on('click', function(){
      var authenticity_token = $('input[name="authenticity_token"]').val();
      var data = {
        'room': room_name,
        'lounge_id': $('#remark_lounge_id').val(),
        'user_id': $('#remark_user_id').val(),
        'content': $('#remark_content').val(),
        'last_posted_at': $('#last_posted_at').val(),
        'authenticity_token': authenticity_token
      };
      $('#last_posted_at').val(last_posted_at())
      $('#remark_content').val('');
      App.chat.remark(data);
      return;    
    });
  }
});

function last_posted_at() {
  var weeks = new Array('日','月','火','水','木','金','土');
  var now = new Date();

  var year = now.getYear(); // 年
  var month = now.getMonth() + 1; // 月
  var day = now.getDate(); // 日
  var week = weeks[ now.getDay() ]; // 曜日
  var hour = now.getHours(); // 時
  var min = now.getMinutes(); // 分
  var sec = now.getSeconds(); // 秒

  if(year < 2000) { year += 1900; }

  // 数値が1桁の場合、頭に0を付けて2桁で表示する指定
  if(month < 10) { month = "0" + month; }
  if(day < 10) { day = "0" + day; }
  if(hour < 10) { hour = "0" + hour; }
  if(min < 10) { min = "0" + min; }
  if(sec < 10) { sec = "0" + sec; }

  // 表示開始
  return year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + sec;
}