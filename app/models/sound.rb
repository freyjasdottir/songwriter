class Sound < ActiveRecord::Base
  belongs_to :song

  validates :track_url, format: { with: URI.regexp }, if: 'track_url.present?'
end
