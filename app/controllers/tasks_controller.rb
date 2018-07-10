class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_assignment
  before_action :set_task, except: [:create, :index]

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @task = @assignment.tasks.build(task_params)
    @task.save

    redirect_to @assignment
    end#create

  def destroy
    @task = @assignment.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted successfully!"
    else
      flash[:error] = "Task could not be deleted"
    end
      redirect_to @assignment
  end #destroy

  def complete
    if !@task.completed?
      @task.update_attribute(:completed_at, Time.now)

      redirect_to @assignment, notice: "Task completed"
    else

    @task.update_attribute(:completed_at, nil)
     redirect_to @assignment, notice: "Task Incomplete"
    end
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def set_task
    @task = @assignment.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end#class
