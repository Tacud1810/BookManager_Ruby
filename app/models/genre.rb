class Genre < ApplicationRecord
	has_many :books
	
	validates :name, presence:true, length: {minimum: 3, maximum: 20}
	validates_uniqueness_of :name
	validates :description, presence:true
end