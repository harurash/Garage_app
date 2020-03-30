$(function(){
  function buildHTML(comment){
    var html = `
      <div class="comments__text__js">
        <p class="comment-text">
          <strong class="strong__name">${comment.user_name}：</strong>
          ${ comment.text }
        </p>
      </div>
      `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments__text').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})