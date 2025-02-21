class HistoriaController < ApplicationController
  include Pagy::Backend

  def index
    @q = Historia.ransack(params[:q])
    @historia = @q.result(distinct: true)
    @pagy, @historia = pagy(@historia)
    render json: @historia
  end

  def create
    @historia = Historia.new(historia_params)
    if @historia.save
      render json: @historia, status: :created
    else
      render json: @historia.errors, status: :unprocessable_entity
    end
  end

  def update
    @historia = Historia.find_by(params[:id])
    if @historia.update(historia_params)
      render json: @historia
    else
      render json: @historia.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @historia = Historia.find_by(params[:id])
    @historia.destroy
    head :no_content
  end

  private

  def historia_params
    params.require(:historia).permit(:titulo, :descricao, :finalizada, :status_id)
  end
end
