const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const nodeMailer = require('nodemailer');
//const session = require('express-session');

const app = express();

/*
		STATUS CODES:
 		501 : DATABASE CREATION ERROR SERVER SIDE
		201 : CLIENT NOT FOUND
*/
app.use(express.static(__dirname + '/static'));
app.use('/js',express.static(__dirname + '/static/'));

mongoose.connect("mongodb://localhost:27017/student_info",{useNewUrlParser: true});

let studentSchema = new mongoose.Schema({
	email:String,
	password: String,
	fname:String,
	lname:String,
	year:String,
	class:String
});

app.set("view engine","ejs");
let User = mongoose.model("User",studentSchema);

//app.use(session({secret:''}));
app.use(bodyParser.urlencoded({extended:true}));
//app.use(bodyParser.json()); status : to be included
/*
 mailer: sends mail requires receiver's email id upon creation status:works
 getRandom : otp generator status:Works

*/
function getRandom(max){
	return Math.floor(Math.random()*Math.floor(max));
}

function mailer(email){
	otp = getRandom(1000000);
	let transporter = nodeMailer.createTransport({
		host : "smtp.gmail.com",
		port: 465,
		secure: true,
		auth: {
			user:"raulaj468@gmail.com",
			pass:"r@#ul_007"
		}
	});
	let mail = transporter.sendMail({
		from:"socialBlog@viit.ac.in",
		to: email,
		subject: "Email Verification",
		text: "Thank you for registering with us pleases use the following :"+otp+"to continue your registration"
		});
		return otp;
}
/*This fetches the user `data*/
app.get("/api/v1/user",function(){

});
/*Registration Page*/
app.get("/api/v1/user/new",function(req,res){
	const data = req.body.email;
	/*Assumption: The user's unique id is provided currently using email*/
	res.render("registration");
	/*User.find({email:data},function(err,user){
			if(err){res.status(201).send("Error 404");}
			else if(user.length == 0){
			res.status(200).send("Error 404");
			}
			else{
			res.status(200).send(user[0]);
			}

	});*/
});
/**/
var otp=null;
/*Verifying user registration*/
app.post("/api/v1/user/verify/email",function(req,res){
	let email= req.body.email;
	console.log(email);
	otp =mailer(email);
	res.sendStatus(200);
});

app.post("/api/v1/user/verify/otp",function(req,res){
	let opt = req.body.otpVal;
	console.log(opt,otp);
	if(opt != otp){
		console.log("OTP mismatch");
		res.sendStatus(301);
	}
	else{
		console.log("match found");
		res.sendStatus(200);
	}
});
/*stroes data into the database*/
app.post("/api/v1/user",function(req,res){
		let newUser = req.body;
		User.create(newUser,function(err,user){
		if(err)
		{
			console.log(err);
			res.sendStatus(500);
		}
		else
			{
				console.log(user);
				res.redirect("/api/v1/login");
	}
	});
});

/*Login*/
app.get("/api/v1/login",function(req,res){
		res.render("login");
});

/*Verifies the passsed on login credentials*/
app.post("/api/v1/login",function(req,res){
	let userId = req.body.email;
	let p = String(req.body.p);
	User.find({email:userId},function(err,user){
		if(err){res.status(500);}
		else {
			if(user.length == 0){
				res.status(201).send("Wrong username or/and password");
			}
			else if(p = user[0].password){
				res.status(200).send("Success");
			}
			else{
				res.status(201).send("Wrong userame and/or password");
			}
		}
	});
});
app.listen(3000,()=>{
	console.log("Express server started");
});
