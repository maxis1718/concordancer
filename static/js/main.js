$(document).ready(function(){
    $('.search-bar').keyup(handleSearchTermInput);
    $('.search-btn').click(handleSearchSubmit);
});

function handleSearchSubmit () {
    window.location = $('.search-bar').val();
}

function handleSearchTermInput (e) {
    if (e.keyCode  === 13 || e.which === 13) {
        $('.search-btn').click();
    }
}