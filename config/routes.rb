Rails.application.routes.draw do
  devise_for :admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'posts#index'
	get '/profile' => 'abouts#profile'
	get '/privacy' => 'abouts#privacy'
	get '/sitemap' => 'abouts#sitemap'

    namespace :admin do
        resources :posts
    end

	resources :posts, only: [:index, :show] do
        collection do
            get :search
        end
    end

	resource :tag, only: [:create]
	resource :contact, only: [:new, :create] do
		collection do
			post :confirm
		end
	end

end
