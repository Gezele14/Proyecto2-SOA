class UsersXordersController < ApplicationController
  before_action :set_users_xorder, only: [:show, :edit, :update, :destroy]

  # GET /users_xorders
  # GET /users_xorders.json
  def index
    @users_xorders = UsersXorder.all
  end

  # GET /users_xorders/1
  # GET /users_xorders/1.json
  def show
  end

  # GET /users_xorders/new
  def new
    @users_xorder = UsersXorder.new
  end

  # GET /users_xorders/1/edit
  def edit
  end

  # POST /users_xorders
  # POST /users_xorders.json
  def create
    @users_xorder = UsersXorder.new(users_xorder_params)

    respond_to do |format|
      if @users_xorder.save
        format.html { redirect_to @users_xorder, notice: 'Users xorder was successfully created.' }
        format.json { render :show, status: :created, location: @users_xorder }
      else
        format.html { render :new }
        format.json { render json: @users_xorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_xorders/1
  # PATCH/PUT /users_xorders/1.json
  def update
    respond_to do |format|
      if @users_xorder.update(users_xorder_params)
        format.html { redirect_to @users_xorder, notice: 'Users xorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_xorder }
      else
        format.html { render :edit }
        format.json { render json: @users_xorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_xorders/1
  # DELETE /users_xorders/1.json
  def destroy
    @users_xorder.destroy
    respond_to do |format|
      format.html { redirect_to users_xorders_url, notice: 'Users xorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_xorder
      @users_xorder = UsersXorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_xorder_params
      params.require(:users_xorder).permit(:idUsers, :idOrders)
    end
end
