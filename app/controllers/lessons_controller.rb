class LessonsController < ApplicationController
  def index
  end

  def create
  	@lesson = Lesson.new lesson_params
  	@lesson.words = @lesson.category.words.sample(20)

  	if @lesson.save
  		redirect_to @lesson
  	else
  		redirect_to categories_path
  	end
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  private
  def lesson_params
    params.require(:lesson).permit(:category_id, :user_id)
  end
end
