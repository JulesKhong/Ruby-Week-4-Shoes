# Shoe Tracker
A shoe website, for the week 4 code review at Epicodus, July 22, 2016

By Julia Dickey

## Description

This site allows an admin to view, add, update and delete shoe stores, and brands. It also allows the user to search stores by brand or brand by store.

## Setup/Installation Requirements

* The site can be found [here](https://github.com/JuliaDickey/Ruby-Week-4-Shoes) on GitHub
* Clone the github repository to view source files.
* Launch postgres and build the necessary databases with the following commands:
postgres
psql
CREATE DATABASE hair_salon;
\c hair_salon;
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, describe text, stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## Known Bugs

There are no known bugs. Please contact Julia if any arise.

## Support and contact details

For additional questions or comments, email [Julia](mailto:info@gmail.com).

## Technologies Used

Ruby, Sinatra, SQL, HTML, CSS, Bootstrap

Copyright (c) 2016 Julia Dickey
