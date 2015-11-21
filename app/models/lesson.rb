class Lesson < ActiveRecord::Base
	belongs_to :category
	has_many :lesson_words 
	has_many :words, through: :lesson_words
	accepts_nested_attributes_for :lesson_words
end

