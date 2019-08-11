class SendTestMailJob < ApplicationJob
  def perform
    logger.info('Run SendTestMail')
  end
end
