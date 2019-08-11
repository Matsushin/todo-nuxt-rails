class SendTestMail < ApplicationJob
  def perform
    logger.info('Run SendTestMail')
  end
end
