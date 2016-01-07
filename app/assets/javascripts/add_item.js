$(document).ready(function(){
  console.log("Hello Simon")
  $('.add-item').click(function(){
    $('#add-item-modal').openModal();
  });
});