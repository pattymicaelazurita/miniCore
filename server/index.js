const express=require("express");
const app=express();
const mysql=require("mysql");
const cors = require("cors");
var format = require('date-fns/format');


app.use(cors());
app.use(express.json());


const db= mysql.createConnection({
    user: "root",
    host: "localhost",
    password: "admin",
    database: "parqueadero"
});



app.post("/filtrar", (req,res)=>{
    const date= req.body.date;

    db.query('SELECT * FROM usuarios WHERE DATE(fecha_compra) BETWEEN (?) AND CURDATE()',[date],
    (err,result)=>{
        if (err){
            console.log(err);
        }else {
            res.send(result)
        }
    })
});


app.listen(3001, ()=>{
    console.log("Conexión lograda en el puerto 3001")
});


