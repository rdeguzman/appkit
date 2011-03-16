Appkit::Application.routes.draw do
  devise_for :users

  resources :app_profiles
  match "app_profiles/:id/summary" => "app_profiles#summary", :as => :app_profile_summary
  match "app_profiles/:id/image_assets" => "app_profiles#image_assets", :as => :app_profile_image_assets

  resources :app_builds

  resources :pages
  resources :pictures
  match "photo_gallery/index" => "photo_gallery#index", :as => :photo_gallery
  match "photo_gallery/create" => "photo_gallery#create", :as => :photo_gallery_create
  match "photo_gallery/:id/" => "photo_gallery#show", :as => :photo_gallery_show
  match "photo_gallery/:id/destroy" => "photo_gallery#destroy", :as => :photo_gallery_destroy

  resources :image_assets
  resources :single_pages
  match "buttons/add" => "buttons#add", :as => :add_button
  match "buttons/index" => "buttons#index", :as => :buttons
  match "buttons/delete_all" => "buttons#delete_all", :as => :delete_all_buttons
  

  resources :sections do
    resources :pages
  end

  match "overview" => "home#overview"
  match "pricing" => "home#pricing"
  match "faq" => "home#faq"
  match "about_us" => "home#about_us"
  match "contact_us" => "home#contact_us"
  match "export/:id" => "app_export#show", :as => :export

  root :to => "home#index"

  namespace "admin" do
    resources :users

    get "home/index", :as => :home
    root :to => 'home#index'
  end
  
end
