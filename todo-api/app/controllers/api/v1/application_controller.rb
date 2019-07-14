class Api::V1::ApplicationController < ApplicationController
  include Rails::Pagination

  protect_from_forgery with: :null_session
  before_action :authenticate!, :log

  private

  attr_accessor :token

  def set_current_user_and_authenticate_with_token
    # https://qiita.com/Yarimizu14/items/c81a8cf1859f954b953e
    # Authorization: Token xxx, Authorization: Bearer xxx どちらでもいけます。
    # 返り値 認証成功: true, 認証失敗: false
    authenticate_with_http_token do |token, options|
      self.token = token

      @current_user = User.find_by(token: token)

      return false unless @current_user

      unless @current_user.available_token?
        @current_user.token_refresh!
        @current_user = nil
        return false
      end
      @current_user.update(token_expired_at: User.token_expires)
      true
    end
  end

  def authenticate!
    set_current_user_and_authenticate_with_token || log_invalid_token && render_unauthorized
  end

  def current_user
    @current_user
  end

  def log
    return unless @current_user

    Rails.logger.info("User:#{@current_user.id} will call: #{self.class}::#{params[:action]}")
  end

  def log_invalid_token
    Rails.logger.info("Invalid Token #{token}")
  end

  def current_organization
    current_user.organization
  end

  def render_unauthorized
    render json: { messages: ['token invalid!'] }, status: :unauthorized
  end
end
