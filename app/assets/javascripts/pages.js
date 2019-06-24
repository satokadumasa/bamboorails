// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  var str = $("#detail textarea").text();
  str = replaceToHtml(str);
  $("#marked-area").html(str);

  $("#detail_area textarea").each(function () {
    $(this).bind('keyup', replaceMarkdown(this));
  });
  if($('#note-detail').is('*')) {
	  formatDatail();
	}
  if($('#select_album').is('*')) {
    $('#select_album').on('change', function(){get_album()});
    if($('#bullet_item').is('*')) {
      $('#set_bullet_item').on('click', function(){
        set_bullet_item();
      });
    }
  }
});

function get_album(){
  var url = '/albums/image_urls/' + $('#select_album').val() + '.json'
  $.ajax({
    url: url,
    type:'GET',
    data:{
    }
  })
  // Ajaxリクエストが成功した時発動
  .done( (data) => {
    $('#image_list').empty()
    for(let i in data){
      var image_url = data[i]['url'];
      var str = '<div onclick="select_attached_image(\'' + image_url + '\');">';
      str = str + "<img src='" + image_url + "' width='100' height='100'>";
      str = str + "</div>";
      $('#image_list').append(str);
      str = '';
    }
    console.log(data);
  })
  // Ajaxリクエストが失敗した時発動
  .fail( (data) => {
    $('#image_list').html(data);
    console.log(data);
  })
  // Ajaxリクエストが成功・失敗どちらでも発動
  .always( (data) => {

  });
}

function select_attached_image(image){
  var detail = $('#page_detail').val();
  var attached_image = '#img:' + image + '::';
  detail = detail + attached_image + "\n";
  $('#page_detail').val(detail);
  $("#marked-area").html(replaceToHtml($('#page_detail').val()));
}

function set_bullet_item(){
  var detail = $('#page_detail').val();
  var bullet_item = $('#bullet_item').val();
  var bullet_items_str = '';
  var arr = bullet_item.split("\n");
  var list_style_type = $('#list_style_type').val();

  bullet_items_str = bullet_items_str + "#ulst:" + list_style_type + "\n";
  
  for(let i in arr) {
    if(arr[i] != ''){
      bullet_items_str = bullet_items_str + '#li:' + arr[i] + "\n";
    }
  }
  detail = detail + bullet_items_str + "#uled\n";
  
  $('#page_detail').val(detail);
  $("#marked-area").html(replaceToHtml($('#page_detail').val()));
}

function formatDatail() {
    var str = $("#note-detail").text();
    str = replaceToHtml(str);
    $("#note-detail").html(str);
};

function replaceMarkdown(elm) {
  var v, old = elm.value;
  return function () {
    if (old != (v = elm.value)) {
      old = v;
      var str = $(this).val();
      str = replaceToHtml(str);
      $("#marked-area").html(str);
    }
  }
}

