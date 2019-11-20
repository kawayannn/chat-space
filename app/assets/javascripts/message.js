$(function(){

  function new_message(message){
    
    var imageHTML = message.image  ? `<img class src="${message.image}" >`: '';

    var new_message = `<div class="messages__message" data-id="${message.id}">
                        <div class="uper-message">
                          <div class="uper-message__name">
                            ${message.name}
                          </div>
                          <div class="uper-message__date">
                            ${message.created_at}
                          </div>
                        </div>
                        <div class="lower-message">
                          <p class="lower-message__content">
                            ${message.content}
                          </p>
                          <div class="lower-message__image">
                            ${imageHTML}
                          </div>
                        </div>
                      </div>`
    return new_message;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    
    .done(function(message){
      var html = new_message(message);

      $('.messages').append(html);
      $("#new_message")[0].reset();
      $('.messages').animate({scrollTop:$('.messages')[0].scrollHeight});
      $('.sendmessage').prop('disabled', false);
    })

    .fail(function(message){
      alert('エラー');
    });
  })
  var reloadMessages = function() {
    last_message_id = $('.messages__message:last').data('id');
    group_id = $('.messages').data('group-id');
    $.ajax({
      url: (`/groups/${group_id}/api/messages`),
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages) {
      console.log('自動更新成功');
      var insertHTML = '';
        messages.forEach(function(message){
          insertHTML = new_message(message);
          $('.messages').append(insertHTML);
          $('.messages').animate({scrollTop:$('.messages')[0].scrollHeight});
        });
    })
    .fail(function() {
      alert('error');
    });
  };
  if (location.href.match(/\/groups\/\d+\/messages/)){
    setInterval(reloadMessages, 7000);
  }
});

