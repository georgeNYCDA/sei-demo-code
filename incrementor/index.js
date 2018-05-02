class Incrementor {
	constructor(value) {
		this.value = value;
	}

	increment() {
		this.value++;
	}

	decrement() {
		this.value--;
	}
}
let myIncrementor = new Incrementor(0);

let incrButton = document.querySelector('#incr-button');
let decrButton = document.querySelector('#decr-button');
let valueElem = document.querySelector('#value');
let currentValue = 0;

incrButton.addEventListener('click', function() {
	currentValue++;
	valueElem.innerText = currentValue;
});

decrButton.addEventListener('click', function() {
	currentValue--;
	valueElem.innerText = currentValue;
});