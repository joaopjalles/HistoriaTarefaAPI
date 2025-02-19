class Historia < ApplicationRecord
  belongs_to :status
  has_many :tarefas
end
