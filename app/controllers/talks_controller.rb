class TalksController < ApplicationController

  def index
    @talks = Talk.order('talk_date DESC, talk_time DESC')
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(params.require(:talk).permit(:presenter, :topic, :talk_date, :talk_time))
    if @talk.save
      redirect_to talks_path, notice: "Talk was saved successfully"
    else
      render :new
    end
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(params.require(:talk).permit(:presenter, :topic, :talk_date, :talk_time))
      redirect_to talks_path, notice: "Talk was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    user_name = Talk.find(params[:id]).presenter
    Talk.find(params[:id]).destroy
    redirect_to talks_path, notice: "Talk was successfully deleted from the system"
  end


end
