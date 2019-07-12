class RatingsController < ApplicationController
  before_filter :authorize

  def new
  end

  def create
    product = Product.find(params[:product_id])
    rating = product.ratings.new(rating_params)
    rating.user = current_user
    if rating.save
      redirect_to '/'
    else 
      # p rating.errors.full_messages
      redirect_to product
    end
  end
  private

  def rating_params
    params.require(:rating).permit(:rating, :description)
  end

  



end
