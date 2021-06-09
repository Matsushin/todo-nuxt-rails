class TestMailer < ApplicationMailer
  def notify
    headers[:mail_reservation_id] = 10
    headers[:user_id] = 20
    mail(
        subject: 'テストメール',
        to: ENV['TEST_MAIL'] || 'matsushin.dev@gmail.com',
        from: 'matsushin.dev@gmail.com'
    )
  end
end
