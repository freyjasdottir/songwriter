class Art < ActiveRecord::Base
  mount_uploader :imgfile, ArtUploader

  belongs_to :song

  validates :imgfile, presence: { message: 'Must choose a file to upload' }
end
