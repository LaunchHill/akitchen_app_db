class WelcomeController < ApplicationController
  def tag_search
    @tags = AkRecipeTag.ransack(locale_eq: params[:locale], content_cont: params[:q]).result.pluck(:content).uniq.first(5)
    @recipe_ids = AkRecipeTag.where(content: @tags).pluck(:recipe_id).uniq
    @recipes = paginate(AkRecipe.where(id: @recipe_ids))
  end
end