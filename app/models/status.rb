class Status < ApplicationRecord
  has_many :historias
  has_many :tarefas
end
