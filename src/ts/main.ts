$(function () {
	/* Open all PDF links in a new window */
	$('a[href$=".pdf"]').attr('target', '_blank');

	/* SIDR Off-Canvas Menu */
	($('.ly-nav-mobile-trigger') as any).sidr({
		name: 'nav-main-offcanvas',
		source: "#nav-mobile",
		renaming: false,
		body: 'form',
		displace: false, // change to true if sidr has bugs with your layout
		onOpen: () => {
			$('body').addClass('ly-disablescroll');
			$('.ly-overlay').fadeIn(200);
		},
		onClose: () => {
			$('body').removeClass('ly-disablescroll');
			$('.ly-overlay').fadeOut(200);
		}
	});

	/* More responsiveness by using touchstart */
	$('.ly-nav-mobile-trigger').on("touchstart", (e: JQueryEventObject) => {
		e.preventDefault();
		($ as any).sidr('open', 'nav-main-offcanvas');
	});

	$('a.ly-close').on('click', (e: JQueryEventObject) => {
		e.preventDefault();
		($ as any).sidr("close", "nav-main-offcanvas");
	});
	$(window).resize(() => {
		($ as any).sidr("close", "nav-main-offcanvas");
	});

	$(document).on("touchmove", "form.sidr-open", (e: JQueryEventObject) => {
		e.preventDefault();
	});

	$(document).on("click", "form.sidr-open", (e: JQueryEventObject) => {
		e.preventDefault();
		($ as any).sidr("close", "nav-main-offcanvas");
	});

	/* Mobile Navigation */
	$('#nav-main-offcanvas .ly-navopener').on('click', () => {
		$(event.currentTarget).parent().parent().toggleClass('ly-active').find('ul:first').slideToggle();
	});

	$('#nav-main-offcanvas li.active').each((i, item) => {
		$(item).find('ul:first').slideDown();
		$(item).toggleClass('ly-active');
	});
	/* Mobile Navigation */
	$('#nav-sub .ly-navopener').on('click', () => {
		$(event.currentTarget).parent().parent().toggleClass('ly-active').find('ul:first').slideToggle();
	});

	$('#nav-sub li.active').each((i, item) => {
		$(item).find('ul:first').slideDown();
		$(item).toggleClass('ly-active');
	});


	/* Prevent "Overscroll" on iOS devices */
	let touchStartEvent: JQueryEventObject;
	$(".sidr").on({
		touchstart: (e: JQueryEventObject) => {
			touchStartEvent = e;
		},
		touchmove: (e: JQueryEventObject) => {
			var touchStart = touchStartEvent.originalEvent || (touchStartEvent.originalEvent as TouchEvent).touches[0];
			var touchMove = e.originalEvent || (e.originalEvent as TouchEvent).touches[0];

			// Cancel event if menu is already on top or bottom
			if (((touchMove as MouseEvent).pageY > (touchStart as MouseEvent).pageY && e.currentTarget.scrollTop == 0) ||
				((touchMove as MouseEvent).pageY < (touchStart as MouseEvent).pageY && e.currentTarget.scrollTop + (e.currentTarget as HTMLElement).offsetHeight >= e.currentTarget.scrollHeight))
				e.preventDefault();
		}
	});

	/* mailencrypting */
	setTimeout(() => {
		$('[data-madr1]').not('.madr-done').each((i, item) => {
			const mailLinkElem = $(item);
			const maddr = mailLinkElem.attr('data-madr1') + '@' + mailLinkElem.attr('data-madr2') + '.' + mailLinkElem.attr('data-madr3');
			const linktext = mailLinkElem.attr('data-linktext') ? mailLinkElem.attr('data-linktext') : maddr;
			mailLinkElem.after('<a href="mailto:' + maddr + '">' + linktext + '</a> ');
			mailLinkElem.addClass('madr-done').hide();
		})
	}, 500);

	/* Go to top button */
	$('.ly-top').on('click', () => {
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

	$(window).scroll(() => {
		if ($(this).scrollTop() > 200) {
			$('.ly-top').addClass('ly-top-visible');
		} else {
			$('.ly-top').removeClass('ly-top-visible');
		}
	});

	// Sticky header
	var navheight = $('header').height();
	$(window).scroll(() => {
		if ($(window).scrollTop() >= navheight) {
			$('header').addClass('fixed-header');
			$('body').css('padding-top', navheight + 'px');
			if ($(window).scrollTop() >= navheight + 1) {
				$('header').addClass('fixed-top');
			}
		} else {
			$('header').removeClass('fixed-header fixed-top');
			$('body').css('padding-top', '0px');
		}
	});
});