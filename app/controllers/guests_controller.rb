class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = Guest.all
  end

  def show; end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to @guest, notice: 'Compte invité créé avec succès.'
    else
      render 'new'
    end
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:name, :email, :password, :password_confirmation)
  end
end
