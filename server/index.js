// Requires "axios" and "form-data" to be installed (see https://www.npmjs.com/package/axios and https://www.npmjs.com/package/form-data)
// const axios = require('axios');
// const FormData = require('form-data');
const express = require('express');
const app = express();
const fs = require('fs');
var request = require('request');
const http = require('http');
const server = http.createServer(app);
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

// // adding Helmet to enhance your Rest API's security
// app.use(helmet());
// // enabling CORS for all requests
// app.use(cors());
// // using bodyParser to parse JSON bodies into JS objects
// app.use(bodyParser.json());


app.get('/remove-bg', (req, res, next) => {
   
//     const { image } = req.files;
    
//     console.log("image ---- ", image);
    request.post({
        url: 'https://api.remove.bg/v1.0/removebg',
        formData : {
            image_url : 

            "https://nationaltoday.com/wp-content/uploads/2020/08/international-cat-day-640x514.jpg",
            size : 'auto',
        },
        headers: {
        'X-Api-Key': 'NDEt5aYiEEn412coPt3RJhY1',
      },
      encoding: null,
    }, function(error, response, body) {
        if(error) return console.error("Request failed because of invalid url or file", error);
        if(response.statusCode != 200) return console.error("ERROR", response.statusCode, body.toString('utf8'));
        fs.writeFileSync("./transparent-bg/bmw-transparent-bg.png", body);
        // console.log("BODY -----   "+body);
        const contentType = response.body.contentType;
        console.log("REPONSE TYPE -----   "+contentType);
        return res.send(body);
    });
    
  })





server.listen(3000, () => {
    console.log('listening on : 3000'); 
  });

  // app.listen(3000, () => {
  //   console.log('listening on : 3000'); 
  // });