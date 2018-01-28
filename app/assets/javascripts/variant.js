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