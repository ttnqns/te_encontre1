require "test_helper"

class MascotasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mascota = mascotas(:one)
  end

  test "should get index" do
    get mascotas_url
    assert_response :success
  end

  test "should get new" do
    get new_mascota_url
    assert_response :success
  end

  test "should create mascota" do
    assert_difference("Mascota.count") do
      post mascotas_url, params: { mascota: { apodo: @mascota.apodo, ciudad: @mascota.ciudad, cualidad: @mascota.cualidad, descripcion: @mascota.descripcion, fecha: @mascota.fecha, nombre: @mascota.nombre, tipo: @mascota.tipo, usuario_id: @mascota.usuario_id } }
    end

    assert_redirected_to mascota_url(Mascota.last)
  end

  test "should show mascota" do
    get mascota_url(@mascota)
    assert_response :success
  end

  test "should get edit" do
    get edit_mascota_url(@mascota)
    assert_response :success
  end

  test "should update mascota" do
    patch mascota_url(@mascota), params: { mascota: { apodo: @mascota.apodo, ciudad: @mascota.ciudad, cualidad: @mascota.cualidad, descripcion: @mascota.descripcion, fecha: @mascota.fecha, nombre: @mascota.nombre, tipo: @mascota.tipo, usuario_id: @mascota.usuario_id } }
    assert_redirected_to mascota_url(@mascota)
  end

  test "should destroy mascota" do
    assert_difference("Mascota.count", -1) do
      delete mascota_url(@mascota)
    end

    assert_redirected_to mascotas_url
  end
end
