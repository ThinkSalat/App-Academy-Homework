class M < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :toyable_id, :integer
    add_column :cats, :toyable_name, :string

    add_column :corgis, :toyable_id, :integer
    add_column :corgis, :toyable_name, :string

  end

end
