Rails.application.routes.draw do
    devise_for :user, path: "admin", skip: [:passwords]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'posts#index'
	get '/profile' => 'abouts#profile'
	get '/privacy' => 'abouts#privacy'
	get '/sitemap' => 'abouts#sitemap'

    namespace :admin do
        resources :posts
        resource :user, only: [:edit, :update]
        resources :contacts, only: [:index, :show]
    end

	resources :posts, only: [:index, :show] do
        collection do
            get :search
        end
    end

	resource :tag, only: [:create]
	resource :contacts, only: [:new, :create] do
		collection do
			post :confirm
            get :complete
		end
	end

end
