class RecipeListsController < ApplicationController

  def new
    @recipe_list = RecipeList.new
  end

  def create
    @recipe_list = current_user.recipe_lists.build(list_params)

    if @recipe_list.save
      flash[:notice] = 'Successo'
      return redirect_to root_path
    end

    flash.now[:alert] = 'Erro'
    render :new
  end

  def index
    @recipe_lists = current_user.recipe_lists
  end

  private

  def list_params
    params.require(:recipe_list).permit(:name)
  end
end