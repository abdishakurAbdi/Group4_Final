const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Customer = new Schema({

    fname:
    {
        type: String,
        required: true
    },
    lname:
    {
        type: String,
        required: true
    },
    email:
    {
        type: String,
        required: true
    },
    phonenumber:
    {
        type: String,
        required: true
    }
    
    
});
mongoose.model('Customer', Customer);