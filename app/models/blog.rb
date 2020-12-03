class Blog < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validates :title, presence :true
  # validates :description, length: {minimum:100}, presence :true
end
