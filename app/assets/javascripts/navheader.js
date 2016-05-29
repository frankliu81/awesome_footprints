$(document).ready(function() {

  $('#user-dropdown-button').on('mouseenter', function(){
    $('#user-dropdown-items').slideDown('medidum');
  });

  $('#user-dropdown-menu').on('mouseleave', function(){
    $('#user-dropdown-items').slideUp('medium');
  });
}
