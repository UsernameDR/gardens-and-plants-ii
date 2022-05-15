Rails.application.routes.draw do
  root to: 'gardens#index'
  resources :gardens do
    resources :plants, only: [:new, :create]
  end

  resources :plants, only: :destroy do
    resources :plant_tags, only: [:new, :create]
  end
end

# user cannot create Tags
# user caan only assign tags to plants
