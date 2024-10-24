# Teacher Portal

## Prerequisites
The setup steps expect following tools installed on the system.

* Ruby version `3.0.0`
* Rails version `7.1.4.1`
* Bundler

## Setup steps
  - Clone application from github.
  - Update database.yml to connect to with Postgresql DB
  - Run the following commands in terminal
  - Please Login with username and password
  - username: admin@yopmail.com, password: 123456

  ```bash
  $ bundle install
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed
  $ rails s
  ```

## Testing
 Run the following command on the terminal to execute test suit.
  ```bash
  $ rails test test/
