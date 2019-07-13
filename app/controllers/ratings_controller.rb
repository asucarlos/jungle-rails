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
      redirect_to product
    end
  end

  def destroy
    @rating.destroy
    redirect_to [@product], notice: 'Review deleted!'
  end
  private

  def rating_params
    params.require(:rating).permit(:rating, :description)
  end

  



end
