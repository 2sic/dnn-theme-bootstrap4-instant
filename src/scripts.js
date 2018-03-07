/* apply css3 pie for support: box-shadow, gradients and rounded corners in IE < 10 */
$(function() {
    if (window.PIE) {
        $('#dnn_Slogan').each(function() {
            PIE.attach(this);
        });
    }
	
	/* Open all PDF links in a new window */
	$("a[href$='.pdf']").attr('target', '_blank');

    /* SIDR Off-Canvas Menu */
	$(".ly-nav-mobile-trigger").sidr({
	    name: 'nav-main-offcanvas',
	    source: "#nav-mobile",
	    renaming: false,
	    body: "form",
		displace: false, // change to true if sidr has bugs with your layout
	    onOpen: function () { $("body").addClass("ly-disablescroll"); $('.ly-overlay').fadeIn(200); /*$("#nav-main-offcanvas").height($("body").height());*/ },
	    onClose: function () { $("body").removeClass("ly-disablescroll");$('.ly-overlay').fadeOut(200);}
	});
		
	/* More responsiveness by using touchstart */
	$('.ly-nav-mobile-trigger').on("touchstart", function(e){
		e.preventDefault();
		$.sidr('open', 'nav-main-offcanvas');
	});
	
	$('a.ly-close').click(function(e){
		e.preventDefault();
		$.sidr("close", "nav-main-offcanvas");
	});
	$(window).resize(function () {
	    $.sidr("close", "nav-main-offcanvas");
	});
	
    $(document).on("touchmove", "form.sidr-open", function (e) {
        e.preventDefault();
    });
    $(document).on("click", "form.sidr-open", function (e) {
        e.preventDefault();
	    $.sidr("close", "nav-main-offcanvas");
	});

	/* Mobile Navigation */
    $('#nav-main-offcanvas .ly-navopener').click(function () {
        $(this).parent().parent().toggleClass('ly-active').find('ul:first').slideToggle();
    });

    $('#nav-main-offcanvas li.active').each(function () {
        $(this).find('ul:first').slideDown();
        $(this).toggleClass('ly-active');
    });


    /* Prevent "Overscroll" on iOS devices */
	var touchStartEvent;
	$(".sidr").on({
	    touchstart: function (e) {
	        touchStartEvent = e;
	    },
	    touchmove: function (e) {
	        var touchStart = touchStartEvent.originalEvent || touchStartEvent.originalEvent.touches[0];
	        var touchMove = e.originalEvent || e.originalEvent.touches[0];

            // Cancel event if menu is already on top or bottom
	        if ((touchMove.pageY > touchStart.pageY && this.scrollTop == 0) ||
                (touchMove.pageY < touchStart.pageY && this.scrollTop + this.offsetHeight >= this.scrollHeight))
	            e.preventDefault();
	    }
	});
	
	/* mailencrypting */
	setTimeout(function(){
		$('[data-madr1]').not('.madr-done').each(function(){
			$this = $(this);
			maddr = $this.attr('data-madr1') + '@' + $this.attr('data-madr2') + '.' + $this.attr('data-madr3');
			linktext = $this.attr('data-linktext') ? $this.attr('data-linktext') : maddr;
			$this.after( '<a href="mailto:'+maddr+'">'+ linktext + '</a> ' );
			$this.addClass('madr-done').hide();
		});
	}, 500);

	/* Go to top button */
	$('.ly-top').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 1200, 'easeOutExpo');
        return false;
	});
	
	// Check if DNN < 9
	if ($("body.role-admin").length > 0) {
		if ($(".personalBarContainer").length > 0) {
			$("header").css("margin-top", "0");
		}
	}

	$(window).scroll(function() {
		if($(this).scrollTop() > 200) {
			$('.ly-top').addClass('ly-top-visible');    
		} else {
			$('.ly-top').removeClass('ly-top-visible');
		}
	});
	
	// Sticky header
	$(window).scroll(function(){
		if ($(window).scrollTop() >= 1) {
			$('header').addClass('fixed-header');
			$('body').addClass('fixed');
			
		}
		else {
		   $('header').removeClass('fixed-header');
			$('body').removeClass('fixed');
		}
	});	
});


