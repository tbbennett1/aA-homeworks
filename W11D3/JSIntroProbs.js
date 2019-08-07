function titleize(nameArr, callback){
  new_arr = []
  nameArr.map( el => {
    new_arr.push(`Mx. ${el} Jingleheimer Schmidt`);
  });
  callback(new_arr);
}

function printCallback(arr) {
  arr.forEach((el) => {
    console.log(el);
  });
}

titleize(["Mary", "Brian", "Leo"], printCallback);



function Elephant(name, height, trick_arr){
  this.name = name;
  this.height = height;
  this.trick_arr = trick_arr;
};

Elephant.prototype.trumpet = function() { 
  console.log(`${this.name} the elephant goes phrRRRRRRRRR!!!!!`);
};

Elephant.prototype.grow = function() { 
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) { 
  this.trick_arr.push(trick);
};

Elephant.prototype.play = function() { 
  console.log(`${this.name} is ${this.trick_arr[Math.floor(Math.random() * this.trick_arr.length)]}!`);
};


const fatboi = new Elephant("FatBoi", 120, ["riding a bike", "standing on one leg", "smoking a joint"]);
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [fatboi, ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};



function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};