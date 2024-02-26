Rails.application.routes.draw do
  namespace :account do
    shallow do
      resources :teams do
        resources :feedback
        # This fixes an issue with index being the same as create:
        post 'feedback' => 'account/feedback#create', as: :feedback
      end
      get 'feedback' => 'account/feedback#index'
    end
  end
end
