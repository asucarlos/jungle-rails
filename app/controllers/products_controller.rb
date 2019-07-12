class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @user = current_user
    @product = Product.find params[:id]
    @ratings = @product.ratings.all.order(created_at: :desc)
    @rating = Rating.new
    @rating[:user_id] = session[:user_id]
  end

end