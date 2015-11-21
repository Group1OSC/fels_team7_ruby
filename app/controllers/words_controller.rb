class WordsController < ApplicationController
  def index
  	@words = Word.all
    #@categories = Category.all
    @words = Word.where(category_id: params['category_id'] ) unless params[:category_id].blank?
    #@words = @words.paginate(:page => 1, :per_page => 10)

    #@results = @results.gender(params[:gender]) unless params[:gender].blank?
    
  	respond_to do |format|
  		format.html
  		format.json { render json: @words.to_json }
  	end
  end
  #
  def new
    @word = Word.new
  end

  def show 
  	@word = Word.find params[:id]
  	@word_answer = Word_answer.find prams[:id]
  end
end
