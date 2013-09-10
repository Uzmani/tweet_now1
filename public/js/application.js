$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

    $('form').submit(function(e){
      e.preventDefault();
      $('#load').show();
      $('#tweets').empty();
      $.ajax({
        url: '/tweet',
        type: 'post',
        data: $(this).serialize()
      })
      .done(function(server_response) {
      $('#load').hide();
        $('#tweets').html("Your tweet has been posted!!");
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
      

    });




});
