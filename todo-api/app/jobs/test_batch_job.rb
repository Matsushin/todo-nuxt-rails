class TestBatchJob < ApplicationJob
  def perform
    logger.info('Run TestBatchJob')
  end
end
