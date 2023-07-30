class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  
  validates :title, presence: true
  # validates :author, presence: true
  validates :year, presence: true
  validates :pages, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
end