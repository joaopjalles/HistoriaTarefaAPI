class StatusController < ApplicationController
  def index
    @status = Status.all
    render json: @status
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      render json: @status, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  private

  def status_params
    params.require(:status).permit(:descricao)
  end
end
