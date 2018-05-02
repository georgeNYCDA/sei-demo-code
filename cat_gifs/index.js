let gifs = window.data.data;

class RandomObjectProcessor {
	constructor(arrayOfObjects) {
		this.arrayOfObjects = arrayOfObjects;
		this.alreadyUsed = [];
	}

	getARandomObject() {
		let randomIndex = Math.floor(Math.random() * gifs.length);
		return this.arrayOfObjects[randomIndex];
	}

	getARandomObjectNoRepeats() {
		let numberHasAlreadyBeenUsed = true;
		let randomObject = undefined;
		while(numberHasAlreadyBeenUsed == true) {
			let randomIndex = Math.floor(Math.random() * gifs.length);

			let result = this.alreadyUsed.indexOf(randomIndex);
			if (result < 0) {
				this.alreadyUsed.push(randomIndex);
				randomObject = gifs[randomIndex];
				numberHasAlreadyBeenUsed = false;

				if (this.alreadyUsed.length == gifs.length) {
					this.alreadyUsed = [];
				}
			}
		}

		return randomObject;
	}
}

let button = document.querySelector('#button');
let imgTag = document.querySelector('#gif-image');
let myProcessor = new RandomObjectProcessor(gifs);

let alreadyUsed = [];

button.addEventListener('click', function () {
	let randomObject = myProcessor.getARandomObjectNoRepeats();
	let newSrc = randomObject.images.original.url
	imgTag.src = newSrc;
});