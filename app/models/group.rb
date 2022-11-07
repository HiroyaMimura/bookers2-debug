class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_one_attached :image_id

  validates :name, presence: true
  validates :introduction, presence: true

  def group_image
    (image_id.attached?) ? image_id: 'no_image.jpg'
  end

end
