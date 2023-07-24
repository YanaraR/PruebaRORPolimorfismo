class ApplicationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @job_offer = JobOffer.find(params[:job_offer_id])
    @application = current_user.applications.build(job_offer: @job_offer)

    # Redireccionar a la vista de inicio de sesión de Devise
    redirect_to new_user_session_path, alert: "La creación de nuevas aplicaciones está deshabilitada."
  end

  def create
    @job_offer = JobOffer.find(params[:job_offer_id])
    @application = current_user.applications.build(job_offer: @job_offer)

    # Agregar el atributo experience a los strong parameters
    @application.experience = application_params[:experience]

    if @application.save
      redirect_to root_path, notice: "Postulación realizada exitosamente."
    else
      render :new
    end
  end

  private

  # Definir los strong parameters para application
  def application_params
    params.require(:application).permit(:experience)
  end
end