module Admin
  class ProjectsController < Admin::ApplicationController
    def index
      @users = User.all
      @projects = Project.all
    end

    def new
      if current_user.type == 'AdminUser'
        @project = Project.new
        @projects = Project.by_user_projects(current_user)
      else
        render :index
      end
    end

    def create
      @project = Project.new(project_params)
      @project.save
      @user_projects = UserProject.create(user_project_params)
      if @project.save && @user_projects.save
        redirect_to @project, notice: 'Your Project was created successfully.'
      else
        redirect_to project_path
      end
    end

    def edit
      @project = Project.find(params[:id])
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to admin_users_path
      end
    end

    private


    def project_params
      params.require(:project).permit(:title, :description)
    end
  end
end
