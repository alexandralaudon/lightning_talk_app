class RegistrationsController < ApplicationController

  def new
      @registration = Talk.new
  end

  
end
