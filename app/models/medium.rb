class Medium < ActiveRecord::Base
  has_many :media_collections, dependent: :destroy
  has_many :collections, through: :media_collections
end
