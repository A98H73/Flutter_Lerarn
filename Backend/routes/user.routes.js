const express = require('express')
const { findOneAndDelete } = require('../models/user.model')
const User = require('../models/user.model')
const config = require('../config')
const jwt = require("jsonwebtoken")
const router = express.Router()

router.post('/signup', (req, res) => {

    console.log("inside  the signup")
    User.findOne({ email: req.body.email }, (err, user) => {
        if (err) {
            console.log(err)
            res.json(err)
        }
        else if (user == null) {
            const user = User({
                username: req.body.username,
                email: req.body.email,
                password: req.body.password
            })
            user.save()
                .then((err) => {
                    if (err) {
                        console.log(err)
                        res.json(err)
                    }
                    else {
                        console.log(user + "Registered Successfully")
                        res.json(user)
                    }
                })
        }
        else {
            res.json({
                'message': 'email is not available'
            })
        }
    })

});

router.route('/signin').post((req, res) => {
    User.findOne(
        { email: req.body.email },
        (err, result) => {
            if (err)
                return res.status(500).json({ msg: err });
            if (result === null) {
                return res.status(403).json("Either Username or Password is Incorrect");
            }
            if (result.password === req.body.password) {
                res.json("Welcome " + result.username)
                // Here we implement the functionality of json web token

                // let token = jwt.sign({ email: req.body.email }, config.key, {
                //     expiresIn: "24h", // JSON web token expires in 24 hours
                // });

                // res.json({
                //     token: token,
                //     msg: "success",
                // });
            }
            else {
                return res.status(403).json("Password is Incorrect");
            }
        }
    )
});

router.route("/update/:email").patch((req, res) => {
    User.findOneAndUpdate(
        { email: req.params.email },
        { $set: { password: req.body.password } },
        (err, result) => {
            if (err) {
                return res.status(500).json({ msg: err });
            }
            const msg = {
                msg: "sucessfully data Updated",
                email: req.params.email
            }
            return res.json(msg);

        }
    )
});


router.route('/delete/:email').delete((req, res) => {
    User.findOneAndDelete(
        { email: req.params.email }, (err, result) => {
            if (err) {
                return res.status(500).json({ msg: err });
            }
            const msg = {
                msg: "User Deleted Successfully!!...",
                email: req.params.email
            }
            return res.json(msg);
        }
    )
});


module.exports = router;
