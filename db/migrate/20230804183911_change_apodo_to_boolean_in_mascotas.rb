class ChangeApodoToBooleanInMascotas < ActiveRecord::Migration[7.0]
  def up
    change_column :mascotas, :apodo, :boolean, default: false, using: 'apodo::boolean'
  end

  def down
    change_column :mascotas, :apodo, :string
  end
end
