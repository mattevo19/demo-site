class Blog < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :discripton, presence :true
end
