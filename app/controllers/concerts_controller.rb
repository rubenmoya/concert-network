class ConcertsController < ApplicationController
  before_action :set_concert, only: [:edit, :update, :destroy, :show]

  def index
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to @concert, flash: { success: "Concert has been saved successfully."}
    else
      render 'new', flash: { success: "Concert has not been saved."}
    end
  end

  def edit
  end

  def update
    if @concert.update(concert_params)
      redirect_to @concert, flash: { success: "Concert has been updated successfully."}
    else
      render 'edit', flash: { success: "Concert has not been updated."}
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
