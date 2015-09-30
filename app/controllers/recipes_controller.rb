class RecipesController < ApplicationController
  http_basic_authenticate_with name: "mh", password: "secret",
  except: [:index, :show]
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2)
    
    if @recipe.save
      flash[:success] = "Your recipe was successfully created!"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def index
    @recipes = Recipe.all
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    
    redirect_to recipes_path
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
end
