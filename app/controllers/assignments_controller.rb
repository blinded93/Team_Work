class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, expect: [:index, :show]
  #GET/ASSIGNMENTS
  def index
    @assignments = Assignment.all
    #@assignments = Assignment.completed
  end

  def show
    @assignments = Assignment.all
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = current_user.assignments.build
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
   def update
     if @assignment.update(assignment_params)

       redirect_to @assignment, notice: "Assignment updated successfully!"
     else
       render :edit
     end
   end #update

   #DELETE

   def destroy
     @assignment.destroy

     redirect_to @assignment, notice: "Assignment was deleted successfully!"
   end #destroy

   private
#STRONG PARAMS
   def set_assignment
     @assignment = Assignment.find(params[:id])
   end

   def assignment_params
     params.require(:assignment).permit(:title)
   end

end#class
