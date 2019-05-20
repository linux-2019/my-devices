class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create]

  # GET /stats
  # GET /stats.json
  def index
    @stats = Stat.all
  end

  # GET /stats/1
  # GET /stats/1.json
  def show
  end

  # GET /stats/new
  def new
    @stat = Stat.new
  end

  # GET /stats/1/edit
  def edit
  end

  # POST /stats
  # POST /stats.json
  def create
    respond_to do |format|
      if (request.format == 'json')
        device = Device.find_or_create_by(mac: device_params['mac'].downcase)
        device.save
        @stat = Stat.new(
          stats_params
        )
        @stat.device_id = device.id
      else
        @stat = Stat.new(stat_params)
      end

      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render :show, status: :created, location: @stat }
      else
        format.html { render :new }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    respond_to do |format|
      if @stat.update(stat_params)
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @stat }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat.destroy
    respond_to do |format|
      format.html { redirect_to stats_url, notice: 'Stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.require(:stat).permit(:device_id, :disk_free, :disk_total, :memory_free, :memory_total, :uptime, :hostname, :kernel)
    end

    def device_params
      params.require(:stat).permit(:mac)
    end

    def create_params
      params.require(:stat).permit(:kernel, :hostname, :uptime,
        disk: [:free, :total], memory: [:free, :total])
    end

    def stats_params
      data = create_params
  
      {
        disk_free: (data.has_key?('disk') ? data['disk']['free'] : nil),
        disk_total: (data.has_key?('disk') ? data['disk']['total'] : nil),
        memory_free: (data.has_key?('memory') ? data['memory']['free'] : nil),
        memory_total: (data.has_key?('memory') ? data['memory']['total'] : nil),
        uptime: (data.has_key?('uptime') ? data['uptime'] : nil),
        hostname: (data.has_key?('hostname') ? data['hostname'] : nil),
        kernel: (data.has_key?('kernel') ? data['kernel'] : nil)
      }
    end
    
end
