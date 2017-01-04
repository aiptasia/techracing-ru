class Collection < ActiveRecord::Base
  has_many :media_collections, dependent: :destroy
  has_many :media, through: :media_collections
end
