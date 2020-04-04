# WorkOut

This program was designed to keep track of your daily work outs. A new user is able to sign up or an existing user is able to log in to their account. When they are logged in the user is able to add a new workout,
with the data: name of the work out, how many reps/miles completed, and what day they completed it. On the users homepage they are able to view their past work outs, and edit or delete them if neccessary. 
Also the user is able to change their password, or username in the Account Settings. 


## Installation

The following gems were used for this application:

```ruby
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
```

To install these gems run:

    $ bundle



## Usage

After installing the gems that were used, in terminal run rake:db migrate to create the database needed. Then run rake db:seed for some seed data. Finally, run shotgun in terminal to start the server for our application and in your browser navigate to localhost:9393.
Check password and username fields in db/seeds to log into existing users.

## Development

Located in the Rakefile is a console that you can use for testing and developing new entries in the databse. You can access this console by running 'rake console' in terminal. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Lyoung0789/workout. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).



