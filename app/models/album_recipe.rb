class AlbumRecipe < ActiveRecord::Base
  self.table_name = "ak_album_recipe"
  belongs_to :ak_recipe, foreign_key: "recipe_id"
  belongs_to :album, foreign_key: "album_id"
end