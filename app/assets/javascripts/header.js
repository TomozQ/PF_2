$(function(){
  $('button').hover(function(){
    $('span').css('display', 'inline-block')
  },
  function(){
    $('span').css('display', 'none')
  });
});