$(document).ready(function() {
  
  $('#user-dropdown-button').on('mouseenter', function(){
    $('#user-dropdown-items').slideDown('medium');
  });

  $('#user-dropdown-menu').on('mouseleave', function(){
    $('#user-dropdown-items').slideUp('medium');
  });

});
