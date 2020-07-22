Rails.application.routes.draw do

  resources :users

  resource :session, only: [:destroy, :create, :new]

  resources :subs do 
    resources :posts, except: [:create]
  end

  resources :posts, only: [:create]

end

# Reddit
# index = subs_url = all subs
# contains 'make a new sub'

# show sub_url(sub) = contain all posts
# contains 'edit sub' and 'destroy sub' here

#subs index, which will be like homepage. 