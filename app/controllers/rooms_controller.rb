class RoomsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]

    before_action :set_room, only: %i[show update edit destroy]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_param)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show 
  end

  private

  def room_param
    params.require(:room).permit(:title)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
