class TestMailer < ApplicationMailer
  def notify(email)
    headers[:mail_reservation_id] = 10
    headers[:user_id] = 20
    mail(
        subject: 'テストメール',
        to: email,
        from: 'no-reply@matsushin-dev.net'
    )
  end
end
