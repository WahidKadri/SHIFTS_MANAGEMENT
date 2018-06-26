class AddFullNameToWorker < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :full_name, :string
  end
end
