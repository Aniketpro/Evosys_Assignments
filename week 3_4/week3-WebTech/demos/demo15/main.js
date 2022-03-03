// Array in JavaScript
const colors=["red","green","blue"];
// Traditional way of for
for(let i=0;i<colors.length;i++){
    console.log(colors[i]);
}
console.log("For each in javascript");
for(let i in colors){
    console.log(colors[i]);
}
console.log("Do While in javascript");
let i=0;
do{
    console.log(colors[i]);
    i++;
}while(i<colors.length);
console.log("While in javascript");
i=0;
while(i<colors.length){
    console.log(colors[i]);
    i++;
}

console.log("reassign the value to index colors[0]=#ff0000");
colors[0]="#ff0000";
console.log("colors[0]="+colors[0]);
//reassigning the values to colors is not allowed
//since it is declared constant but the values
//can be changed