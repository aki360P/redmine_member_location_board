Rails.application.routes.draw do
  resources :projects do
    resources :rmlb_locations
    patch 'settings/rmlb_setting', :controller => 'rmlb_settings', action: :edit
  end
end