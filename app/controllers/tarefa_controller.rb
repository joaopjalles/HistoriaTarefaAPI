class TarefaController < ApplicationController
  include Pagy::Backend

  def index
    @q = Tarefa.ransack(params[:q])
    @tarefas = @q.result(distinct: true)
    @pagy, @tarefas = pagy(@tarefas)
    render json: @tarefas
  end

  def create
    @tarefa = Tarefa.new(tarefa_params)
    if @tarefa.save
      render json: @tarefa, status: :created
    else
      render json: @tarefa.errors, status: :unprocessable_entity
    end
  end

  def update
    @tarefa = Tarefa.find(params[:id])
    if @tarefa.update(tarefa_params)
      render json: @tarefa
    else
      render json: @tarefa.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tarefa = Tarefa.find(params[:id])
    @tarefa.destroy
    head :no_content
  end

  private

  def tarefa_params
    params.require(:tarefa).permit(:titulo, :descricao, :finalizada, :historia_id, :status_id)
  end
end
