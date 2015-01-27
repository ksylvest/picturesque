Rails.application.routes.draw do
  root to: 'photos#index'
  mount Picturesque::Engine, at: "/picturesque", as: :picturesque
end
