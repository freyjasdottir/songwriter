class Text < ActiveRecord::Base
  belongs_to :song

  validates :body, presence: true
end
