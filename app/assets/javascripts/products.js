$(document).ready(function() {
  // $("#child_product_name_search").autocomplete({
  //   source: '/products/autocomplete.json',
  // });

  $("#child_product_name_search").autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "/products/autocomplete_name.json",
          //dataType: "jsonp",
          data: {
            term: request.term
          },
          success: function( data ) {
            //console.log("success")

            // returning both product_ids and product_names arrays
            //console.log(data.product_ids);
            //console.log(data.product_names);
            //response(data.product_names);

            //console.log(data);
            //var names = _.pluck(data, 'label');
            response(data)
            //debugger;
          },
          error: function() {
            alert('Problem autocompleting');
          }
        });
      },
      minLength: 2,
      focus: function( event, ui ) {
        // if we don't override focus, then while we are selecting
        // #child_product_name_search will temporarily display
        // ui.item.value (ie. product id of 9 when we want product name of 'Clif Bar')
        $( "#child_product_name_search" ).val( ui.item.label );
        return false;
      },
      select: function( event, ui ) {
        console.log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
        $( "#child_product_name_search" ).val( ui.item.label );
        $( "#child_id" ).val( ui.item.value );
        //debugger
        // return false to override the default selected behavior
        // of turning the selection text field into ui.item.value
        // instead of ui.item.label
        return false;
      },
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });
});
