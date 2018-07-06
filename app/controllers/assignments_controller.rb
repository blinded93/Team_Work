class AssignmentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  #GET/ASSIGNMENTS
  def index
    @assignment = Assignment.new
    @incomplete_assignment = Assignment.incomplete
    @complete_assignment = Assignment.complete
  end#index

  def new
    @assignment = current_user.assignments.build
  end#new

  #POST
  def create
    assignment = current_user.assignments.build(assignment_params)
     if assignment.save

       redirect_to assignments_path, notice: "Assignment was created successfully!"
     else
       render :new
     end
   end #create

   def show
     @assignments = current_user.assignments
     @task = Task.new
   end#show

#PATCH
   def edit
     #@assignment = Assignment.find(params[:id])
   end #edit

  def update
  #  @assignment = Assignment.find(params[:id])
    @assignment.update(assignment_params)

  redirect_to @assignment, notice: "Assignment updated successfully!"
  end#update


 #DELETE
  def destroy
    @assignment.destroy

    redirect_to @assignment, notice: "Assignment was deleted successfully!"
  end #destroy

  def completed
     if @assignment != current_user

       redirect_to root_path, notice: "Not your assignments"
    else
     Assignment.where(id: params[:assignment_id]).update_all(status: true)

     redirect_to assignments_path
    end
  end#completed

   private
#STRONG PARAMS
   def set_assignment
     @assignment = Assignment.find(params[:id])
   end

   def assignment_params
     params.require(:assignment).permit(:name,:due_date, :user_id, task_attributes: [:name])
   end

end#class
