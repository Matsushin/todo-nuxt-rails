class Task::Delete < ApplicationService
  object :task

  def execute
    unless task.destroy
      errors.merge!(task.errors)
    end

    task
  end
end
