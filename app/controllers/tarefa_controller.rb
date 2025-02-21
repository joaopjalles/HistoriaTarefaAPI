class TarefaController < ApplicationController
  include Pagy::Backend

  def search
    query = params[:query]
    puts "Parâmetro query recebido: #{query.inspect}" # Log para depuração
    @results = Tarefa.where("nome LIKE ?", "%#{query}%")
    puts "Resultados encontrados: #{@results.inspect}" # Log para depuração
    render json: @results
  end

  def index
    @q = Tarefa.ransack(params[:q])
    @tarefa = @q.result(distinct: true)
    @pagy, @tarefa = pagy(@tarefa)
    render json: @tarefa
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
