json.tags @tags
json.paginate_meta do
  paginate_meta_attributes(json, @recipes)
end
json.recipes_ids @recipes.ids