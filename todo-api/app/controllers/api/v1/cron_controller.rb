class Api::V1::CronController < Api::V1::ApplicationController
  skip_before_action :authenticate!
  before_action :authorize_worker

  def send_test_mail_job
    SendTestMailJob.perform_later
    head :ok
  end

  def test_batch_job
    TestBatchJob.perform_now
    head :ok
  end

  private

  # worker環境でない場合(active-elastic-jobでworker環境はPROCESS_ACTIVE_ELASTIC_JOBSをtrueに設定している)は拒否
  def authorize_worker
    head :forbidden unless ENV['PROCESS_ACTIVE_ELASTIC_JOBS'] == 'true'
  end
end
