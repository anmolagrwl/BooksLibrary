class BooksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, only: [ :show, :destroy, :edit, :update ]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book.destroy
    flash[:success] = 'Book deleted'
    redirect_to books_path
  end

  def edit
  end

  def update
    if @book.update_attributes(params[:book])
      flash[:success] = 'Book updated'
      redirect_to @book
    else
      render 'edit'
    end
  end

  private

  def correct_user
    @book = Book.find(params[:id])
    owner = @book.user
    redirect_to books_path unless current_user == owner
  end
end
