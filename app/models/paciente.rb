class Paciente < ApplicationRecord
        # app/models/paciente.rb
    validates :rut, presence: true, uniqueness: true
    validates :nombres, :apellidos, :direccion, :ciudad, :telefono, :email, :fecha_nacimiento, :estado_civil, presence: true

end
