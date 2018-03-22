Rails.application.routes.draw do
  root to: 'images#index'
  mount Picturesque::Engine, at: '/picturesque', as: :picturesque
end
