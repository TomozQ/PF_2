$(function(){
  $('button').hover(function(){
    $('span').css('display', 'inline-block');
  },
  function(){
    $('span').css('display', 'none');
  });

  $('a').hover(function(){
    $(this).css('font-weight', 'bold');
  },
  function(){
    $(this).css('font-weight', 'lighter');
  });
});