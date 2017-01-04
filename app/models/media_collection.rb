class MediaCollection < ActiveRecord::Base
  belongs_to :collection
  belongs_to :medium
end
