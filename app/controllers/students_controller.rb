class StudentsController < ApplicationController

  before_action :authenticate

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def authenticate
    if not current_student
    redirect_to login_path, notice: 'Not logged in'
    end
  end

end
