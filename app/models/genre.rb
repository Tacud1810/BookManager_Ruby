class Genre < ApplicationRecord
	has_many :books
	
	validates :name, presence:true
	validates :description, presence:true
end