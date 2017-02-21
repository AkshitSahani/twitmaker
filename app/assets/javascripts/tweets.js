// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $('#new_tweet').on('submit', function(event){
    event.preventDefault();

  $.ajax({
    // url: $(this).attr('action'),
    url: $(this).attr('action'),
    method: $(this).attr('method'),
    data: $(this).serialize(),
    dataType: 'json'
  }).done(function(data){
    console.log(data);
    $('.tweets').prepend(data.message);
  });
 })
})
