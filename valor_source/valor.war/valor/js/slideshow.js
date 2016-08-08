$(function(){
	var countDiv = $("#slider-banner div").length;
	if (countDiv == 1){
		$('#slider-banner div.slide-1').css('display','block');	
	} else {
		$('#slider-banner div').each(function(i){
			//create the list of navigation items
			$(this).attr('class', 'slide-'+(i+1));
			$('#nav-img-slideshow').append('<li id="slide-' + (i+1) + '"><a>' + (i+1) + '</a></li>');
		});
		
		//CREATE ARROWS NEXT AND PREVIOUS
		$('#slider-banner').append('<ul class="slide-control"><li class="slide-previous-area"><a id="previous">previous</a></li> <li class="slide-next-area"><a id="next">next</a></li></ul>');		
		// CREATE NAVIGATION WITH ARROWS
		$('#previous,#next').click(function(){
			var idArrow = $(this).attr('id');
			var currentSlide = $('#slider-banner div.current').attr('class').split('current')[0].split('slide-')[1];
			var countSlide = $("#slider-banner div").length;
			if(idArrow == 'previous'){
				if(currentSlide == 1 ){
					currentSlide = countSlide;
				} else {
					currentSlide--;
				}
			}
			if(idArrow == 'next'){
				if(currentSlide == countSlide){
					currentSlide = 1;
				} else {
					currentSlide++;
				}
			}
			$('#slider-banner div.current').css('display','none');
			$('#slider-banner div.current').removeClass('current');
			$('#slider-banner div.slide-' + currentSlide).addClass('current');
			$('#slider-banner div.current').fadeIn();
			$('ul#nav-img-slideshow li').removeClass('current');
			$('ul#nav-img-slideshow li#slide-' + currentSlide).addClass('current');

			clearInterval(interval);
		});	

		// CREATE SLIDES NAVIGATION
		$('#nav-img-slideshow li').click(function(){
			clearInterval(interval);

			//when a nav item is clicked, load the slideshow from the corresponding slide
			var navCurrentClass = $(this).attr('id');
			$('#slider-banner > div').css('display','none');
			$('#slider-banner > div').removeClass('current');
			$('#slider-banner div.' + navCurrentClass).addClass('current');		
			
			$('li.current').removeClass('current');
			$(this).attr('class','current');
			
			$('#slider-banner div.' + navCurrentClass).fadeIn();
			
			$('li#slide-' + positionCurrent).removeClass('current');
			$('li#slide-' + (positionCurrent+1)).addClass('current');
		});

		 $('#nav-img-slideshow li').mouseenter(function(){
			 //on hover display the image of the corresponding slide 
			var slideSelected = $(this).attr('id');
			var slideSelectedNum = $(this).attr('id').split('slide-')[1];
			var imgNavHoveredSrc = $('#slider-banner div.' + slideSelected + ' img').attr('src');
			var imgNavHoveredAlt = $('#slider-banner div.' + slideSelected + ' img').attr('alt');
			$(this).append('<div class="nav-slideshow-hover"><img src="' + imgNavHoveredSrc + '" alt="' + imgNavHoveredAlt + '"/> <img class="arrow-thumb-slideshow" src="/education/education_2014/images/arrow-thumb-slideshow.png"/></div>').fadeIn(400);
		}).mouseleave(function(){
			//when area left put the number back
			var slideSelectedNum = $(this).attr('id').split('slide-')[1];
			$(this).html('<a>' + slideSelectedNum + '</a>');
		});

		//put current class on first slide
		$("#slider-banner div:first-child").addClass("current");

		//put class on first navigation element
		$('li#slide-1').addClass('current');

		//LAUNCH SLIDESHOW WITH INTERVAL PARAMETERS
		var interval = null;
		$(document).on('ready',function(){
			interval = setInterval(slideshow,8000);
		});

		function slideshow() {
			// change slide every 2sec
			var positionCurrent = $('#slider-banner div.current').index();
			positionCurrent += 1;
			if(countDiv > 2) {
				if (positionCurrent == 1) {
					//alert('test-first');
					$('#slider-banner div:first-child').fadeIn();	
					setTimeout(function() {
						$('#slider-banner div.slide-' + countDiv).css('display','none');
						positionCurrent = 1;
					}, 500);

					$('#slider-banner div.slide-' + countDiv).removeClass('current');
				} if (positionCurrent < countDiv) {	
					//alert('test-current');	
					$('#slider-banner div.current').next().fadeIn();		
					setTimeout(function() {
						$('#slider-banner div.current').prev().css('display','none');
					}, 500);

					$('#slider-banner div.current').css('display','block');

					$('#slider-banner div.current').next('div').addClass('current');
					$('#slider-banner div.current').prev().removeClass('current');
				} else {
					//alert('test-last');
					$('#slider-banner div:first-child').fadeIn();
					setTimeout(function() {
						$('#slider-banner div.current').prev().css('display','none');	
					}, 500);
								
					$('#slider-banner div.current').css('display','none');	
					$('#slider-banner div:first-child').addClass("current");
					
					$('#slider-banner div.slide-'+countDiv).prev().css('display','none');
					$('#slider-banner div.slide-'+countDiv).prev().removeClass('current');
				}
			} else {
			// IF ONLY ONE or TWO SLIDES 
				if (positionCurrent == 1) {
					$('#slider-banner div.slide-2').fadeIn();		
					setTimeout(function() {
						$('#slider-banner div.slide-1').css('display','none');
					}, 500);		
					$('#slider-banner div.slide-2').addClass('current');
					$('#slider-banner div.slide-1').removeClass('current');			
				} if (positionCurrent == 2) {
					$('#slider-banner div.slide-1').fadeIn();		
					$('#slider-banner div.slide-2').css('display','none');
									
					$('#slider-banner div.slide-1').addClass('current');
					$('#slider-banner div.slide-2').removeClass('current');			
				}			
			}
			// change the state of the active button of the slider nav
			var currentSlideClass = $('#slider-banner div.current').attr('class').split('current')[0];
			//alert(currentSlideClass);
			$('li#slide-' + positionCurrent).removeClass('current');
			$('li#' + currentSlideClass).addClass('current');
		}
	}
});