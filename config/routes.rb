Rails.application.routes.draw do
  # root 'welcome#index'
  get 'tag_search' => 'welcome#tag_search'
end
