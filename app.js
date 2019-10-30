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

//ADD A DONOR
app.post('/donor_add',(req,res)=>{
	console.log("Trying to create a new donor..")

	console.log("First name:"+ req.body.d_fname)

	const queryString="INSERT into donor (dfname,dlname) VALUES (?,?)"
	getConnection().query(queryString,[req.body.d_fname,req.body.d_lname],(err, results, fields)=>{
		if(err){
			console.log("Failed"+ err)
			res.sendStatus(500)
			return
		}

	console.log("Inserted with id")
	res.end()
	})

	//res.end()
})

app.get('/stock',(req,res)=>{
console.log("Fetching user with id: "+ req.params.did)
const connection=getConnection()


const userId=req.params.did
const queryString="SELECT * from donor "
connection.query(queryString,(err,rows,fields)=>{
	console.log("Successful ")
	res.json(rows)
})

//res.end()
})



app.get("/",(req,res) =>{
	console.log("Responding to root route")
	res.send("Hello from Root")
})

app.get("/users",(req,res) =>{
	var user1={firstName:"Stephe",lastName:"Curry"}
	res.json(user1)
})



//localhost:3003
app.listen(3003,() =>{
	console.log("Server is up andd listening on 3003...")
})
