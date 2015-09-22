# Final Project - StudSpots
By: Daniel Khalili
## Overview
For this project I decided to make a multi-page web application that displays spots to study within the area. These study spots include cafe's, libraries, and any location a user might think is a good spot to share.

#### Technologies Used
- Ruby on Rails
- Ruby
- Javascript
- PostgreSQL
- HTML & CSS
- Github

#### API Used
- googleapis.com

#### ERD
![ERD](../DBfinal.png)

#### Wireframes
![Wireframes](../finalWire.png)

#### Routes
* GET "/" root welcome index
* POST "/users" new users
* GET "/users/:id" show user
* PUT "/users/:id" edit user
* DELETE "/users/:id" delete user
* GET "/spots" spots index
* GET "/spots/:id" show spot
* PUT "/spots/:id" edit spots
* POST "/spots" new spot
* GET "/search" search index


## User Stories
 - User can login or create a new user
 - User can view all study spots nearby on a map
 - User can view details of each study spot: including store hours, wifi, tables, outlets
 - User can save specific study spots as their favorites and delete them
 - User can add new study spots and input needed information
 - User can search for study spots based on name, category, or location
 - Users can like/support certain study spots and dislike/unsupport study spots
 - Users can see ratings of study spots based on likes and details
