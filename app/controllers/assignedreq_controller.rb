class AssignedreqController < ApplicationController
  #This is for once we implement users signing up for requirements. For now, it is unused.
  def index
    @assignedreqs = Assignedreq.all
  end

  def show
    @assignedreq = Assignedreq.find(params[:id])
  end

  def create
    @assignedreq = Assignedreq.new(assignedreq_params)
  end

  def destroy
    @assignedreq.destroy!
  end

  private
  def assignedreq_params
    params.fetch(:assignedreq, {}).permit(:req_description)
  end
end
