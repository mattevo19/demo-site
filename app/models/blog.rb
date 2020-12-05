class Blog < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  # validates :title, presence :true
  # validates :description, length: {minimum:100}, presence :true
end
