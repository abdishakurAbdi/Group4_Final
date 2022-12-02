const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const NewCar = new Schema({

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
        type: String,
        required: true
    },
    
});
mongoose.model('NewCar', NewCar);