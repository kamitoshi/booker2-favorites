class FavoritesController < ApplicationController

  before_action :set_book

  def create
    @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
    redirect_back(fallback_location: :back)
  end

  def destroy
    @favorite = Favorite.find_by(user_id:current_user.id, book_id: @book.id)
    @favorite.destroy
    redirect_back(fallback_location: :back)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

end
