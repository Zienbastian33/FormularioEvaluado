require "application_system_test_case"

class PacientesTest < ApplicationSystemTestCase
  setup do
    @paciente = pacientes(:one)
  end

  test "visiting the index" do
    visit pacientes_url
    assert_selector "h1", text: "Pacientes"
  end

  test "should create paciente" do
    visit pacientes_url
    click_on "New paciente"

    fill_in "Apellidos", with: @paciente.apellidos
    fill_in "Ciudad", with: @paciente.ciudad
    fill_in "Comentarios", with: @paciente.comentarios
    fill_in "Direccion", with: @paciente.direccion
    fill_in "Email", with: @paciente.email
    fill_in "Estado civil", with: @paciente.estado_civil
    fill_in "Fecha nacimiento", with: @paciente.fecha_nacimiento
    fill_in "Nombres", with: @paciente.nombres
    fill_in "Rut", with: @paciente.rut
    fill_in "Telefono", with: @paciente.telefono
    click_on "Create Paciente"

    assert_text "Paciente was successfully created"
    click_on "Back"
  end

  test "should update Paciente" do
    visit paciente_url(@paciente)
    click_on "Edit this paciente", match: :first

    fill_in "Apellidos", with: @paciente.apellidos
    fill_in "Ciudad", with: @paciente.ciudad
    fill_in "Comentarios", with: @paciente.comentarios
    fill_in "Direccion", with: @paciente.direccion
    fill_in "Email", with: @paciente.email
    fill_in "Estado civil", with: @paciente.estado_civil
    fill_in "Fecha nacimiento", with: @paciente.fecha_nacimiento
    fill_in "Nombres", with: @paciente.nombres
    fill_in "Rut", with: @paciente.rut
    fill_in "Telefono", with: @paciente.telefono
    click_on "Update Paciente"

    assert_text "Paciente was successfully updated"
    click_on "Back"
  end

  test "should destroy Paciente" do
    visit paciente_url(@paciente)
    click_on "Destroy this paciente", match: :first

    assert_text "Paciente was successfully destroyed"
  end
end
