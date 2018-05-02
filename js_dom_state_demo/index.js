
// creating a variable to store whether the image is hidden or not
let isImageHidden = false;
let toggleButton = document.getElementById('toggle-button');
let toggleImage = document.getElementById('toggle-image');

toggleButton.addEventListener('click', function() {

	// check if the image is hidden
	if (isImageHidden === true) {
		// if the image is hidden remove the 'hidden' class and change button text
		toggleImage.classList.remove('hidden');
		toggleButton.innerText = 'Hide';
		isImageHidden = false;
	} else {
		// if the image is visible we are going to add the 'hidden' class and change the button text.
		toggleImage.classList.add('hidden');
		toggleButton.innerText = 'Show';
		isImageHidden = true
	}
});