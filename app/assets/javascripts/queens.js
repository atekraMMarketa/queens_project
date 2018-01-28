function show_alert(type, body) {
    $('#main-alert').html('<div class="alert alert-' + type + '"><a href="#" class="close" data-dismiss="alert">×</a>' + body + '</div>');
    $('#main-alert').show();
}