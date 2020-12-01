class Review < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :rating, presence :true
  validates :description, presence :true, length: {minimum:10, maximum:250}
end