class WordsController < ApplicationController
  def index
  	@words = Word.all
  	respond_to do |format|
  		format.html
  		format.json { render json: @words.to_json }
  	end
  end
end
