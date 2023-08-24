require 'test_helper'

class GenreTest < ActiveSupport::TestCase

	def setup 
		@genre = Genre.new(name: "Sport", description:"This is sport")
	end 

		test "genre validace" do
			assert @genre.valid?
		end

		test "unique_name" do 
			@genre.save
			@genre2 = Genre.new(name: "Sport", description:"This is sport")
			assert_not @genre2.valid?
		end

		test "long_names" do
			@genre.name = "a" * 26
			assert_not @genre.valid?			
		end

		test "short_names" do
			@genre.name = "aa"
			assert_not @genre.valid?	
		end

end
