//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(function () {
  $('.moreinfo-btn').click(function(event){
    event.preventDefault();
    var parent = $( event.target ).closest('.main-list').find('.moreinfo');


    $(this).text(function(i, text){
      return text === "More info" ? "Less info" : "More info";
    })


    $(parent).slideToggle();

  });

  $('.pet-selected').change(function() {
    var petSelected = $('.pet-selected :selected').val()

    if (petSelected == 'Other'){
      $('.pet-other').slideDown(800);
    } else {
      $('.pet-other').slideUp(800);
      $('#dingdong').val(petSelected);
    }
  })

})
