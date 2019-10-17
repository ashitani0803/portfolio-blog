Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get '/profile' => 'abouts#profile'
	get '/privacy' => 'abouts#privacy'
	get '/sitemap' => 'abouts#sitemap'

	resources :posts
end
