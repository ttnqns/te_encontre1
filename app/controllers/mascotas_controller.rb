class MascotasController < ApplicationController
  before_action :set_mascota, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!, except: [:index, :show]

  # GET /mascotas or /mascotas.json
  def index
    @mascotas = Mascota.all
    #@pagy, @mascotas = pagy(Mascota.all)
  end

  # GET /mascotas/1 or /mascotas/1.json
  def show
    @mascota = Mascota.includes(:usuario).find(params[:id])
  end

  # GET /mascotas/new
  def new
    @mascota = Mascota.new
    @tipos_mascota = ["Perro", "Gato", "Ave"]
    @ciudades = cargar_ciudades_desde_csv
  end

  # GET /mascotas/1/edit
  def edit
    unless current_usuario.admin? || current_usuario == @mascota.usuario
      redirect_to mascota_path(@mascota), alert: "No tienes permiso para editar esta mascota."
    end
  end

  # POST /mascotas or /mascotas.json
  def create
    @mascota = Mascota.new(mascota_params)
    @mascota.usuario = current_usuario

    respond_to do |format|
      if @mascota.save
        format.html { redirect_to mascota_url(@mascota), notice: "Mascota was successfully created." }
        format.json { render :show, status: :created, location: @mascota }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mascota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mascotas/1 or /mascotas/1.json
  def update
    unless current_usuario.admin? || current_usuario == @mascota.usuario
      redirect_to mascota_path(@mascota), alert: "No tienes permiso para editar esta mascota."
      return
    end

    respond_to do |format|
      if @mascota.update(mascota_params)
        format.html { redirect_to mascota_url(@mascota), notice: "Mascota was successfully updated." }
        format.json { render :show, status: :ok, location: @mascota }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mascota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mascotas/1 or /mascotas/1.json
  def destroy
    unless current_usuario.admin? || current_usuario == @mascota.usuario
      redirect_to mascota_path(@mascota), alert: "No tienes permiso para eliminar esta mascota."
      return
    end

    @mascota.destroy

    respond_to do |format|
      format.html { redirect_to mascotas_url, notice: "Mascota was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def cargar_ciudades_desde_csv
      ciudades = []
      require 'csv' 
      CSV.foreach(Rails.root.join('db', 'ciudades.csv')) do |row|
        ciudades << row.first
      end
      ciudades
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_mascota
      @mascota = Mascota.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mascota_params
      params.require(:mascota).permit(:nombre, :apodo, :tipo, :descripcion, :ciudad, :fecha, cualidad: [])
    end
end
