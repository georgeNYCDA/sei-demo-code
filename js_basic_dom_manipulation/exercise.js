let inputElement = document.getElementById('input-important');

inputElement.style.borderColor = 'red';

let buttonElement = document.querySelector('#submit-button');
let allBoxes = document.getElementsByClassName('boxes');
let allSpans = document.querySelectorAll('span.nycda-class');

buttonElement.addEventListener('click', function() {
	for(let i = 0; i < allBoxes.length; i++) {
		allBoxes[i].style.background = 'green';
	}

	for (let i = 0; i < allSpans.length; i++) {
		allSpans[i].innerText = 'You are a JS Ninja';
	}
});