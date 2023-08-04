class ConvertCualidadToArrayInMascotas < ActiveRecord::Migration[7.0]
  def up
    # Convertir los datos existentes en la columna "cualidad" a un array de strings
    Mascota.all.each do |mascota|
      mascota.update(cualidad: [mascota.cualidad])
    end
  end

  def down
    # Revertir la conversión (opcional, en caso de necesitar hacer un rollback)
    Mascota.all.each do |mascota|
      mascota.update(cualidad: mascota.cualidad.first)
    end
  end
end
