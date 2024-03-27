class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Cadastro realizado, efetue login."
    else
      render :new
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :cpf, :date_of_birth, :phone, :password, :password_confirmation)
  end
end

