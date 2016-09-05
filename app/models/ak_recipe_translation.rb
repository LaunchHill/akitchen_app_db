class AkRecipeTranslation < ActiveRecord::Base
  belongs_to :ak_recipe, foreign_key: "recipe_id"
end