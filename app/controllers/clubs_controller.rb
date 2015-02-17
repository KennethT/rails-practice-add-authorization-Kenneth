class ClubsController < ApplicationController

  before_action :authenticate

  def index
    @clubs = current_student.clubs
  end

  def show
    @club = Club.find(params[:id])
    if not current_student.clubs.include?(@club)
      render 'public/403.html', status: 403
    end
  end

  def authenticate
    if not current_student
    redirect_to login_path, notice: 'Not logged in'
    end
  end

end
