class CommentsController < ApplicationController
  http_basic_authenticate_with name: "mh", password: "secret",
  only: :destroy
  
  def create
    @recipe = Redipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_params)
    redirect_to recipe_path(@recipe)
  end
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

