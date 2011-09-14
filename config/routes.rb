Socialcounts::Application.routes.draw do

	root :to => 'home#index'

	match '/shares' => 'shares#count'

end
