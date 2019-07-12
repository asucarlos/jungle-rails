class RatingsController < ApplicationController
  def new
  end

  def create
    rating = Rating.new(rating_params)
    if rating.save
      redirect_to '/'
  end
  private

  def rating_params
    params.require(:rating).permit(:user, :rating, :product, :description)
  end



end
