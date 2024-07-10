class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # before_action :authenticate

  def set_coach
    @coach ||= Coach.last
  end

  def set_student
    @student ||= Student.last
  end

  def touch_coach
    @coach.touch
  end

  def symbolized_params(params)
    JSON.parse(params.to_json, {symbolize_names: true})
  end

  private
    def authenticate
      if user = authenticate_with_http_token { |token, _| User.find_signed(token) }
        current_user = user
      else
        request_http_token_authentication
      end
    end
end
