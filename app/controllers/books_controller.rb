class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]

  def new
    @book = Book.new
    @categories = ['Action', 'Biography', 'History', 'Horror', 'Kids', 'Learning', 'Sci-Fi']
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to action: 'show', id: @book.id, notice: 'Book created successfully'
    else
      render 'new'
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :category, :user_id)
  end
end
