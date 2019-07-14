class User::SignIn < ApplicationService
  # 引数の順番がエラーメッセージの順番に影響する
  string :email, :password, default: nil
  validates :email, :password, presence: true

  def execute
    user = User.where.not(password_digest: nil).find_by(email: email)

    unless user&.authenticate(password)
      errors.add(:base, 'ＩＤ・パスワードに誤りがあるか、アカウントが登録されておりません。')
      return user
    end

    _, t = TokenGenerator.generate(User, 'token')

    user.update!(token: t, token_expired_at: User.token_expires)
    user.reload

    user
  end
end
