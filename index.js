const express = require('express')
const app = express()
const port = 8008 || process.env.port
const cors = require('cors')
const bodyParser = require('body-parser')

const mongoose = require('mongoose')


/* Cretaing database on Remote server in MOngoDb Atlas*/

mongoose.connect("mongodb+srv://Abhijeet:TRIAL12345test@abhicluster.dilhq.mongodb.net/myapp?retryWrites=true&w=majority", {

}, err => {
    if (err) throw err;
    console.log('Connected to MongoDB!!!')
});


/* Create Database on the localhost server and stores json data in it 

mongoose.connect("mongodb://localhost:27017/myapp");

*/

app.use(cors())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use('/user', require('./Backend/routes/user.routes'))


app.listen(port, () => {
    console.log('Welcome, you are listening to port running on ' + port)
})
