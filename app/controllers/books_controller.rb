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

  def show
    @book = Book.find(params[:id])
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
