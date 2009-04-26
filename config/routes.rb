ActionController::Routing::Routes.draw do |map|
  map.root :controller => "pages", :action => "wedding"

  map.location 'location', :controller => "pages", :action => "location"
  map.engagement 'engagement', :controller => "pages", :action => "engagement"
  map.chriscait 'chriscait', :controller => "pages", :action => "chriscait"
  map.registries 'registries', :controller => "pages", :action => "registries"

  map.admin 'admin', :controller => "guests", :action => "index"

  map.resources :guests, :path_prefix => '/admin'
  map.resources :categories, :path_prefix => '/admin'
  map.resources :songs, :member => { :up => :post, :down => :post }, :path_prefix => '/admin'
  map.resources :rsvp

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
