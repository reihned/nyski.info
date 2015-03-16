class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json

  def login
  @user = User.find_by_email(params[:email])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
      if session[:search_id]
        redirect_to "/search/#{session[:search_id]}"
      else
        redirect_to user_path(@user)
      end
   else
     render :new, notice: 'Invalid Login'
   end
 end

 def logout
   reset_session
   redirect_to new_user_path, notice: 'You have been logged out'
 end


  # GET /users/1
  # GET /users/1.json
  def show
    if current_user
      # Pry.start(binding)
      

      @user = current_user
    else
      redirect_to new_user_path
    end
  end 

  # GET /users/new
  def new
    # binding.pry
    if current_user
      redirect_to user_path(current_user)
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to new_user_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to data_form_path, notice: "enter your data"
      end
    end
end
