class ConcertsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_concert, only: [:show, :edit, :update, :destroy]

  def index
    @concerts_today = Concert.concerts_today(8)
    @concerts_later = Concert.concerts_later(4)
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = current_user.concerts.build concert_params

    if @concert.save
      redirect_to @concert, flash: { success: "Concert has been saved successfully."}
    else
      render 'new', flash: { success: "Concert has not been saved."}
    end
  end

  def edit
    if @concert.user != current_user
      redirect_to root_path, :flash => { :danger => "You can only edit your own concerts." }
    end
  end

  def update
    if @concert.user != current_user
      redirect_to root_path, :flash => { :danger => "You can only edit your own concerts." }
    else
      if @concert.update(concert_params)
        redirect_to @concert, flash: { success: "Concert has been updated successfully."}
      else
        render 'edit', flash: { success: "Concert has not been updated."}
      end
    end
  end

  def destroy
    @concert.destroy
    redirect_to root_path, flash: { success: "Concert has been deleted successfully."}
  end
  private

  def set_concert
    @concert = Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end
end
