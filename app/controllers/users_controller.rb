class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  
    if params[:id].to_i == current_user.id
      redirect_to me_url
    else
      begin
        @user=User.find(params[:id]);
      rescue ActiveRecord::RecordNotFound
        flash[:alert]="User does not exist"
        redirect_to root_path
        return
      end
    end
  end

  def me
    @user=current_user
    render 'show'
  end
end
