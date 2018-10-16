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

  private 

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def full_name
    @author.first_name
  end
end
