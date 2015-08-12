# savings
Postgresql   
user: crowd  
password: crowd  
database name: Savings_development  
host:localhost

## Table of Contents

* [App for](#app-for)
* [Links to APP](#links-to-app)
* [Ruby version](#ruby-version)
* [Dependencies](#dependencies)
* [Setup Project](#setup-project)
  * [Setup the repos for different environments](#setup-the-repos-for-different-environments)
  * [Database creation](#database-creation)
* [Set environment variables](#set-environment-variables)
  * [Figaro](#figaro)
  * [Bamboohr client Initialization](#bamboohr-client-initialization)

## App for:

* Management savings for crowd interactive

## Links to APP
 
This application should be the all-in-one services for all crowd members.

* [Production](http://saving-production.herokuapp.com)

* [Intregration](http://saving-staging.herokuapp.com)

## Ruby version

    2.2.2

## Dependencies

    'rails' 4.2.3
    'postgres' 9.4.0.1

## Setup Project 

    $ git clone git@github.com:crowdint/savings.git
    $ cd savings && bundle install

### Setup the repos for different environments
    $ git remote add origin git@github.com:crowdint/cronos-ds3.git 
    $ git remote add staging git@heroku.com:saving-staging.git
    $ git remote add production git@heroku.com:saving-production.git

* origin - for `development`
* production - for `production`
* staging - for `stage`

###Database creation

Create the db

    $ rake db:create:all
    $ rake db:migrate
    $ rake db:seed

##Set environment variables

###Figaro

We are using figaro to protect env variables with sensible information, so please create the file `config/application.ym` based on the information of `config/application.example.yml` and add your variables.

    $ cp config/application.example.yml config/application.yml

[For more info](https://github.com/laserlemon/figaro)

###Bamboohr client Initialization

    $ rake bamboo:sync_employees
