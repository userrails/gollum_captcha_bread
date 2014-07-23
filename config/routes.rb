Rails.application.routes.draw do

  get 'pictures/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :pictures
  resources :teachers
  resources :homes
  resources :documents do
   collection do
     get :show_pdf
     get :show_report
   end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'homes#index'
end