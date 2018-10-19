class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new 
    @author = Author.new
  end
  
  def create
    @author = Author.create(author_params)
    if @book.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)
    if @author.valid?
      redirect_to author_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    Authorship.all.each do |authorship|
      if authorship.author_id == @author.id
        Book.find(authorship.book_id).destroy
        authorship.destroy
      end
    end
    @author.destroy
    redirect_to authors_path
  end

  
  private 

  def author_params
    params.require(:author).permit(:first_name, :last_name, :age)
  end

  def full_name
    @author.first_name
  end
end
