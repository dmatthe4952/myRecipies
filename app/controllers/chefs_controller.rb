class ChefsController  < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  
  def new
    @chef = Chef.new
  end
  
  
  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      flash[:success] = "You were successfully registered!"
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      render :new, formats: [:html]
    end
  end
  
  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 2)
  end
  
  def edit
    
  end
  
  def update
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been successfully updated"
      redirect_to show_chef_path
    else
      render 'edit', formats: [:html]
    end
  end

   def index
    @chefs = Chef.paginate(page: params[:page], per_page: 4)
  end
 
  private
  
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end
    
    def require_same_user
      if current_user != @chef
        flash[:danger]= "You can only edit your own profile"
        redirect_to root_path
      end
    end
    
    def set_chef
      @chef = Chef.find(params[:id])
    end
    
end
