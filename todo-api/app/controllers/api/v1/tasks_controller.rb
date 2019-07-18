class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :set_task, only: %i[update show destroy]

  def index
    tasks = current_user.tasks
    render json: tasks.to_json
  end

  def create
    authorize Task
    outcome = Task::Create.run(task_params.merge(user: current_user))

    if outcome.valid?
      render json: outcome.result
    else
      render json: { errors: outcome.errors.full_messages }
    end
  end

  def update
    authorize @task
    outcome = Task::Update.run(task_params.merge(task: @task))

    if outcome.valid?
      render json: outcome.result
    else
      render json: { errors: outcome.errors.full_messages }
    end
  end

  def show
    authorize @task

    render json: @task.to_json
  end

  def destroy
    authorize @task
    outcome = Task::Delete.run(task: @task)
    if outcome.valid?
      render json: outcome.result
    else
      render json: { errors: outcome.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    { title: params[:title], body: params[:body] }
  end
end