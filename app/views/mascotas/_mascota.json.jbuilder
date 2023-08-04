json.extract! mascota, :id, :nombre, :apodo, :tipo, :descripcion, :ciudad, :fecha, :cualidad, :usuario_id, :created_at, :updated_at
json.url mascota_url(mascota, format: :json)
