const express = require("express");
const app = express();
const PORT = 1200;
app.use(express.json());

const nodemon = require("nodemon");

const mongoose = require("mongoose");

const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const connectionString = "mongodb+srv://admin:admin@cluster0.lx53csr.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(connectionString, {
    useNewUrlParser: true,
    useUnifiedTopology: true
});

const db = mongoose.connection;

db.on("error", () => console.error.bind(console, "db connection error"));
db.once("open", () => console.log("connected to database successfully"));

//put code to get db schema here
require("./Models/usedCars.js");
const UsedCar = mongoose.model("UsedCar");

require("./Models/newCars.js");
const NewCar = mongoose.model("NewCar");

require("./Models/customers.js");
const Customer = mongoose.model("Customer");

require("./Models/employees");
const Employee = mongoose.model("Employee");

app.listen(PORT, () => console.log(`server started on http://localhost:${PORT}`));

app.get(`/getCustomer`, async (req, res) => {
    try {
        let customer = await Customer.find({}).lean()
        return res.status(200).json({"Customers": customer});
    }
    catch (e){
        return res.status(500).json({message: "Could not get all customer", reason: e.message});
    }
});


app.get(`/getUsedCars`, async (req, res) => {
    try {
        let usedCars = await UsedCar.find({}).lean()
        return res.status(200).json({"usedCars": usedCars});
    }
    catch (e){
        return res.status(500).json({message: "Could not get all used cars", reason: e.message});
    }
});

app.get(`/getNewCars`, async (req, res) => {
    try {
        let newCars = await NewCar.find({}).lean()
        return res.status(200).json({"newCars": newCars});
    }
    catch (e){
        return res.status(500).json({message: "Could not get all new cars", reason: e.message});
    }
});

app.post(`/addUsedCar`, async (req, res) => {
    try{
        let usedCar = {
            year: req.body.year,
            make: req.body.make,
            model: req.body.model,
            miles: req.body.miles,
            price: req.body.price
        }

        UsedCar(usedCar).save().then(() => {
            return res.status(200).json({message: "Used car added to inventory"})
        });
    }
    catch (e) {
        if (e.name == "ValidationError") {
            return res.status(400).json({message: "Failed to add used car", reason: e.message});
        }
        return res.status(500).json({message: "Something went wrong", reason: e.message});
    }
});

app.post(`/addNewCar`, async (req, res) => {
    try{
        let newCar = {
            year: req.body.year,
            make: req.body.make,
            model: req.body.model,
            price: req.body.price
        }

        NewCar(newCar).save().then(() => {
            return res.status(200).json({message: "New car added to inventory"})
        });
    }
    catch (e) {
        if (e.name == "ValidationError") {
            return res.status(400).json({message: "Failed to add new car", reason: e.message});
        }
        return res.status(500).json({message: "Something went wrong", reason: e.message});
    }
});

app.post(`/addCustomer`, async (req, res) => {
    try{
        let customer = {
            fname: req.body.fname,
            lname: req.body.lname,
            email: req.body.email,
            phonenumber: req.body.phonenumber
        }

        Customer(customer).save();
        return res.status(200).json({message: "Customer added to customer list"});
    }
    catch (e) {
        if (e.name == "ValidationError") {
            return res.status(400).json({message: "Failed to add customer", reason: e.message});
        }
        return res.status(500).json({message: "Something went wrong", reason: e.message});
    }
});

app.post('/addEmployee', async (req, res) => {
    let employee = {
        employeeID: req.body.employeeID,
        password: bcrypt.hashSync(req.body.password),
        fname: req.body.fname,
        lname: req.body.lname
    };

    try {
        let existingEmployee = await Employee.find({employeeID: req.body.employeeID});

        if (existingEmployee.length <= 0) {
            await Employee(employee).save();
            return res.status(200).json({message: "employee added succesfully"});
        } 
        else {
            return res.status(400).json({message: "this employee already exists"});
        }
    } 
    catch (e) {
        if (e.name == "ValidationError") {
            return res.status(400).json({message: "failed to add employee", reason: e.message});
        }
        return res.status(500).json({message: "there was a problem adding employee", reason: e.message});
    }
});

app.post("/login", async (req, res) => {
    try {
        let employee = await Employee.find({employeeID: req.body.employeeID});
        return res.status(200).send(employee);
    }
    catch (e) {
        return res.status(500).json({message: "there was a problem finding employee", reason: e.message});
    }
});