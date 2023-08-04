require "application_system_test_case"

class MascotasTest < ApplicationSystemTestCase
  setup do
    @mascota = mascotas(:one)
  end

  test "visiting the index" do
    visit mascotas_url
    assert_selector "h1", text: "Mascotas"
  end

  test "should create mascota" do
    visit mascotas_url
    click_on "New mascota"

    fill_in "Apodo", with: @mascota.apodo
    fill_in "Ciudad", with: @mascota.ciudad
    fill_in "Cualidad", with: @mascota.cualidad
    fill_in "Descripcion", with: @mascota.descripcion
    fill_in "Fecha", with: @mascota.fecha
    fill_in "Nombre", with: @mascota.nombre
    fill_in "Tipo", with: @mascota.tipo
    fill_in "Usuario", with: @mascota.usuario_id
    click_on "Create Mascota"

    assert_text "Mascota was successfully created"
    click_on "Back"
  end

  test "should update Mascota" do
    visit mascota_url(@mascota)
    click_on "Edit this mascota", match: :first

    fill_in "Apodo", with: @mascota.apodo
    fill_in "Ciudad", with: @mascota.ciudad
    fill_in "Cualidad", with: @mascota.cualidad
    fill_in "Descripcion", with: @mascota.descripcion
    fill_in "Fecha", with: @mascota.fecha
    fill_in "Nombre", with: @mascota.nombre
    fill_in "Tipo", with: @mascota.tipo
    fill_in "Usuario", with: @mascota.usuario_id
    click_on "Update Mascota"

    assert_text "Mascota was successfully updated"
    click_on "Back"
  end

  test "should destroy Mascota" do
    visit mascota_url(@mascota)
    click_on "Destroy this mascota", match: :first

    assert_text "Mascota was successfully destroyed"
  end
end
