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

//http://localhost:3000/signin.html
server.post('/welcome',(req,resp)=>{
    // resp.sendFile(__dirname+'/welcome.html');
    resp.setHeader('Content-Type', 'application/json');
    // resp.send({message:"Welcome to dynamic results"});
    const user = {"firstName":req.body.firstName,
	              "lastName":req.body.lastName,
	              "email":req.body.email};
    resp.send(user);
});


server.listen(port,()=>{
    console.log(message);
});