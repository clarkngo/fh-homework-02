Change config/database.yml
pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
username: postgres
password: password
host: localhost

production:
<<: *default
database: fh-homework-02_production
# username: fh-homework-02
# password: <%= ENV['FH-HOMEWORK-02_DATABASE_PASSWORD'] %>

Create your initial database
$ rake db:create

If existing
rake db:reset
Terminal
$ rails generate controller books

If freezes
spring stop

Terminal
rails generate model book

db/migrate/XXXXX_create_books.rb

class CreateQuotes < ActiveRecord::Migration[5.0]
def change
create_table :books do |t|
t.string :title
t.string :author
t.string :genre
t.string :classification
t.string :type
t.integer :year
t.timestamps
end
end
end

Terminal
$ rake db:migrate

config/routes.rb
Rails.application.routes.draw do
root ‘books#index'
resources :books    
end

app/controllers/books_controller.rb
class BooksController < ApplicationController
def index
@book = Book.first
end
end

app/views/books/index.html.erb
<h1><%= @book.inspect %></h1>

app/models/book.rb
class Book < ApplicationRecord

book_classification = [
'General Works - encyclopedias',
'Philosophy, Psychology, Religion',
'History - Auxiliary Sciences',
'History (except American)',
'General U.S. History',
'Local U.S. History',
'Geography, Anthropology, Recreation',
'Social Sciences U',
'Political Science V',
'Law Z - Bibliography and Library Science',
'Education',
'Music',
'Fine Arts',
'Language and Literature',
'Science',
'Medicine',
'Agriculture',
'Technology',
'Military',
'Naval Science',
'Bibliography and Library Science'
]

book_classification = [
'Fiction',
'Non-Fiction'
]

validates :title, presence: true
validates :author, presence: true
validates :genre, presence: true
validates :classification, presence: true
validates :type, presence: true
validates :year, presence: true, length: { minimum: 4 }
end


Install gem install faker
gem install faker

app/controllers/books_controller.rb

class BooksController < ApplicationController
# add book

# update book

# delete book

# list all books

# show book details

# search for book by [title, author, classification, genre, type]

def index
@book = Book.first
end

def new 
@book = Book.new
end

def create
@book = Book.create(book_params)
if @book.invalid?
flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
end
redirect_to root_path
end

def edit
@book = book.find(params[:id])
end

def update
@book = Book.find(params[:id])
@book.update_attributes(book_params)
if @book.valid?
redirect_to root_path
else
render :edit, status: :unprocessable_entity
end
end

def destroy
@book = Book.find(params[:id])

@book.destroy
redirect_to root_path
end

private 

def book_params
params.require(:quote).permit(:title, :author, :genre, :classification, :type, :year)
end

end

Gem
gem 'simple_form'

$ bundle install

rails generate simple_form:install --bootstrap


Troubleshoot

Book.create(title: 'The Giver', author: 'Lois Lowry', genre: 'dystopian literature', classification: 'Philosophy, Psychology, Religion', type: 'Fiction', year: '1993')
ActiveRecord::SubclassNotFound: The single-table inheritance mechanism failed to locate the subclass: 'Fiction'. This error is raised because the column 'type' is reserved for storing the class in case of inheritance. Please rename this column if you didn't intend it to be used for storing the inheritance class or overwrite Book.inheritance_column to use another column for that information.



