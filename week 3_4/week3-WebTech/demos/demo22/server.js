// WE are creating services which will share records of user
const express=require('express');
const server=express();
const port=3000;
server.use(express.urlencoded({extended:true}));
server.use(express.json());
const users=[
    {id:1,firstName:"Chandani",lastName:"Tomar"},
    {id:2,firstName:"Deep",lastName:"Shah"},
    {id:3,firstName:"Hoeny",lastName:"Kholwala"},
    {id:4,firstName:"Aakash",lastName:"Rathore"}
]
//Get : all users http://localhost:3000/users
server.get('/users',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    resp.send(users);
})
//Post: add new user http://localhost:3000/users/add
server.post('/users/add',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    // user=req.body;
    const newUser={ id:req.body.id, firstName:req.body.firstName,lastName:req.body.lastName};
    users.push(newUser)
    resp.send({message:"new objecte added "});
});
//Put : update user http://localhost:3000/users/update/:id/:lastname
server.put('/users/update/:id/:lastname',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    users.forEach(user=>{
        if(user.id===parseInt(req.params.id)){
            user.lastName=req.params.lastname;
        }
    })
    const msg=req.body.id+" updated";
    resp.send({message:msg});
});
//Delete: deleteuser
server.delete('/users/delete/:id',(req,resp)=>{
    resp.setHeader('Content-Type','applicaiton/json');
    users.forEach(user=>{
        if(user.id===parseInt(req.params.id)){
            users.pop();
        }
    })
    const msg=req.body.id+" deleted";   //it is deleting last id
    resp.send({message:msg});
});

server.listen(port,()=>{
    console.log("http://localhost:3000/users");
})
