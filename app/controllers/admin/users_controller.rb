module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
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
      binding.pry
      if @user.save
        redirect_to admin_users_path, notice: 'Your Project was created successfully.'
      else
        redirect_to
      end
    end

    def update
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
  end
end
