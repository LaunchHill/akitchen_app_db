Rails.application.routes.draw do
  # root 'welcome#index'
  get 'tag_search' => 'welcome#tag_search'
  get 'recipe_search' => 'ak_recipe_ingredient_translations#autocomplete_ak_recipe_ingredient_translation_title'
  resources :ak_recipe_ingredient_translations, only: [] do
    get :autocomplete_ak_recipe_ingredient_translation_title, :on => :collection
  end
end
