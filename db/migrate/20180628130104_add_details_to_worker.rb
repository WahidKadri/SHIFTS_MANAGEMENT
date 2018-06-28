class AddDetailsToWorker < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :details, :string
  end
end
