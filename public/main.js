$(document).ready(function(){
  $(window).scroll(function(event){
    if($(window).scrollTop() > $(window).height()) {
      $(".up").addClass("show")
    } else {
      $(".up").removeClass("show")
    }
  })

  $(".up").click(function(event){
    event.preventDefault()
    
    $("html, body").animate({
        scrollTop: 0
    }, 600);
  })
})