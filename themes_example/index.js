let themeSelect = document.querySelector("#theme-choice");

themeSelect.addEventListener('change', function() {
	document.body.classList.remove('morning', 'afternoon', 'night')
	document.body.classList.add(themeSelect.value)
});