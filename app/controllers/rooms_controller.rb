class RoomsController < ApplicationController
  def index

    if params[:search_area] != "" || params[:search_keyword] != ""
      @rooms = Room.where("address LIKE? AND name LIKE?", "%#{params[:search_area]}%","%#{params[:search_keyword]}%")
    else
      @rooms = Room.all
    end

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
    @room =  Room.new(params.require(:room).permit(:name,:introduction,:price,:user_id,:address,:image))
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
    @room = Room.find(params[:id])
    @user = User.find(current_user.id)
  end

  def update
    @room = Room.find(params[:id])
    @room.update(params.require(:room).permit(:name,:introduction,:price,:user_id,:address,:image))
    redirect_to "/rooms/own"
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to "/rooms/own"
  end

end
