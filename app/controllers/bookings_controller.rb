class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(guest_id: current_user.id) # Si l'utilisateur est un invité
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.new(booking_params.merge(guest_id: current_user.id))
    if @booking.save
      redirect_to @booking, notice: 'Réservation créée avec succès.'
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
