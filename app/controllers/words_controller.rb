class WordsController < ApplicationController
  def index
  	@words = Word.all
  	respond_to do |format|
  		format.html
  		format.json { render json: @words.to_json }
  	end
  end
  def show 
  	@word = Word.find params[:id]
  	@word_answer = Word_answer.find prams[:id]
  end
end
