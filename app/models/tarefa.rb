class Tarefa < ApplicationRecord
  belongs_to :historia
  belongs_to :status

  def self.ransackable_attributes (auth_object = nil)
    [
      "id",
      "titulo",
      "descricao",
      "finalizada",
    ]
  end
end
