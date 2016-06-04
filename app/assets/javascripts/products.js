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
            this.product_ids = data.product_ids
            this.product_names = data.product_names
            console.log(data.product_ids);
            console.log(data.product_names);
            response(data.product_names);
            debugger;
          }.bind(this),
          error: function() {
            alert('Problem autocompleting');
          }
        });
      },
      minLength: 2,
      select: function( event, ui ) {
        console.log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
        console.log(this.product_ids);
        debugger;
      }.bind(this),
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });
})
