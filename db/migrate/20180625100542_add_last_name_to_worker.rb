class AddLastNameToWorker < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :last_name, :string
  end
end
