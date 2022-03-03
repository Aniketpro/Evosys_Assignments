//creae object to store Product details such as pid,pname,unitprice
//using new keyword
const product = new Object();
product.pid = 1001;
product.pname = "Demo Product";
product.unitPrice = 230;
product.details = function() {
    return this.pid + " " + this.pname + " " + this.unitPrice;
}
console.log(product.details());
//using constructor
function Product(pid, pName, unitPrice) {
    this.pid = pid;
    this.pName = pName;
    this.unitPrice = unitPrice;
    this.details=() => { return this.pid + " " + this.pName + " " + this.unitPrice};
}
const p1 = new Product(1002, "Demo Product", 230);
console.log(p1.details());
//using json
const p2 = {"pid": 1003, "pname": "Demo Product", "unitPrice": 230, "details": function(){ return this.pid + " " + this.pname + " " + this.unitPrice}};
console.log(p2.details());