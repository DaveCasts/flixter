class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :sections
  has_many :lessons
  has_many :enrollments

  validates :title, presence: true, length: {minimum: 3, maximum: 100}
  validates :description, presence: true, length: {minimum: 3, maximum: 250}
  validates :cost, presence:true, numericality: {greater_than_or_equal_to: 0}

  def free?
    cost.zero?
  end

  def premium?
    ! free?
  end
end
