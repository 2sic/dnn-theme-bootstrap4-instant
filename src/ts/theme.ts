import { hide, show, toggle } from 'slidetoggle';

/* Open all PDF links in a new window */
document.querySelectorAll('a').forEach((linkElem: Element, index) => {
	if(linkElem.hasAttribute('href') && linkElem.getAttribute('href').endsWith('.pdf')) {
		linkElem.setAttribute('target', '_blank');
	}
});

/* Mobile Navigation */
document.querySelector('.ly-hamburger').addEventListener('click', () => {
	document.querySelector('.ly-hamburger').classList.toggle('open');
	document.querySelector('#nav-mobile').classList.toggle('open');
	document.querySelector('body').classList.toggle('ly-disablescroll');
});

/* mailencrypting */
setTimeout(function () {
	let mailElement = document.querySelectorAll('[data-madr1]:not(.madr-done)');

	mailElement.forEach((mail: HTMLElement, index) => {
		const maddr = mail.getAttribute('data-madr1') + '@' + mail.getAttribute('data-madr2') + '.' + mail.getAttribute('data-madr3');
		const linktext = mail.getAttribute('data-linktext') ? mail.getAttribute('data-linktext') : maddr;

		const a = document.createElement('a')
		a.setAttribute('href', `mailto:${maddr}`)
		a.innerHTML = linktext;

		mail.parentElement.appendChild(a);
		mail.classList.add('madr-done');
		mail.style.display = 'none';
	});
}, 500);

/* Go to top button */
document.querySelector('.ly-top').addEventListener('click', (e) => {
	e.preventDefault();

	window.scrollTo({
		top: 0,
		left: 0,
		behavior: 'smooth'
	});
})

/* Check if DNN < 9 */
if(document.getElementsByTagName('body.role-admin').length > 0 && document.getElementsByClassName('personalBarContainer').length > 0) {
	document.querySelector('header').style.marginTop = "0";
}

const navheader = document.querySelector('header');
const navheight = navheader.offsetHeight;
window.addEventListener('scroll', function (event) {
	/* show / hide scroll to top button */
	if (window.scrollY > 200) {
		document.querySelector('.ly-top').classList.add('ly-top-visible');
	} else {
		document.querySelector('.ly-top').classList.remove('ly-top-visible');
	}

	/* sticky header */
	if (window.scrollY >= navheight) {
		navheader.classList.add('fixed-header');
		document.querySelector('body').style.paddingTop = `${navheight}px`;
		if(document.querySelector('body').classList.contains('va-layout-landingpage')) {
			(document.querySelector('body.va-layout-landingpage') as HTMLElement).style.paddingTop = `0px`;
		}

		if (window.scrollY >= navheight + 1) {
			navheader.classList.add('fixed-top');
		}
	} else {
		navheader.classList.remove('fixed-header','fixed-top');
		document.querySelector('body').style.paddingTop = `0px`;
	}
}, false);

/* opens sub navs and mobile navs */
document.querySelectorAll('.ly-navopener').forEach((openerElem: HTMLElement, index) => {
	openerElem.addEventListener('click', (e) => {
		const targetElem = e.currentTarget as HTMLElement;
		const targetParent = targetElem.parentElement.parentElement;

		if(!targetParent.classList.contains('ly-active')) {
			if(targetElem.closest('.has-child').classList.contains('ly-active')) {
				document.querySelector('.ly-active').classList.remove('ly-active')
				hide(document.querySelector('.ly-active ul') as HTMLElement, {});
			}
			targetParent.classList.toggle('ly-active');
			show(targetParent.querySelector('ul') as HTMLElement, {});
		} else {
			targetParent.classList.toggle('ly-active');
			hide(targetParent.querySelector('ul') as HTMLElement, {});
		}
	})
})