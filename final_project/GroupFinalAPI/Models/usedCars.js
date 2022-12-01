const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const usedCar = new Schema({

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
        type: Number,
        required: true
    },
    price:
    {
        type: Number,
        required: true
    },
    
});
mongoose.model('usedCar', usedCar);