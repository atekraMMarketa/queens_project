var i = $('#p_scents tr').size() + 2;

$(document).on('click', '#addScnt', function() {
    $("#p_scents").append('<tr>\
  <td><div class="form-group string optional product_variants_name"><div class="controls"><input class="string optional form-control" type="text" name="product[variants_attributes][][name]" id="product_variants_attributes_0_name"></div></div></td>\
  <td><a href="#" id="js-remove-product-variant">Remove</a></td>\
  </tr>');
    i++;
    return false;
});

//Remove button
$(document).on('click', '#js-remove-product-variant', function() {
    if (i > 2) {
        $(this).closest('tr').remove();
        i--;
    }
    return false;
});


