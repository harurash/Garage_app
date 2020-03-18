$(function () {
  $(".message__image__images__subs__thumb").first().addClass("active"); 
  $('.image_subs').click(function () { 
    image_url = $(this).attr("src"); 
    $(".image-main").attr("src", image_url).hide().fadeIn(); 
    $(".message__image__images__subs__thumb.active").removeClass("active"); 
    $(this).parent().addClass("active"); 
  });
});