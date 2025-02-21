class TarefaSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :descricao, :finalizada, :historia_id, :status_id
end
