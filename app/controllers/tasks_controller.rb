class TasksController < ApplicationController
  before_action :set_assignment
  before_action :set_task, except: [:create]

  def create
    @task = @assignment.tasks.create(task_params)

    redirect_to @assignment
  end#create

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted successfully!"
    else
      flash[:error] = "Task could not be deleted"
    end
      redirect_to @assignment
  end #destroy

  def complete
    @task.update_attribute(:completed_at, Time.now)

      redirect_to @assignment, notice: "Task completed"
  end#compete

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
