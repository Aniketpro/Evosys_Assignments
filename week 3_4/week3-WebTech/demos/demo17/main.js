//JSON
const p1={"firstName":"Ganesh","lastName":"P","details":function(){ return this.firstName+" "+this.lastName}};
const p2={"firstName":"Gaurav","lastName":"M","details":function(){ return this.firstName+" "+this.lastName}};
const p3={"firstName":"Aakash","lastName":"B","details":function(){ return this.firstName+" "+this.lastName}};

const people=[p1,p2,p3]

for (let i in people){
    console.log(people[i].details());
}

console.log("Javascript Object ");
function Person(fName,lName){
    this.firstName=fName;
    this.lastName=lName;
    this.details=()=>{return this.firstName+" "+this.lastName};
}

const person = new Person("Aniket","Mishra");
console.log("Original person "+person.details());
console.log("Convert javascript object into json");
console.log(JSON.stringify(person));

console.log("Json.parse() used to convert a given string into json object");
console.log(JSON.parse('{"name":"John","age":30,"car":null}'));

console.log("Accessing properties as indx in object: person[firstName]="+person["firstName"]);
console.log("person['firstName']="+person["firstName"]);
console.log("person['lastName']="+person["lastName"]);
console.log("person['details']="+person["details"]);
