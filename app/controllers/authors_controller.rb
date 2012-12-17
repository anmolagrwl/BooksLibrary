class AuthorsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :correct_user

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
    book = @author.book
    if book
      owner = book.user
      redirect_to book_path(book) unless current_user == owner
    else
      redirect_to book_path(book)
    end
  end
end