class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    begin
      @user=User.find(params[:id]);
    rescue ActiveRecord::RecordNotFound
      flash[:alert]="User does not exist"
      redirect_to root_path
      return
    end
  end
end
