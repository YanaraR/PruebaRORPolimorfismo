require 'test_helper'

class AdminUserTest < ActionDispatch::IntegrationTest
  test "admin user can create a job offer and receive a notification" do
    # Simulamos que iniciamos sesión como usuario administrador
    login_as_admin_user

    # Visitamos la página para crear una oferta laboral
    visit new_job_offer_path

    # Llenamos el formulario para crear una oferta laboral
    fill_in "Title", with: "Software Engineer"
    fill_in "Description", with: "We are looking for a skilled software engineer."
    click_button "Create Job Offer"

    # Verificamos que la oferta laboral se haya creado correctamente
    assert_text "Job offer was successfully created."

    # Verificamos que el usuario administrador reciba una notificación
    assert_text "You have a new job application."

    # Cerramos sesión
    logout_user
  end
end