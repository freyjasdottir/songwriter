class Song < ActiveRecord::Base
  belongs_to :user
  has_many :sounds, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :arts, dependent: :destroy

  validates :title, presence: true
end
