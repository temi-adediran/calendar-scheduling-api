class UsersController < ApplicationController
  skip_before_action :authenticate

  def login
    user  = params[:user_type] === "coach" ? Coach.last : Student.last
    set_token_in_header(user)
    render json: {message: "Login successful for #{params[:user_type]}"}, status: :created
  end

  private
    def set_token_in_header(user)
      response.set_header "X-User-Token", user.signed_id
    end

    def user_params
      params.require(:user).permit(:name, :email, :phone_no, :user_type)
    end
end
