class User < ActiveRecord::Base
  #mount_uploader :avatar, AvatarUploader

  has_many :songs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true

  def can_modify?(item)
    id == item.user_id
  end

end
