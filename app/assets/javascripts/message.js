$(function(){

  function new_message(message){
    
    var imageHTML = message.image  ? `<img class src="${message.image}" >`: '';

    var new_message = `<div class="messages__message">
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
});

