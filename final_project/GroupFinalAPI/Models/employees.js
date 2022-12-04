const mongoose = require("mongoose");
const Schema = mongoose.Schema;

//basic model for testing, modify as needed for any additional data.
const Employee = new Schema({
    employeeID: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    fname: {
        type: String,
        required: true
    },
    lname: {
        type: String,
        required: true
    }
});

mongoose.model("Employee", Employee);