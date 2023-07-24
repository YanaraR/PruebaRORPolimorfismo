require "test_helper"

class NormalUserTest < ActiveSupport::TestCase
  def setup
    @user = users(:normal_user) # Carga un usuario normal de los fixtures (pruebas de la base de datos)
  end

  test "un usuario normal puede aplicar a una oferta laboral" do
    job_offer = job_offers(:oferta_laboral) # Carga una oferta laboral de los fixtures
    @user.apply_to_job_offer(job_offer)

    assert_includes @user.applied_job_offers, job_offer
  end

  test "un usuario normal tiene una vista para revisar sus postulaciones" do
    get user_applications_path(@user)
    assert_response :success
    assert_select "h1", "Mis Postulaciones"
    assert_select "table" do
      assert_select "tr", count: @user.applied_job_offers.count + 1 # +1 para la fila de encabezado
    end
  end

  test "un usuario normal debe tener un nombre, correo, foto de perfil y experiencia laboral" do
    assert_not_nil @user.name
    assert_not_nil @user.email
    assert_not_nil @user.profile_photo
    assert_not_nil @user.experience
  end
end