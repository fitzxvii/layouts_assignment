class UsersController < ApplicationController
  layout "twocol"
  def index
    @users = User.all
  end

  def create
    @create_user = User.create(user_params)
    @create_user.errors.full_messages.each do |error|
      flash[:first_name] = error if error[0..4] == "First"
      flash[:last_name] = error if error[0..3] == "Last"
      flash[:favorite_language] = error if error[0..7] == "Favorite"
    end
    redirect_to "/users"
  end

  private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :favorite_language)
    end
end
