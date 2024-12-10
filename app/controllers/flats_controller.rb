class FlatsController < ApplicationController
  def index
    @flats = Flat.where(available: true) # Supposons que vous ayez un champ 'available'
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.host.flats.new(flat_params) # Association avec l’hôte connecté
    if @flat.save
      redirect_to @flat, notice: 'Appartement ajouté avec succès.'
    else
      render 'new'
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :price_per_night, :max_guests)
  end
end
