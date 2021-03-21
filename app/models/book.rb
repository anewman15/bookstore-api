class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
