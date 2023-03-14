class ReservationsController < ApplicationController
  def confirm
    @reservation = Reservation.new(reservation_params)
  end
end
