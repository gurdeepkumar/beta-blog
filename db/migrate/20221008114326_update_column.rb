class UpdateColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :user, :user_id
  end
end
