class Admin::WordsController < ApplicationController
	layout "admin"
	def index
		@words = Word.all
		@categories = Category.all

	end
	#New
	def new
		@word = Word.new
		4.times do
			@word.word_answers.build 
		end

	end
	#Show
	def show
		@word = Word.find params[:id]
	end
	#Create
	def create
		@word = Word.new word_params

		if @word.save
			redirect_to [:admin, @word]
		else
			render :new
		end
	end
	#
	def edit
  		@word = Word.find(params[:id])   
  	end
  	#
  	def update
	    @word = Word.find(params[:id])
	    if @word.update_attributes(word_params)
	      flash[:success] = "Updated"
	      redirect_to admin_words_path
	    else
	      render 'edit'
    	end
    end	
	#Destroy
	def destroy
    	Word.find(params[:id]).destroy
      flash[:success] = "Destroyed"
      redirect_to admin_words_path    
  	end

	private
	def word_params
		params.require(:word).permit :content, :category_id, word_answers_attributes: [:content, :correct]
	end
end
