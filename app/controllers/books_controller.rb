class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(username: create_book_params[:username])
    if user
      @book = Book.new(user_id: user.id, title: create_book_params[:title], category: create_book_params[:category])
      if @book.save
        render :created, status: :ok
      else
        render json: { message: 'Book not created' }
      end
    else
      render json: { message: 'User does not exist. Please sign up' }
    end
  end

  def index
    @user = User.find_by(username: params[:username])
    @user_books = @user.books
    render :index, status: :ok
  end

  def destroy
    return render json: { message: 'Book does not exist' }, status: :not_found unless Book.exists?(id: params[:book_id])

    @book = Book.find(params[:book_id])
    if @book.destroy
      render json: { message: 'Book deleted successfully' }, status: :ok
    else
      render json: { message: 'Book could not be deleted' }, status: :bad_request
    end
  end

  private

  def create_book_params
    params.require(:book).permit(:username, :title, :category)
  end
end
