Rails.application.routes.draw do
  get 'purchases', to: 'purchases#index'
  post 'purchases/upload'
  get 'invoices/', to: 'invoices#index'
  post 'invoices/upload', to: 'invoices#upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
