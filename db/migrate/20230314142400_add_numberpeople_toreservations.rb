class AddNumberpeopleToreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :numberpeople, :integer
  end
end
