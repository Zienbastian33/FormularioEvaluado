class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[ show edit update destroy ]

  # GET /pacientes or /pacientes.json
  def index
    if params[:apellido]
      @pacientes = Paciente.where("apellidos LIKE ?", "%#{params[:apellido]}%")
    else
      @pacientes = Paciente.all
    end
  end


  # GET /pacientes/1 or /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes or /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)
  
    existing_paciente = Paciente.find_by(rut: @paciente.rut)
  
    if existing_paciente
      # Si un paciente con el mismo rut ya existe
      respond_to do |format|
        format.html { redirect_to existing_paciente, notice: 'Un paciente con este RUT ya existe. ¿Desea editarlo?' }
        format.json { render :show, status: :created, location: existing_paciente }
      end
    else
      # Lógica existente para crear un nuevo paciente
      if @paciente.save
        respond_to do |format|
          format.html { redirect_to @paciente, notice: 'Paciente creado exitosamente.' }
          format.json { render :show, status: :created, location: @paciente }
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @paciente.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /pacientes/1 or /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully updated." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1 or /pacientes/1.json
  def destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: "Paciente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paciente_params
      params.require(:paciente).permit(:rut, :nombres, :apellidos, :direccion, :ciudad, :telefono, :email, :fecha_nacimiento, :estado_civil, :comentarios)
    end
end
