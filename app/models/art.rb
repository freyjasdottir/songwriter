class Art < ActiveRecord::Base
  mount_uploader :art, ArtUploader

  belongs_to :song

  validates :art, presence: true
end
