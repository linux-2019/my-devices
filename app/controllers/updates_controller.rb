class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create]

  # GET /updates
  # GET /updates.json
  def index
    # We only need latest update per device
    latest_ids = Update.group(:device_id).maximum(:id).values
    @updates = Update.where(id: latest_ids).reverse
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
  end

  # GET /updates/new
  def new
    @update = Update.new
  end

  # GET /updates/1/edit
  def edit
  end

  # POST /updates
  # POST /updates.json
  def create
    respond_to do |format|
      if (request.format == 'json')
        device = Device.find_or_create_by(mac: create_params['mac'].downcase)
        device.name = create_params['name'] if !create_params['name'].nil?
        device.save
        @update = Update.new(device_id: device.id, ip_address: create_params['ip_address'])
      else
        @update = Update.new(update_params)
      end

      if @update.save
        format.html { redirect_to @update, notice: 'Update was successfully created.' }
        format.json { render :show, status: :created, location: @update }
      else
        format.html { render :new }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /updates/1
  # PATCH/PUT /updates/1.json
  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { render :show, status: :ok, location: @update }
      else
        format.html { render :edit }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update.destroy
    respond_to do |format|
      format.html { redirect_to updates_url, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = Update.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:update).permit(:ip_address, :device_id)
    end

    def create_params
      params.require(:update).permit(:ip_address, :mac, :name)
    end
end
