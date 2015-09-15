class RecipiesController < ApplicationController
  http_basic_authenticate_with name: "mh", password: "secret",
  except: [:index, :show]
  
  def new
    @recipie = Recipie.new
  end
  
  def create
    @recipie = Recipie.new(recipie_params)
    
    if @recipie.save
      redirect_to @recipie
    else
      render 'new'
    end
  end
  
  def edit
    @recipie = Recipie.find(params[:id])
  end
  
  def update
    @recipie = Recipie.find(params[:id])
    
    if @recipie.update(recipie_params)
      redirect_to @recipie
    else
      render 'edit'
    end
  end
  
  def show
    @recipie = Recipie.find(params[:id])
  end
  
  def index
    @recipies = Recipie.all
  end
  
  def destroy
    @recipie = Recipie.find(params[:id])
    @recipie.destroy
    
    redirect_to recipies_path
  end
  
  private
    def recipie_params
      params.require(:recipie).permit(:title, :text)
    end
end
