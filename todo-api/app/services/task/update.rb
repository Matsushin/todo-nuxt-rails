class Task::Update < ApplicationService

  object :task
  string :title, default: nil
  string :body, default: nil

  validates :title, :body, presence: true

  def execute
    task.title = title
    task.body = body
    errors.merge!(task.errors) unless task.save
    task
  end
end
