# README

Raptor Snacks is a web service that converts websites into PDF files (using Docraptor API) and returns useful metadata in JSON format.

Details:

* Ruby version: ruby 2.6.1p33

* System dependencies: readline, openssl, gcc, imagemagick, node.js, PostgreSQL

* Configuration: Amazon credentials in environment variables: AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY

* Database creation: bundle exec rake db:create

* Database initialization: bundle exec rake db:migrate

* How to run the test suite: bundle exec rspec spec

* Deployment instructions: git push heroku master
