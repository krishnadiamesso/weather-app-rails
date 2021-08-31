Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'opengeo/index'
      get 'opengeo/useragent'
      get 'opengeo/origin'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'openweather/index'

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
