function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb,adj,noun){
  sentence = `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
  console.log(sentence)
}

function isSubstring(string, substring) {
  return string.indexOf(substring) != -1
}

function fizzBuzz(num) {
  for (let i = 1; i <= num; i++) {
    if (i % 15 == 0) {
      console.log('fizzbuzz');
    } else if (i % 5 == 0) {
      console.log('buzz');
    } else if (i % 3 == 0) {
      console.log('fizz');
    } else {
      console.log(i);
    }
  }
}

function isPrime(num) {
  if (num < 2) {
    return false;
   }

  for (let i = 2; i < num; i++) {
    if (num % i == 0) {
      console.log(i);
      return false
    }
  }
  return true
}

function sumOfNPrimes(num) {
  primes = [];
  let i = 1
  while (primes.length < num){
    if (isPrime(i)) {
      primes.push(i);
    }
    i++;
  }
  let sum = 0
  for (let i = 0;i < primes.length; i++) {
    sum += primes[i];
  }
  return sum
}
// part two
function titleize(arr, callback) {
  let titleized = arr.map(name=>`Mx. ${name} Jingleheimer Smith`);
  callback(titleized);
}


function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

// Phase III - Function Invocation

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is breakdancing by!`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};
