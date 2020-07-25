const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft === 0) return completionCallback(sum);
    if (numsLeft > 0){
        reader.question('please enter a number', (res) => {
            let num = parseInt(res);
            sum += num; 
            console.log(sum);
            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    }
}

