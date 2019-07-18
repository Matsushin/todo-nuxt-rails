class Api::V1::TasksController < Api::V1::ApplicationController

  def index
    tasks = current_user.tasks
    render json: tasks.to_json
  end

  def create
    outcome = Task::Create.run(task_params.merge(user: current_user))

    if outcome.valid?
      render json: outcome.result
    else
      render json: { errors: outcome.errors.full_messages }
    end
  end

  def update
    task = Task.find(params[:id])
    outcome = Task::Update.run(task_params.merge(task: task))

    if outcome.valid?
      render json: outcome.result
    else
      render json: { errors: outcome.errors.full_messages }
    end
  end

  def show
    task = Task.find(params[:id])
    render json: task.to_json
  end

  def destroy
    task = Task.find(params[:id])
    outcome = Task::Delete.run(task: task)
    if outcome.valid?
      render json: outcome.result
    else
      render json: { errors: outcome.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

  def task_params
    { title: params[:title], body: params[:body] }
  end
end