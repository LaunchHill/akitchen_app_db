class AkRecipeTranslation < ActiveRecord::Base
	self.table_name = "ak_recipe_translation"
  belongs_to :ak_recipe, foreign_key: "recipe_id"
end