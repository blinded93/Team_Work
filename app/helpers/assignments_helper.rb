module AssignmentsHelper
  def completed
    if  @assignment.user != current_user

     redirect_to root_path, notice: "Not your assignments"
    else
     Assignment.where(id: params[:assignment_id]).update_all(status: true)

     redirect_to assignments_path
    end
  end#completed

end
