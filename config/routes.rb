Rails.application.routes.draw do
  get 'invoices/', to: 'invoices#index'
  post 'invoices/upload', to: 'invoices#upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
