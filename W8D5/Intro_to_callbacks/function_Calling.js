
class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}
const turnOn = function () {
    console.log("Turning on " + this.name);
};

Function.prototype.myBind = function(context){
    return () => {
        this.apply(context);  //add whatever function to whatever is passed in as the context  // 
        //take whatever is on the left and apply it to whatever is inside the parantheses
        //apply turnOn to context (lamp)
    }
}

const differentFunction = function () {
    return 1;
}


const lamp = new Lamp();

// turnOn(); // should not work the way we want it to
// myBind(lamp);

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"'
 