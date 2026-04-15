class AssignedreqController < ApplicationController
  def index
    @assignedreqs = Assignedreq.all
  end

  def show
    @assignedreq = Assignedreq.find(params[:id])
  end

  def create
    @assignedreq = Assignedreq.new(assignedreq_params)
  end

  private
  def assignedreq_params
    params.fetch(:assignedreq, {}).permit(:req_description)
  end
end
