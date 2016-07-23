Rails.application.routes.draw do
  root 'inventories#index'
  resources :inventories, only: :index do
    resources :inventory_shipment_assignments, only: [:create, :update]
  end
end
