class TransportationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transportation = Transportation.new
  end

  def create
    @transportation = Transportation.new
    if @transportation.save
      flash[:message] = "Transportation created"
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
