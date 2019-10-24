class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @courses = Course.all
  end

  def create
    current_user.courses.create(course_params)
    if current_course.valid?
      redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private



  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end

end
