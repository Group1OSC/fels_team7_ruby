class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  	#@category = Category.find(params[:id])
  	#@words = @category.words
  end
end
