class ApplicationJob < ActiveJob::Base
  queue_as ENV['AWS_DEFAULT_SQS']
end
