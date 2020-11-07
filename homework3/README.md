# CS 262 - Homework3

The base functionality of my gamezone app is using a GET request to get the names of the players in game 4 and display them in a flatlist.
Answers to the lab questions:

- I have my ElephantSQL database at postgres://uofiyvsg:atQHyx93V70558_aa20WzkBlmQlk7QZw@lallah.db.elephantsql.com:5432/uofiyvsg. I have my heroku app at https://ghastly-phantom-40830.herokuapp.com.
- a. Active GETS you can do are https://ghastly-phantom-40830.herokuapp.com/, /players, /players/:id, /showgameplayers, and /showgameplayers/:id. Active PUT's are /players/:id. Active POST's are /players. Active DELETE's are /players/:id.
- b. GET endpoints are both idempotent and nullipotent, PUT endpoints are idempotent, POST endpoints are neither, and DELETE endpoints are idempotent.
- c. The service that we have is RESTful because we are using https: requests following the CRUD format such as GET, POST, PUT, DELETE.
- d. There was evidence of an impedance mismatch since I had to change the key extractor on the flat list and also change some other parameters around to make the code work correctly.