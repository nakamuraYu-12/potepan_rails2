class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  def own
    @rooms = Room.where(user_id: current_user.id)
  end
  def new
    @user = User.find(current_user.id)
    @room = Room.new
  end

  def create
    @user = User.find(current_user.id)
    @room =  Room.new(params.require(:room).permit(:name,:introduction,:price,:user_id,:address))
    if @room.save
      redirect_to "/rooms/own"
    else
      render "rooms/new"
    end
  end

  def show
    @reservation = Reservation.new
    @room= Room.find(params[:id])
    @user = User.find(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def room_params

  end
end
