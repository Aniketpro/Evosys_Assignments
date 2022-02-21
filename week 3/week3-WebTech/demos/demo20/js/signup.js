function validation(event){
    
    alert("validation() Called!");
    const password=document.getElementById("password").value;
    const cpassword=document.getElementById("cpassword").value;
    console.log("password: "+password+" cpassword"+cpassword);
    const err_cpassword=document.getElementById("err_cpassword");
    if(password===cpassword){
        return true;
    }
    event.preventDefault();
    err_cpassword.innerText="Password value does not match!";
    err_cpassword.style.color="red";
    
    
    return false;
}