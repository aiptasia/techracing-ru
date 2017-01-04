Rails.application.routes.draw do

  # Root
  root 'static#index'

  # Static
  get 'service'     => 'static#service'
  get 'custom'      => 'static#custom'
  get 'contacts'    => 'static#contacts'

  get 'advertising/ford-focus-2-zamena-scepleniya'    => 'advertising#ford-focus-2-zamena-scepleniya'

  # User Activities
  match 'codeword_request', to: 'user_activities#codeword_request', via: 'post'
  match 'price_request',    to: 'user_activities#price_request', via: 'post'
  match 'new_feedback',     to: 'user_activities#new_feedback', via: 'post'
  match 'new_callback',     to: 'user_activities#new_callback', via: 'post'

  # Gallery
  get 'gallery',                            to: 'collections#index',  as: 'collections'
  get 'gallery/:id',                        to: 'collections#show',   as: 'collection'
  get 'gallery/:collection_id/media/:id',   to: 'media#show',         as: 'media'

  # Test
  get 'test'        => 'test#index'
  get 'test/hero'   => 'test#hero'

  # Redirect
  get '/price/ford/focus', to: redirect("/advertising/ford-focus-2-zamena-scepleniya", status: 301)

end
