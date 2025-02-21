class HistoriaSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :descricao, :finalizada, :status_id
  has_many :tarefa
end
