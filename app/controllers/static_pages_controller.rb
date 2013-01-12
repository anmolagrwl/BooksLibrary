class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [ :sales ]

  def home

  end

  def sales
    @books_on_sale = Book.where("user_id = ? and on_sale = ? and sold = ?", current_user, true, false)
    @sold_books = Book.where("user_id = ? and sold = ?", current_user, true)
  end
end
