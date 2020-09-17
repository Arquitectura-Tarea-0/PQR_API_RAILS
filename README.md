# README
**Introduction:**

This API is used as an epicenter for all the different apps that are developed for homework #0. It'll host the data base of the system and the other apps will request to it as needed.
This read me will feature how to set up the API in a local environment, however, the API is deployed and can be accessed by using pqr-api-rails.herokuapp.com as a root address.

**Requirements:**

ruby '2.6.3', you can use any ruby version manager in order to install the required dpendency

**Steps:**

* Install the bundle gem, this gem will allow you to install any other dependencies in the app's gemfile

``` gem install bundle```

* Run Bundle install to install all the required dependencies for the app to run

``` bundle install ```

* Run rails db:create to instance the database

``` rails db:create```

* Run rails db:migrate in order to run all the required or pending migrations

```rails db:migrate```

* You can run rails db:seed to get a dummy user into the data base so you can start testing any other feature

``` rails db:seed ```

* You can then go ahead and start the rails server to use the app localy

```rails s```

**Documentation of the API:**

The API is fully documented with request and response examples and it can be viewed in it's entirety in the following link https://documenter.getpostman.com/view/12339182/TVK5e2Hf#ae7b3039-b8e7-4ae1-b80b-890a7fe3a933


