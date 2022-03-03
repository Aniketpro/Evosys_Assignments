

//THIS CODE IS FOR THUNDER-CLIENT CHECKING  : RECORDING OF 19-FEB-22


const express=require('express');
const server=express();
const port=3000;
const message=`http://localhost:${port} started `;

//Below is old way of including urlencoding using body-parser logic
// server.use(bodyparse.urlencoded())

//current version dont need explicit bodyparser
server.use(express.urlencoded());
server.use(express.json());

//http://localhost:3000/style.css
server.get('/style.css',(req,resp)=>{
    resp.sendFile(__dirname+'/css/style.css');
});

//http://localhost:3000/signup.js
server.get('/signup.js',(req,resp)=>{
    resp.sendFile(__dirname+'/js/signup.js');
});
//http://localhost:3000/
server.get('/',(req,resp)=>{
    resp.sendFile(__dirname+'/index.html');
});
//http://localhost:3000/index.html
server.get('/index.html',(req,resp)=>{
    resp.sendFile(__dirname+'/index.html');
});
//http://localhost:3000/aboutus.html
server.get('/aboutus.html',(req,resp)=>{
    resp.sendFile(__dirname+'/aboutus.html');
});
//http://localhost:3000/contactus.html
server.get('/contactus.html',(req,resp)=>{
    resp.sendFile(__dirname+'/contactus.html');
});
//http://localhost:3000/signup.html
server.get('/signup.html',(req,resp)=>{
    resp.sendFile(__dirname+'/signup.html');
});
//http://localhost:3000/signin.html
server.get('/signin.html',(req,resp)=>{
    resp.sendFile(__dirname+'/signin.html');
});

//http://localhost:3000/users
server.get('/users', (req, resp) => {
    resp.setHeader('Content-Type', 'application/json');
    resp.send(users);
});

//http://localhost:3000/users/update/1/shah@123
server.put('/users/update/:id/:password', (req, resp) => {

    const id = parseInt(req.params.id);
    const password = req.params.password;

    console.log("id-"+id+" password-"+password);


    resp.setHeader('Content-Type', 'application/json');

    users.forEach( element => {
        
        if(element["id"] === id)
        {
            console.log("element="+JSON.stringify(element));
            element["password"] = password;
            element["cpassword"] = password;
        }
    });

    resp.send(users);
});

const users = [
    {id:1,firstName:"riya",lastName:"shah",email:"riyashah@gmail.com",password:"aaaa",cpassword:"aaaa"},
    {id:2,firstName:"deep",lastName:"jha",email:"deepjha@gmail.com",password:"bbbb",cpassword:"bbbb"},
];

//http://localhost:3000/signin.html
server.post('/welcome',(req,resp)=>{
    // resp.sendFile(__dirname+'/welcome.html');
    resp.setHeader('Content-Type', 'application/json');
    // resp.send({message:"Welcome to dynamic results"});
    const user = {"id":users.length,
                  "firstName":req.body.firstName,
	              "lastName":req.body.lastName,
	              "email":req.body.email,
                  "password":req.body.password,
                  "cpassword":req.body.cpassword};
    resp.send(user);
    users.push(user);
});


server.listen(port,()=>{
    console.log(message);
});