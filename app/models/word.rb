class Word < ActiveRecord::Base
	belongs_to :category
	has_many :lessons, through: :lesson_words
	has_many :lesson_words

	has_many :word_answers
	accepts_nested_attributes_for :word_answers
end
