$(document).ready(function() {
  // bind to submit
  $('.hero-unit').on("submit", "#flash-card", function(event) {
    event.preventDefault();
    // capture answer
    var data = $(this).serialize(),
        action = $(this).attr("action");

    // send answer to server
    $.post(action, data, function(responseBody) {
      // handle the response
      // replace the contents of the container with the new contents from the server (in the response)      
      $('.hero-unit').html(responseBody);
    });

  });

});
