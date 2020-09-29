$(function(){
  function buildHTML(chat){
    if ( chat.image ) {
      let html =
      `
        <div class="chat" data-chat-id=${chat.id}>
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
        </div>
      `
      return html;
    } else {
      let html =
    `
      <div class="chat" data-chat-id=${chat.id}>
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
      </div>
    `
      return html;
    };
  }
  let reloadChats = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    let last_chat_id = $('.chat:last').data("chat-id") || 0;
    $.ajax({
      //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
      url: location.href,
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'get',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {id: last_chat_id}
    })
    .done(function(chats) {
      // 更新するメッセージがなかった場合は.doneの後の処理が動かないようにする
      if (chats.length !== 0) {
        //追加するHTMLの入れ物を作る
        let insertHTML = '';
        //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(chats, function(i, chat) {
          insertHTML += buildHTML(chat)
        });
        //メッセージが入ったHTMLに、入れ物ごと追加
        $('.chat_new__wrapper__chatsIndex').append(insertHTML);
        $('.chat_new__wrapper__chatsIndex').animate({ scrollTop: $('.chat_new__wrapper__chatsIndex')[0].scrollHeight});
      }
    })
    .fail(function() {
      console.log('hoge');
    });
  };
  setInterval(reloadChats, 7000);
});