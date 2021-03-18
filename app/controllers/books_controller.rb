class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      render json: { message: Book created successfully }, notice: 'Book created successfully'
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :category)
  end
end
