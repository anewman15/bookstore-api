class Book < ApplicationRecord
  validates :title, presence: true
  validates :pages, presence: true
end
