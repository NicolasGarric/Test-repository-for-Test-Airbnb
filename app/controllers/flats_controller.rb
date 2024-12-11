class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] # Assurez-vous que seuls les utilisateurs connectés peuvent créer ou modifier des appartements

  def index
    @flats = Flat.where(available: true)
  end

  def show
  end

  def new
    @flat = current_user.flats.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.host_id = current_user.id # Associer l'utilisateur connecté comme hôte

    if @flat.save
      redirect_to @flat, notice: 'Appartement ajouté.'
    else
      flash[:alert] = 'Erreur.'
      render :new
    end
  end


  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Appartement mis à jour.'
    else
      flash[:alert] = 'Erreur.'
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, notice: 'Appartement supprimé.'
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to flats_path, alert: 'Appartement introuvable.'
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :price, :max_guests, :available, :description)
  end
end
