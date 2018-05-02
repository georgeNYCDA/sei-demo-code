let submitButton = document.querySelector('#submit-button');
let inputAdj1 = document.querySelector('#input-adj-1');
let inputAdj2 = document.querySelector('#input-adj-2');
let inputSubj = document.querySelector('#input-subj');

let adj1Spans = document.querySelectorAll('.adj1-span');
let adj2Spans = document.querySelectorAll('.adj2-span');
let subjSpans = document.querySelectorAll('.subj');

function updateElementsText(arrayOfElements, textValue) {
	for (let i = 0; i < arrayOfElements.length; i++) {
		arrayOfElements[i].innerText = textValue;
	}
}

submitButton.addEventListener('click', function() {
	updateElementsText(adj1Spans, inputAdj1.value);
	updateElementsText(adj2Spans, inputAdj2.value);
	updateElementsText(subjSpans, inputSubj.value);
});