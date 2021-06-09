require 'json'
require 'open-uri'
class EmailsController < ApplicationController
  def notice
    Rails::logger::debug('========= notice ==========')
    TestMailer.notify.deliver_now
    head :ok
  end

  def create
    # bounce_mail受け取り
    Rails::logger::debug('===================')
    Rails::logger::debug(request.raw_post)
    Rails::logger::debug(JSON.parse(request.raw_post))
  end
end