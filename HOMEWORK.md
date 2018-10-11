# Homework 2 - Building a simple Rails application

## Due Date

TBD

## Goals

- The purpose of this application is to build a simple book catalog application
with the following features:

- add book

- update book

- delete book

- list all books

- show book details

- search for book by [title, author, classification, genre, type]

## Readings and Resources

Active Record Query Interface - http://guides.rubyonrails.org/active_record_querying.html

Generic Search Form - http://guides.rubyonrails.org/form_helpers.html#a-generic-search-form

Faker - https://github.com/stympy/faker

Seed File - http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

## Book model information

- The book model will hold information about our book and it should have the
following fields at a minimum:

- title - string

- author - string

- genre - string

- classification - string

possible options for classification

- General Works - encyclopedias
- Philosophy, Psychology, Religion
- History - Auxiliary Sciences
- History (except American)
- General U.S. History
- Local U.S. History
- Geography, Anthropology, Recreation
- Social Sciences    U
- Political Science    V
- Law    Z - Bibliography and Library Science
- Education
- Music
- Fine Arts
- Language and Literature
- Science
- Medicine
- Agriculture
- Technology
- Military
- Naval Science
- Bibliography and Library Science

- type - string

possible options for type

- Fiction
- Nonfiction

- year - integer

## Creating Rails API application

```
$ rails new fh-homework-02 -T -d postgresql
$ cd fh-homework-02
$ git init
$ git remote add origin git@github.com:clarkngo/fh-homework-02.git
$ git push -u origin master
$ git add .
$ git commit -am 'Initial commit'
$ git checkout -b part-01-initial-app
```

## Generate Fake Data

- Use a Ruby gem called `faker` to generate 50 books

- add the logic to your `seeds.rb` file for creating the book models

## Deliverables

- create a repo called `fh-homework-02` on Github.com

- push changes to Github to the branch, `part-01-initial-app`

```
$ git checkout part-01-initial-app
$ git push
```

- merge changes into the master branch and push to Github

```
$ git checkout master
$ git merge part-01-initial-app
$ git push
```

- send me the link to your `part-01-initial-app` branch

## Have Questions

Please make a reasonable effort to complete the homework prior to our next session.  If you have any questions regarding this homework, please do send me a message via Slack.
