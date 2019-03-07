# README

Raptor Snacks is a web service that converts websites into PDF files (using Docraptor API) and returns useful metadata in JSON format.

##### Demo: https://raptor-snacks.herokuapp.com/

Details:

* Ruby version: ruby 2.6.1p33

* System dependencies: readline, openssl, gcc, imagemagick, node.js, PostgreSQL

* Configuration: Amazon credentials in environment variables: AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY

* Database creation: bundle exec rake db:create

* Database initialization: bundle exec rake db:migrate

* How to run the test suite: bundle exec rspec spec

* Deployment instructions: git push heroku master

Caveats:
* Heroku terminates all requests after 30 seconds. Submitting multiple long (10+ pages) websites will cause the app to crash in production. Read more: https://devcenter.heroku.com/articles/request-timeout
