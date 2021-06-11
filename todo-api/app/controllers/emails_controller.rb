require 'json'
require 'open-uri'
class EmailsController < ApplicationController
  protect_from_forgery with: :null_session

  def notice
    email = params[:email] || ENV['TEST_MAIL'] || 'matsushin.dev@gmail.com'
    Rails::logger::debug('========= notice ==========')
    TestMailer.notify(email).deliver_now
    head :ok
  end

  def create
    # bounce_mail受け取り
    Rails::logger::debug('===================')
    Rails::logger::debug(request.raw_post)
    data = JSON.parse(request.raw_post)
    Rails::logger::debug(data)

    if data['SubscribeURL'].present?
      Rails::logger::debug('========= open ==========')
      open(data['SubscribeURL'])
    else
      Rails::logger::debug('========= subscribed ==========')
    end
  end

  def create2
    # bounce_mail受け取り
    Rails::logger::debug('===================')
    Rails::logger::debug(request.raw_post)
    data = JSON.parse(request.raw_post)
    Rails::logger::debug(data)

    if data['SubscribeURL'].present?
      Rails::logger::debug('========= open ==========')
      open(data['SubscribeURL'])
    else
      Rails::logger::debug('========= subscribed ==========')
    end
    head :ok
  end
end