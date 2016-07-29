class WelcomeController < ApplicationController
  def tag_search
    @tags = AkRecipeTag.ransack(locale_eq: params[:locale], content_cont: params[:q]).result.pluck(:content).uniq.first(5)
    @recipe_ids = AkRecipeTag.where(content: @tags).pluck(:recipe_id).uniq
    @recipes = paginate(AkRecipe.where(id: @recipe_ids))
  end

  def best_this_week
    tags = AkRecipeTag.ransack(locale_eq: params[:locale], content_cont: "BEST_THIS_WEEK").result
    @recipe_ids = tags.pluck(:recipe_id).uniq
    @album_ids = AlbumRecipe.where(recipe_id: @recipe_ids).pluck(:album_id).uniq
  end

  def you_may_like
    @recipe_ids = AkRecipe.ids.sample(params[:recipe_limit] || 10)
    @album_ids = Album.ids.sample(params[:album_limit] || 10)
    render json: {recipe_ids: @recipe_ids, album_ids: @album_ids}
  end
end