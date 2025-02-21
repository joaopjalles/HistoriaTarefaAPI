class Status < ApplicationRecord
  has_many :historias
  has_many :tarefa

  def self.ransackable_attributes (auth_object = nil)
    [
      "id",
      "titulo",
      "descricao",
      "finalizada",
    ]
  end
end
