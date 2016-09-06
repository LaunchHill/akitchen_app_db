class WelcomeController < ApplicationController
  def tag_search
    @tags = AkRecipeTag.ransack(locale_eq: params[:locale], content_cont: params[:q]).result.pluck(:content).uniq.first(5)
    @recipe_ids = AkRecipeTag.where(content: @tags, deleted_at: nil).pluck(:biz_id).uniq
    @recipes_find_by_title = AkRecipeTranslation.ransack(title_cont: params[:q]).result
    @recipes_find_by_title.each do |re|
      @recipe_ids << re.recipe_id
    end
    @recipes = paginate(AkRecipe.where(id: @recipe_ids))
  end

  def best_this_week
    tags = AkRecipeTag.ransack(locale_eq: params[:locale], content_eq: "BEST_THIS_WEEK").result
    # if no locale, no taste_tag, taste_tag should include all tags
    if params[:locale] || params[:taste_tag]
      @taste_tags = AkRecipeTag.ransack(locale_eq: params[:locale], relation_id_eq: params[:taste_tag], relation_type_eq: 2).result
    else
      @taste_tags = AkRecipeTag.all
    end

    offset = 0
    offset = params[:offset].to_i if params[:offset]
    length = 10
    length = params[:limit].to_i if params[:limit]

    # get the same recipe_id in tags and @taste_tags
    @biz_ids = tags.pluck(:biz_id).uniq & @taste_tags.pluck(:biz_id).uniq
    @bizs = AkRecipeTag.where(biz_id: @biz_ids, content: "BEST_THIS_WEEK", deleted_at: nil).order(sort: :desc)[offset, length]
    hash_bizs = []
    @bizs.each do |biz|
      hash_bizs << {biz_id: biz.biz_id, biz_type: biz.biz_type}
    end
    render json: {bizs: hash_bizs}
  end

  def you_may_like
    # if taste_tag is empty, @tags should be all tags
    if params[:taste_tag]
      # the taste tag type is 2
      # just search recipe, the biz_type be 1, if album, biz_type be 2
      @tags = AkRecipeTag.ransack(relation_id_eq: params[:taste_tag], relation_type_eq: 2, biz_type_eq: 1).result
    else
      @tags = AkRecipeTag.all
    end

    recipe_limit = 10
    recipe_limit = params[:recipe_limit].to_i if params[:recipe_limit]
    @recipe_ids = @tags.pluck(:biz_id).uniq.sample(recipe_limit)

    @recipe_ids<<AkRecipe.all(order: 'RANDOM()', limit: 4).pluck(:id)
    album_limit = 10
    album_limit = params[:album_limit].to_i if params[:album_limit]
    @album_ids =AlbumRecipe.where(recipe_id: @tags.pluck(:biz_id).uniq, deleted_at: nil).pluck(:album_id).uniq.sample(album_limit)

    render json: {recipe_ids: @recipe_ids, album_ids: @album_ids}
  end
end