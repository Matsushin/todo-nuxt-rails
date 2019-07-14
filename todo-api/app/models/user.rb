# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string(255)      not null
#  username         :string(255)      not null
#  password_digest  :string(255)
#  token            :string(255)
#  token_expired_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ApplicationRecord
  has_secure_password validations: false
  has_secure_token

  has_many :tasks, dependent: :destroy

  validates :username, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :password, # 半角英数字を各一文字以上含む6-100文字の文字列
            format: {
                with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i,
                message: 'は英数6文字以上で指定してください。'
            },
            allow_blank: true

  def available_token?
    token_expired_at && token_expired_at > Time.current
  end

  def token_refresh!
    _, t = TokenGenerator.generate(User, 'token')
    self.update!(token: t, token_expired_at: User.token_expires)
  end

  class << self
    def token_expires
      3.hours.since
    end

    def generate_password
      # 半角英数字を各一文字以上含む6-100文字の文字列
      s = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      n = [('0'..'9')].map { |i| i.to_a }.flatten

      string_part = (0...8).map { s[rand(s.length)] }.join
      number_part = (0...8).map { n[rand(n.length)] }.join

      string_part + number_part
    end
  end
end
