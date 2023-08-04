class CreateMascotas < ActiveRecord::Migration[7.0]
  def change
    create_table :mascotas do |t|
      t.string :nombre
      t.string :apodo
      t.string :tipo
      t.string :descripcion
      t.string :ciudad
      t.date :fecha
      t.string :cualidad
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
