json.extract! paciente, :id, :rut, :nombres, :apellidos, :direccion, :ciudad, :telefono, :email, :fecha_nacimiento, :estado_civil, :comentarios, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
