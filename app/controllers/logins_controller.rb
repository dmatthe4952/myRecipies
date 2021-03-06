class LoginsController < ApplicationController
  
  def new
    chef = Chef.new
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash.now[:success] = "You are logged in"
      redirect_to recipes_path
    else
      flash.now[:danger] = "Your email or password did not match"
      render "new", formats: [:html]
    end
  end
  
  def destroy
    session[:chef_id] = nil
    redirect_to root_path
  end
end
