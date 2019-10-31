class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :destroy, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_user_like, only: [:like]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: :destroy
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    
    if @recipe.save
      flash[:success] = "Your recipe was successfully created!"
      redirect_to recipes_path
    else
      render :new, formats: [:html]
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    if @recipe.update(recipe_params)
      redirect_to chef_path(@recipe.chef)
    else
      render 'edit', formats: [:html]
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_reviews = @recipe.reviews.all.paginate(page: params[:page], per_page: 4)
    @review = Review.new
  end
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 3)
  end
  
  def destroy
    Recipe.find(params(:id)).destroy
    flash[:success] = "Recipe Deleted"
    redirect_to recipes_path
  end
  
  
  def like
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your selection was successful"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a recipe once"
      redirect_to :back
    end
  end
  
  private
  
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [], ingredient_ids: [])
    end
    
    def set_recipe 
      @recipe = Recipe.find(params[:id])
    end
    
    def require_same_user 
      if current_user != @recipe.chef and !current_user.admin?
        flash[:danger] = "You can only edit your own recipe"
        redirect_to recipes_path
      end
    end
    
    def require_user_like
      if !current_user
        flash[:danger] = "You must be logged in to perform that"
        redirect_to :back
      end
    end

    def admin_user
      redirect_to recipes_path unless current_user.admin?
    end
end
