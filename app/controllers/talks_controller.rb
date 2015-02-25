class TalksController < ApplicationController
before_action :talk_instance only: [:]

  def index
    talks = Talk.all
    @talks_not_completed = talks.where('talk_date >= ?', Date.today).order('talk_date, talk_time')
    @talks_completed = talks.where('talk_date < ?', Date.today).order('talk_date DESC, talk_time DESC')
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
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
    if @talk.update(talk_params)
      redirect_to talks_path, notice: "Talk was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    user_name = Talk.find(params[:id]).presenter
    Talk.find(params[:id]).destroy
    redirect_to talks_path, notice: "#{user_name} was successfully deleted from the system"
  end

private

  def talk_params
    params.require(:talk).permit(:presenter, :topic, :talk_date, :talk_time)
  end

  def talk_instance
    @talk = Talk.find(params[:id])
  end
end
