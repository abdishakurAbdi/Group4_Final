const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const newCar = new Schema({

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
    price:
    {
        type: Number,
        required: true
    },
    
});
mongoose.model('newCar', newCar);