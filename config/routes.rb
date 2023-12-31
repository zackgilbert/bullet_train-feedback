Rails.application.routes.draw do

  resources :feedback, only: [:new, :create]

end
