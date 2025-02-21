class AddNomeToTarefas < ActiveRecord::Migration[8.0]
  def change
    add_column :tarefas, :nome, :string
  end
end
