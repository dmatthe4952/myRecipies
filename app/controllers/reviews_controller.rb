class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end
  
  def show
 
  end
  
  def create
    @chef = current_user
    @recipe = Recipe.find(params[:review][:recipe_id].to_i)
    @review = @recipe.reviews.new(:body=>params[:review][:body], :chef_id=>@chef.id, :recipe_id=>@recipe.id)
    if @review.save
      flash[:success] = "Your comment was added"
      redirect_to '/recipes#index'
    else
      flash[:success] ="Only one comment allowed per recipe"
      redirect_to '/recipes#index'
    end
  end
  
end