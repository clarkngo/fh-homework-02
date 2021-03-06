class BooksController < ApplicationController

  def index
    @books = Book.search(params[:term])
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
    @authors = @book.authors
  end

  def edit
    @book = Book.find(params[:id])
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
    Authorship.all.each do |authorship|
      if authorship.book_id == @book.id
        authorship.destroy
      end
    end
    @book.destroy
    redirect_to root_path
  end

  private 

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :book_type, :year, :sub_title)
  end

  

end
