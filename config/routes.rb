Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'posts#index'
	get '/profile' => 'abouts#profile'
	get '/privacy' => 'abouts#privacy'
	get '/sitemap' => 'abouts#sitemap'

	resources :posts do
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
