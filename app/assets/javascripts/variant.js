var i = $('#p_scents tr').size() + 2;

$(document).on('click', '#addScnt', function() {
    $("#p_scents").append('<tr>\
  <td><div class="form-group string optional product_variants_name"><div class="controls"><input class="string optional form-control" type="text" name="product[variants_attributes][][name]" id="product_variants_attributes_0_name"></div></div></td>\
  <td><a href="#" id="js-remove-product-variant"><i class="fa fa-trash"></i>Odstranit</a></td>\
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

function initVariantSuggest(selector) {

    var input = $(selector);
    if (input.length == 0) {
        return;
    }


    var options = {
        data:             '/items/variants.json',
        valueField:       'id',
        displayField:     'label',
        expandOnFocus:    true,
        mode:             'remote',
        hideTrigger:      true,
        selectFirst:      true,
        noSuggestionText: 'Nenalezeno',
        allowFreeEntries: false,
        typeDelay:        1,
        placeholder:      input.attr('placeholder'),

        renderer: function(data) {
            return '<div class="ms-res-item-content"><img src="' + data.picture_url + '" class="avatar"/><div class="info">' +  data.label + '</div>';
        },
        selectionRenderer: function(data) {
            return '<div class="ms-sel-item-content">' + data.label + '</div>';
        }
    };

    var result = input.magicSuggest(options);

    if (input.data('sts')) {
        result.addToSelection(input.data('sts'));
    }
}



$(function() {

    $('.item-input').each(function(index, el) {
        initVariantSuggest(el);
    });

});