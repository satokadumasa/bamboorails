App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
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
      if($('#remarks').is('*')) {
        $('#remarks').prepend(colum);
      }
    }
  },

  remark: function(data) {
    return this.perform('remark', data);
  },
});
//remark_post
$(function() {
  $('#remark_btn').on('click', function(){
    var authenticity_token = $('input[name="authenticity_token"]').val();
    var data = {
      'lounge_id': $('#remark_lounge_id').val(),
      'user_id': $('#remark_user_id').val(),
      'content': $('#remark_content').val(),
      'last_posted_at': $('#last_posted_at').val(),
      'authenticity_token': authenticity_token
    };
    App.chat.remark(data);
    return;    
  });
});