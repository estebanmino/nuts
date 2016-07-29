class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find_by_id session[:address_id]
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.create(address_params)

    if users_params
      @user = @address.build_user(users_params)
      @user.update_attribute(:is_admin, false)

      respond_to do |format|
        if @address.save && @user.save
          log_in @address
          format.html do
            redirect_to home_path
          end
          flash[:success] = "Te damos la bienvenida a Avellano!"
        else
          if !@address.save
            format.json { render json: @address.errors, status: :unprocessable_entity }
          end
          if !@user.save
            format.json { render json: @address.user.errors, status: :unprocessable_entity }
          end
          format.html { render :new }
        end
      end
    else
      respond_to do |format|
        if @address.save
          log_in @address
          format.html do
            redirect_to home_path
          end
          flash[:success] = "Te damos la bienvenida a Avellano!"
        else
          format.json { render json: @address.errors, status: :unprocessable_entity }
          format.html { render :new }
        end
      end
    end


  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy

    orders = Order.find_by address_id: @address.id
    if orders
      orders_items = OrderItem.find_by order_id: orders.id
      orders_items.destroy

      orders.destroy
    end

    @address.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:first_name, :last_name, :street, :number, :commune, :phone_number, :email)
    end

    def users_params
      params.require(:address).permit(:email, :password, :password_confirmation)
    end

end
