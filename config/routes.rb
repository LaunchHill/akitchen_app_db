Rails.application.routes.draw do
  # root 'welcome#index'
  get 'tag_search' => 'welcome#tag_search'
  get 'best_this_week' => 'welcome#best_this_week'
  get 'you_may_like' => 'welcome#you_may_like'
  get 'recipe_search' => 'ak_recipe_ingredient_translations#autocomplete_ak_recipe_ingredient_translation_title'
  resources :ak_recipe_ingredient_translations, only: [] do
    get :autocomplete_ak_recipe_ingredient_translation_title, :on => :collection
  end
end
