class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin,:checkout,:user_id,:room_id,:numberpeople))
    @room = Room.find(@reservation.room_id)
    day = @reservation.checkout - @reservation.checkin
    @days = day.to_i
    @cost = @room.price * @reservation.numberpeople * @days
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin,:checkout,:user_id,:room_id,:numberpeople))
    if @reservation.save
      redirect_to "/reservations"
    else
      render "/reservations/confirm"
    end
  end

  def back
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin,:checkout,:user_id,:room_id,:numberpeople))
    @room = Room.find(@reservation.room_id)
    @user = User.find(@reservation.user_id)
    render "/rooms/show"
  end
end
