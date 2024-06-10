class AnimalsController < ApplicationController
  before_action :authenticate_devise_user!

  def new
    @animal = Animal.new
  end
  
  def show
    @animal = Animal.find(params[:id])
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to dashboard_path, notice: "Pet cadastrado com sucesso."
    else
      render :new, notice: "Não foi possível registrar o pet"
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to dashboard_path, notice: "Animal atualizado com seucesso."
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to dashboard_path, notice: "Animal removido com sucesso."
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :additional_info, :gender, :photo)
  end

end
