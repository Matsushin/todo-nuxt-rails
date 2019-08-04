class Task::Create < ApplicationService
  object :user, default: nil
  string :title, default: nil
  string :body, default: nil

  validates :user, presence: true

  def execute
    record = Task.new(inputs)
    errors.merge!(record.errors) unless record.save
    record
  end
end