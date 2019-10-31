const express=require('express')
const app=express()
const bodyParser=require('body-parser')
const mysql=require('mysql')

app.use(bodyParser.urlencoded({extended:false}))

app.use(express.static('./DBMS'))

function getConnection()	{
	return mysql.createConnection({
		host:'localhost',
		user:'root',
		database:'bloodbank'
	})
}

//DONOR
app.post('/donor_add',(req,res)=>{
	console.log("Trying to create a new donor..")

	//add in donor
	const queryString1="INSERT into donor (dfname,dlname,ddob,dgender,dwt,dbgroup,dphone, daddr,demail) VALUES (?,?,?,?,?,?,?,?,?)"
	getConnection().query(queryString1,[req.body.d_fname,req.body.d_lname,req.body.d_dob,req.body.d_gender,req.body.d_wt,req.body.d_bldg,req.body.d_contact,req.body.d_address,req.body.d_email],(err, results, fields)=>{
		if(err){
			console.log("Failed"+ err)
			res.sendStatus(500)
			return
		}
	res.end()
	})

	//add in blood
	const queryString2="INSERT into blood (bgroup) VALUES (?)"
	getConnection().query(queryString2,[req.body.d_bldg],(err, results, fields)=>{
		if(err){
			console.log("Failed"+ err)
			res.sendStatus(500)
			return
		}
	res.end()
	})

	//add in stock
	//console.log("bg: "+req.body.b_bldg)
	const queryString3="update stock set stock.amt = stock.amt + 1 where stock.bgroup=?"
	getConnection().query(queryString3,[req.body.d_bldg],(err,results,fields)=>{
		if(err){
			console.log("Failed"+err)
			res.sendStatus(500)
			return
		}
		res.end()
	})
	console.log("added to stock")
})

//PATIENT
app.post('/add_patient',(req,res)=>{
	console.log("Trying to add a new patient..")

	//add in patient
	const queryString1="INSERT into patient (pfname,plname,pbgroup,pbloodamt,pphone,paddr,pemail) VALUES (?,?,?,?,?,?,?)"
	getConnection().query(queryString1,[req.body.p_fname,req.body.p_lname,req.body.p_bldg,req.body.p_amt,req.body.p_contact,req.body.p_address,req.body.p_email],(err, results, fields)=>{
		if(err){
			console.log("Failed"+ err)
			res.sendStatus(500)
			return
		}
	res.end()
	})
})

//localhost:3003
app.listen(3003,() =>{
	console.log("Server is up and listening on 3003...")
})
