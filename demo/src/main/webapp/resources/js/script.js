
$( document ).ready(function() {
    console.log( "ready!" );

//scroll to element
$('.scroll_to').click(function(e){
	var jump = $(this).attr('href');
	var new_position = $(jump).offset();
	$('html, body').stop().animate({ scrollTop: new_position.top - 100 }, 500);
});

//modal
$('.popup-with-zoom-anim').magnificPopup({
    type: 'inline',

    fixedContentPos: false,
    fixedBgPos: true,

    overflowY: 'auto',

    closeBtnInside: true,
    preloader: false,
    
    midClick: true,
    removalDelay: 300
});
});
