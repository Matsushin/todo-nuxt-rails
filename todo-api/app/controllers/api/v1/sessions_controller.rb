class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :authenticate!, only: [:create]

  def create
    outcome = User::SignIn.run(params)
    if outcome.valid?
      @user = outcome.result

      Rails.logger.info("User: #{@user.id} has successfully logged in.")

      render json: { token: @user.token, user: user_secure_column }
    else
      render json: { messages: outcome.errors.full_messages }, status: :unauthorized
    end
  end

  def token_current_user
    # ヘッダーのトークンに紐付いたuserを返す
    @user = current_user
    render json: { user: user_secure_column }
  end

  private

  def user_secure_column
    @user.as_json(except: [:created_at, :updated_at, :token, :password_digest])
  end
end
