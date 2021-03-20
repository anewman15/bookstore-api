class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(username: book_params[:username])
    if user
      @book = Book.new(user_id: user.id, title: book_params[:title], category: book_params[:category])
      if @book.save
        render json: @book, status: :ok
      else
        render json: { message: 'Book not created' }
      end
    else
      render json: { message: 'User does not exist. Please sign up' }
    end
  end

  private

  def create_book_params
    params.require(:book).permit(:username, :title, :category)
  end
end
