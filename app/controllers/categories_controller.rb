class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  	@words = Word.all
  	respond_to do |format|
  		format.html
  		format.json { render json: @categories.to_json }
  	end	
  end

end
