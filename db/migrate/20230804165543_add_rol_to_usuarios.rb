class AddRolToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :rol, :integer,  default: 0
  end
end
