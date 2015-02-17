class ClubsController < ApplicationController

  before_action :authenticate

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

  def authenticate
    if not current_student
    redirect_to login_path, notice: 'Not logged in'
    end
  end

end
