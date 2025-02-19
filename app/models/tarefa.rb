class Tarefa < ApplicationRecord
  belongs_to :historia
  belongs_to :status
end
