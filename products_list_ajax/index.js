console.log('before making the request');

// let myPromise = axios.get('https://www.redbullshopus.com/products.json');

// myPromise.then(function(myResponse) {
// 	console.log('recieved the response');
// 	console.log(myResponse);
// });

axios.get('http://pokeapi.co/api/v2/type/3/')
.then(function(myResponse) {
	console.log('recieved the response 1');
	console.log(myResponse);
});







console.log('after making the request');

