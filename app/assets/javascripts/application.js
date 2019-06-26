// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require popper
//= require bootstrap-sprockets
$(function() {
  $('.drawer').drawer({
    class: {
      nav: 'drawer-nav',
      toggle: 'drawer-toggle',
      overlay: 'drawer-overlay',
      open: 'drawer-open',
      close: 'drawer-close',
      dropdown: 'drawer-dropdown'
    },
    iscroll: {
      // Configuring the iScroll
      // https://github.com/cubiq/iscroll#configuring-the-iscroll
      mouseWheel: true,
      preventDefault: false
    },
    showOverlay: true
  });

  if($('.dropdown').is('*')) {
    $('.dropdown').on('click', function(){
      var dropdown = $(this).find('.dropdown');
      if($(dropdown).css('display') == 'none') {
        $(dropdown).css('display', 'block');
      }
      else {
        $(dropdown).css('display', 'none');
      }
    })
  }

  if($('.watch_forum').is('*')){
    $('.watch_forum').on('click', function(){
      var authenticity_token = $('#authenticity_token').val();
      $.ajax({
        url: '/watch_forums',
        type: 'POST',
        data:{
          'watch_forum[forum_id]': $('#watch_forum_forum_id').val(),
          'watch_forum[user_id]': $('#watch_forum_user_id').val(),
          'authenticity_token': authenticity_token
        }
      })
      .done( (data) => {
        if(data['status'] == 'success') {
          $(".watch_forum").removeClass("btn-primary");
          $(".watch_forum").addClass("btn-success");
          $(".watch_forum").text("watching");
        }
        else if(data['status'] == 'remove') {
          $(".watch_forum").removeClass("btn-success");
          $(".watch_forum").addClass("btn-primary");
          $(".watch_forum").text("Watch Forum");
        }
      })
      .fail( (data) => {
        alert('watch_forum fail')
      })
      .always( (data) => {

      });
    });
  }

  if($('.bookmark').is('*')){
    $('.bookmark').on('click', function(){
      var authenticity_token = $('#authenticity_token').val();
      $.ajax({
        url: '/bookmarks',
        type: 'POST',
        data:{
          'bookmark[note_id]': $('#bookmark_note_id').val(),
          'bookmark[user_id]': $('#bookmark_user_id').val(),
          'authenticity_token': authenticity_token
        }
      })
      .done( (data) => {
        if(data['status'] == 'success') {
          $(".bookmark").removeClass("btn-primary");
          $(".bookmark").addClass("btn-success");
          $(".bookmark").text("bookmarked");
        }
        else if(data['status'] == 'remove') {
          $(".bookmark").removeClass("btn-success");
          $(".bookmark").addClass("btn-primary");
          $(".bookmark").text("bookmark");
        }
      })
      .fail( (data) => {
        alert('bookmark fail')
      })
      .always( (data) => {

      });
    });
  }
  
  // if($('#follow_on_celaeno').is('*')) {
  //   $('#follow_on_celaeno').on('click',function(){
  //     var user_id = $('#user_id').val() ? $('#user_id').val() : "";
  //     var uri = '/follow/add/' + user_id;
  //     alert("uri:" + uri);
  //     $.ajax({
  //       url:uri,
  //       type:'POST',
  //       data:{
  //         authenticity_token: $('#authenticity_token').val()
  //       }
  //     })
  //     // Ajaxリクエストが成功した時発動
  //     .done( (data) => {
  //       $('.result').html(data);
  //       console.log(data);
  //     })
  //     // Ajaxリクエストが失敗した時発動
  //     .fail( (data) => {
  //       $('.result').html(data);
  //       console.log(data);
  //     })
  //     // Ajaxリクエストが成功・失敗どちらでも発動
  //     .always( (data) => {

  //     });
  //   }); 
  // }
});


