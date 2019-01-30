Rails.application.routes.draw do
  resources :projects do
    resources :rmlb_locationes
    match 'rmlb_location/:action', :controller => 'rmlb_locations', :via => [:get, :post, :patch, :put]
    match 'settings/rmlb_location/:action', :controller => 'rmlb_settings', :via => [:get, :post, :patch, :put]
  end
end