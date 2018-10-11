class AuthorshipsController < ApplicationController


  def new 
    @authorship = Authorship.new
  end
  
  def create
    @authorship = Authorship.create(authorship_params)

    redirect_to root_path
  end

  def authorship_params
    params.require(:authorship).permit(:book_id, :author_id)
  end
end
