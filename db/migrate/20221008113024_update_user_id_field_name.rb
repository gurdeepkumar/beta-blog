class UpdateUserIdFieldName < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :user_id, :user
  end
end
