console.log("Hello from the JavaScript console!");

// Your AJAX request here
let url = 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b';
$.get(url, x=> console.log(x));
// Add another console log here, outside your AJAX request
console.log('synced');
