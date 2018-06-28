class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #GET/ASSIGNMENTS
  def index
    @assignment = Assignment.new
    @incomplete_assignment = Assignment.incomplete
    @complete_assignment = Assignment.complete
  end

  def show
    @assignment = Assignment.find(params[:id])
    @task = Task.new
  end

  def new
    @assignment = Assignment.new
    @assignment.tasks.build
  end

  #POST
  def create
    @assignment = current_user.assignments.build(assignment_params)
     if @assignment.save

       redirect_to @assignment, notice: "Assignment was created successfully!"
     else
       render :new
     end
   end #create

#PATCH
   def edit
     @assignment = Assignment.find(params[:id])
     @assignment.save

    redirect_to @assignment, notice: "Assignment updated successfully!"
   end #update

   #DELETE
   def destroy
     @assignment.destroy

     redirect_to @assignment, notice: "Assignment was deleted successfully!"
   end #destroy

  def completed
    Assignment.where(id: params[:assignment_id]).update_all(status: true)

    redirect_to assignments_path
  end

   private
#STRONG PARAMS
   def set_assignment
     @assignment = Assignment.find(params[:id])
   end

   def assignment_params
     params.require(:assignment).permit(:name,:due_date, task_attributes: [:name])
   end

end#class
