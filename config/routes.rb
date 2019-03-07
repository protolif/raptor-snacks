Rails.application.routes.draw do
  resources :snacks, only: [:index], defaults: { format: :html }
  get '/pdf_metadata', to: 'snacks#pdf_metadata', as: 'endpoint', defaults: { format: :json }
  root 'snacks#index'
# Built-in Active Storage routes:
# This replaces the Paperclip gem as a cloud storage solution.
#
# get /rails/active_storage/blobs/:signed_id/*filename(.:format),
# to: active_storage/blobs#show
# as: rails_service_blob
#
# get /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format),
# to: active_storage/representations#show,
# as: rails_blob_representation
#
# get /rails/active_storage/disk/:encoded_key/*filename(.:format),
# to: active_storage/disk#show,
# as: rails_disk_service
#
# put /rails/active_storage/disk/:encoded_token(.:format),
# to: active_storage/disk#update,
# as: update_rails_disk_service
#
# post /rails/active_storage/direct_uploads(.:format)
# to: active_storage/direct_uploads#create,
# as: rails_direct_uploads
#
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
