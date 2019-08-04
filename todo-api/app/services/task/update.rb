class Task::Update < ApplicationService

  object :task
  string :title, default: nil
  string :body, default: nil

  def execute
    task.title = title
    task.body = body
    errors.merge!(task.errors) unless task.save
    task
  end
end
