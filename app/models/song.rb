class Song < ActiveRecord::Base
  belongs_to :user
  has_many :sounds

  validates :title, presence: true
end
