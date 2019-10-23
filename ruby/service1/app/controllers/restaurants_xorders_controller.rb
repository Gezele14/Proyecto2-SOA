class RestaurantsXordersController < ApplicationController
  before_action :set_restaurants_xorder, only: [:show, :edit, :update, :destroy]

  # GET /restaurants_xorders
  # GET /restaurants_xorders.json
  def index
    @restaurants_xorders = RestaurantsXorder.all
  end

  # GET /restaurants_xorders/1
  # GET /restaurants_xorders/1.json
  def show
  end

  # GET /restaurants_xorders/new
  def new
    @restaurants_xorder = RestaurantsXorder.new
  end

  # GET /restaurants_xorders/1/edit
  def edit
  end

  # POST /restaurants_xorders
  # POST /restaurants_xorders.json
  def create
    @restaurants_xorder = RestaurantsXorder.new(restaurants_xorder_params)

    respond_to do |format|
      if @restaurants_xorder.save
        format.html { redirect_to @restaurants_xorder, notice: 'Restaurants xorder was successfully created.' }
        format.json { render :show, status: :created, location: @restaurants_xorder }
      else
        format.html { render :new }
        format.json { render json: @restaurants_xorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants_xorders/1
  # PATCH/PUT /restaurants_xorders/1.json
  def update
    respond_to do |format|
      if @restaurants_xorder.update(restaurants_xorder_params)
        format.html { redirect_to @restaurants_xorder, notice: 'Restaurants xorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurants_xorder }
      else
        format.html { render :edit }
        format.json { render json: @restaurants_xorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants_xorders/1
  # DELETE /restaurants_xorders/1.json
  def destroy
    @restaurants_xorder.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_xorders_url, notice: 'Restaurants xorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurants_xorder
      @restaurants_xorder = RestaurantsXorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurants_xorder_params
      params.require(:restaurants_xorder).permit(:idRestaurants, :idOrders)
    end
end
