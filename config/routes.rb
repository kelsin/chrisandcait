ActionController::Routing::Routes.draw do |map|
    map.root :controller => "pages"
    map.resources :guests, :path_prefix => '/admin'

    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
end
