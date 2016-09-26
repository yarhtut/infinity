class UsersController < ApplicationController
  before_action :set_user_projects, only: [:show,  :add_user_projects]
  def index
    @users = User.all
    @projects = Project.all
  end

  def new
    if current_user.type == 'AdminUser'
      @user = User.new
    else
      render :index
    end
  end

  def create
    @user = User.new(user_params)
    @user.id = User.last.id + 1
    @user.save
    if @user.save
      redirect_to admin_users_path, notice: 'Your Project was created successfully.'
    else
      redirect_to
    end
  end

  def add_user_projects
    @user_projects = UserProject.create!(user_id: params[:user][:user_id], project_id: params[:project][:project_id])
    @user_projects.save
    if @user_projects.save
      redirect_to admin_users_path, notice: 'Your Project was created successfully.'
    else
      redirect_to admin_users_path
    end
  end

  private

  def set_user_projects
    @user_projects = UserProject.all
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
