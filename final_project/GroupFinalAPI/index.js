const express = require("express");
const app = express();
const PORT = 1200;
app.use(express.json());

const nodemon = require("nodemon");

const mongoose = require("mongoose");
const e = require("express");

const connectionString = //connection string;
mongoose.connect(connectionString, {
    useNewUrlParser: true,
    useUnifiedTopology: true
});

const db = mongoose.connection;

db.on("error", () => console.error.bind(console, "db connection error"));
db.once("open", () => console.log("connected to database successfully"));

//put code to get db schema here
require("./Models/usedCars.js");
const usedCar = mongoose.model("usedCar");

require("./Models/newCars.js");
const newCar = mongoose.model("newCar");

require("./Models/customers.js");
const Customer = mongoose.model("Customer");

app.listen(PORT, () => console.log(`server started on http://localhost:${PORT}`));


app.get(`/getUsedCars`, async (req, res) => {
    try {
        let usedCars = await usedCar.find({}).lean()
        return res.status(200).json({"usedCars": usedCars});
    }
    catch (e){
        return res.status(500).json({message: "Could not get all used cars", reason: e.message});
    }
});

app.get(`/getNewCars`, async (req, res) => {
    try {
        let newCars = await newCar.find({}).lean()
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

        await usedCar(usedCar).save();
        return res.status(200).json({message: "Used car added to inventory"});
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

        await newCar(newCar).save();
        return res.status(200).json({message: "New car added to inventory"});
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

        await Customer(customer).save();
        return res.status(200).json({message: "Customer added to customer list"});
    }
    catch (e) {
        if (e.name == "ValidationError") {
            return res.status(400).json({message: "Failed to add customer", reason: e.message});
        }
        return res.status(500).json({message: "Something went wrong", reason: e.message});
    }
});