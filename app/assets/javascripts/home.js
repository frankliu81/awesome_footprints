$(document).ready(function() {
  $('#awesome-footprint-logo').fadeIn(2000);

  $('#cohort-12-button').on('click', function() {
    $('#about-us-div').fadeOut(3000, function() {
      //get the welcome msg element
      var $all_msg = $('#cohort-12-msg');
      //get a list of letters from the welcome text
      var $wordList = $('#cohort-12-msg').text().split("");
      //clear the welcome text msg
      $('#cohort-12-msg').text("");
      $all_msg.show();
      //loop through the letters in the $wordList array
      var length = $wordList.length
      $.each($wordList, function(idx, elem) {
        //create a span for the letter and set opacity to 0
        var newEL = $("<span/>").text(elem).css({
          opacity: 0
        });
        //append it to the welcome message
        newEL.appendTo($all_msg);
        //set the delay on the animation for this element
        newEL.delay(idx * 70);
        //animate the opacity back to full 1


        // last element, show the picture
        if (idx === length - 1)
        {
          newEL.animate({
            opacity: 1
          }, 1100, function() {
            $('#cohort-12-msg').animate({
                top: "-300px",
              }, 1000);
            $('#cohort-12-img').animate({
                top: "-300px",
              }, 1000, function() {
                $('#cohort-12-img').fadeIn(2000);
              });
          });

        } else {
          newEL.animate({
            opacity: 1
          }, 1100);
        }

      });
    });
  });

});
