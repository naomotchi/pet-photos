$(function(){
  function buildHTML(c){
    var html = `<div class="messages__box">
                  <div class="messages__box__name">
                    ${c.user_name}
                    <div class="messages__box__text">
                      ${c.text}
                    </div>
                  </div>
                </div>`
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
      $('.messages__area').append(html)
      $('.textbox').val('')
      $('.submit-btn').prop("disabled", false);
    })
    .fail(function(){
      alert('error');
    })
  })
})