class AuthorsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :correct_user

  def create
    @book = Book.find_by_id(params[:author][:book_id])
    author = Author.new(params[:author])
    if author.save
      @book.authors << author
    end

    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    @author = Author.find_by_id(params[:id])
    @book = @author.book
    @author.destroy
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  private

  def correct_user
    @author = Author.find_by_id(params[:id])

    if @author
      book = @author.book
    else
      book = Book.find_by_id(params[:author][:book_id])
    end

    if book
      owner = book.user
      redirect_to book_path(book) unless current_user == owner
    else
      redirect_to book_path(book)
    end
  end
end