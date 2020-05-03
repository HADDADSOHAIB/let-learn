class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  
    if params[:id].to_i == current_user.id
      redirect_to me_url
    else
      begin
        @user=User.find(params[:id]);
        @thought = Thought.new
      rescue ActiveRecord::RecordNotFound
        flash[:alert]="User does not exist"
        redirect_to root_path
        return
      end
    end
  end

  def me
    @user=current_user
    @thought = Thought.new
    render 'show'
  end
end
