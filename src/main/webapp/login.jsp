<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Form</title>
       
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    </head>
    <style>
    @import url('https://fonts.googlepis.com/css?family=Montserrat:400,800');
*{
    box-sizing:border-box;
}
body{
    align-items:center;
    display:flex;
    justify-content: center;
    flex-direction: column;
    background: #f6f5f7;
    font-family: 'monserrat', sans-serif;
    min-height: 100%;
    margin: 10%;
}
.container{
    position: relative;
    width: 768px;
    max-width: 100%;
    min-height: 480px;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25),
                0 10px 10px rgba(0,0,0,0.22)
}
.sign-up, .sign-in{
    position:absolute;
    top: 0%;
    left: 0%;
    height:100%;
    transition: all 0.6s ease-in-out;
}
.sign-up{
    width:50%;
    opacity:0;
    z-index:1;
}
.sign-in{
    width:50%;
    z-index:2;
}
form{
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 50px;
    height: 100%;
    text-align: center;
}
h1{
    font-weight: bold;
    margin: 0;
}
p{
    font-size:14px;
    font-weight: 100;
    line-height: 20px;
    letter-spacing: 0.5px;
    margin: 15px 0 20px;
}
input{
    background: #eee;
    padding: 12px 15px;
    margin: 8px 15px;
    width: 100%;
    border-radius: 5px;
    border: none;
    outline:none;
}
a{
    color:#333;
    font-size: 14px;
    text-decoration: none;
    margin: 15px 0;
}
button{
    color: #fff;
    background: #ff4b2b;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 55px;
    margin: 20px;
    border-radius: 20x;
    border: 1px solid #ff4b2b;
    outline:none;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 80ms ease-in;
    cursor: pointer;
}
button:active{
    transform: scale(0.90);
}
#signIn, #signUp{
    background-color: transparent;
    border: 2px solid #fff;
}
.container.right-panel-active .sign-in{
    transform: translateX(100%);
}
.container.right-panel-active .sign-up{
    transform: translateX(100%);
    opacity: 1;
    z-index: 5;
}
.overlay-container{
    position:absolute;
    top:0;
    left: 50%;
    width: 50%;
    height: 100%;
    overflow: hidden;
    transition: transform 0.6s ease-in-out;
    z-index: 100;
}
.container.right-panel-active .overlay-container{
    transform: translateX(-100%);
}
.overlay{
    position: relative;
    color: #fff;
    background: #ff416c;
    left: -100%;
    height: 100%;
    width:200%;
    background: linear-gradient(to right,#ff4b28,#ff228c);
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}
.container.right-panel-active .overlay{
    transform: translateX(50%);
}
.overlay-left, .overlay-right{
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 40px;
    text-align: center;
    top: 0;
    height: 100%;
    width: 50%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}
.overlay-left{
    transform:translateX(-20%);
}
.overlay-right{
    right:0;
    transform: translateX(0);
}
.container.right-panel-active .overlay-left{
    transform: translateX(0);
}
.container.right-panel-active .overlay-right{
    transform: translateX(20%);
}
.social-container{
    margin: 20px 0;
}
.social-container a{
    height: 40px;
    width: 40px;
    margin: 0 5px;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 50%;
}
    
    </style>
    <body>
       
        <div class="container" id="main">
            <div class="sign-up">
                <form action=Signup method=post>
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <p>or use your email for registration</p>
                    <input type="text" name="txtName" placeholder="Name" required="">
                    <input type="email" name="email" placeholder="Email" required="">
                    <input type="password" name="pswd" placeholder="Password" required="">
                    <button type=submit>sign Up</button>
                </form>
            </div>
            <div class="sign-in">
            
                <form action=LoginServlets method=post>
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <p>or use your account</p>
                    <input type="text" name="txt" placeholder="Name" required="">
                    <input type="email" name="email" placeholder="Email" required="">
                    <input type="password" name="pswd" placeholder="Password" required="">
                    <a href="#">Forget your password?</a>
                    <button type=submit>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us plaese login with your personal info</p>
                        <button id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-right">
                        <h1>Hello, Friend</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const main = document.getElementById('main');

            signUpButton.addEventListener('click', () =>{
                main.classList.add("right-panel-active");
            });
            signInButton.addEventListener('click', () =>{
                main.classList.remove("right-panel-active");
            });
        </script>
    </body>
</html>