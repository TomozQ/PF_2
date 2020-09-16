$(function(){
  function buildHTML(chat){
    if ( chat.image ) {
      let html =
        `<div class="chat">
          <div class="chat__in">
            <div class="chat__in__left">
              <div class="chat__in__left__userIcon">
              <img src="${chat.user_image_url}">
              </div>
            </div>
            <div class="chat__in__right">
              <div class="chat__in__right__top">
                <div class="chat__in__right__top__userName">
                  ${chat.user_name}
                </div>
                <div class="chat__in__right__top__createdTime">
                  ${chat.created_at}
                </div>
              </div>
              <div class="chat__in__right__bottom">
                <div class="chat__in__right__bottom__content">
                  ${chat.content}
                  <img class="Message__image" src="${chat.image}">
                </div>
              </div>
            </div>
          </div>
        </div>`
      return html;
    } else {
      let html =
      `<div class="chat">
      <div class="chat__in">
        <div class="chat__in__left">
          <div class="chat__in__left__userIcon">
          <img src="${chat.user_image_url}">
          </div>
        </div>
        <div class="chat__in__right">
          <div class="chat__in__right__top">
            <div class="chat__in__right__top__userName">
              ${chat.user_name}
            </div>
            <div class="chat__in__right__top__createdTime">
              ${chat.created_at}
            </div>
          </div>
          <div class="chat__in__right__bottom">
            <div class="chat__in__right__bottom__content">
              ${chat.content}
            </div>
          </div>
        </div>
      </div>
    </div>`
      return html;
    };
  }
  $('.Form').on('submit', function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.chat_new__wrapper__chatsIndex').append(html);      
      $('Form')[0].reset();
      $('.chat_new__wrapper__chatsIndex').animate({ scrollTop: $('.chat_new__wrapper__chatsIndex')[0].scrollHeight});
      $('.Form__submit').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.Form__submit').prop('disabled', false);
  });
  });
});