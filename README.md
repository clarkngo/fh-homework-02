# fh-homework-02

A repository of books that you can search!

This app powers <Project Name> located [here](Heroku Project URL)

## Getting Started

## Software requirements

- Rails 5.0.0 or higher

- Ruby 2.3.1 or higher

- PostgreSQL 9.5.x or higher

## Navigate to the Rails application

```
$ cd /path/to/rails/application
```

## Set configuration files

```
$ cp config/database.yml.template config/database.yml
$ cp config/initializers/mail.rb.template config/initializers/mail.rb
```

Note:  You may need to edit the above files as necessary for your system.

## Create the database

 ```
 $ pgstart
 $ rake db:create
 ```

## Migrating and seeding the database

```
$ rake db:migrate
$ rake db:seed
```

## Starting the local server

```
$ rails server

   or

$ rails s
```

## Production Deployment

  ```
  $ git push heroku master
  $ heroku run rake db:migrate
  ```

## Support

Bug reports and feature requests can be filed with the rest for the Ruby on Rails project here:

* [File Bug Reports and Features](https://github.com/clarkngo/fh-homework-02/issues)

## License

fh-homework-02 is released under the [MIT license](https://mit-license.org).

## Copyright

copyright:: (c) Copyright 2017 Clark Jason Ngo. All Rights Reserved.
