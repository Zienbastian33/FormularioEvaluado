class CreatePacientes < ActiveRecord::Migration[7.0]
  def change
    create_table :pacientes do |t|
      t.string :rut
      t.string :nombres
      t.string :apellidos
      t.string :direccion
      t.string :ciudad
      t.string :telefono
      t.string :email
      t.date :fecha_nacimiento
      t.string :estado_civil
      t.text :comentarios

      t.timestamps
    end
  end
end
