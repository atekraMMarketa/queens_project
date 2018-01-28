var i = $('#p_scents2 tr').size() + 2;

$(document).on('click', '#addScnt2', function() {
    var variants = variants_for_select
    $("#p_scents2").append('<tr>\
  <td><select name="document[items_attributes][][variant_id]" id="document_items_attributes_0_variant_id">\
  <option value="21">21%</option>\n  \
  <option value="15">15%</option>\n  \
  <option value="0">0%</option></select></td> \
   <td><a href="#" id="js-remove-product-variant">Remove</a></td>\
  </tr>');
    i++;
    return false;
});

//Remove button
$(document).on('click', '#js-remove-document-item', function() {
    if (i > 2) {
        $(this).closest('tr').remove();
        i--;
    }
    return false;
});


