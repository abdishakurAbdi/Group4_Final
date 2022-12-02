const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const UsedCar = new Schema({

    year:
    {
        type: Number,
        required: true
    },
    make:
    {
        type: String,
        required: true
    },
    model:
    {
        type: String,
        required: true
    },
    miles:
    {
        type: String,
        required: true
    },
    price:
    {
        type: String,
        required: true
    },
    
});
mongoose.model('UsedCar', UsedCar);