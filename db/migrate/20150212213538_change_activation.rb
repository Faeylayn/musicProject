class ChangeActivation < ActiveRecord::Migration
  def change
    remove_column :users, :is_activated?
    add_column :users, :activated, :boolean
  end
end
