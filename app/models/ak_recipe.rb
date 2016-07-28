class AkRecipe < ActiveRecord::Base
  self.table_name = "ak_recipe"
  has_many :ak_recipe_tags
end