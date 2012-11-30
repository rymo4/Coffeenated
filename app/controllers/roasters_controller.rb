class RoastersController < ApplicationController
  def index
    @roasters = Roaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roasters }
    end
  end

  def show
    @roaster = Roaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roaster }
    end
  end

  def new
    @roaster = Roaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @roaster }
    end
  end

  def edit
    @roaster = Roaster.find(params[:id])
  end

  def create
    @roaster = Roaster.new(params[:roaster])

    respond_to do |format|
      if @roaster.save
        format.html { redirect_to @roaster, notice: 'Roaster was successfully created.' }
        format.json { render json: @roaster, status: :created, location: @roaster }
      else
        format.html { render action: "new" }
        format.json { render json: @roaster.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @roaster = Roaster.find(params[:id])

    respond_to do |format|
      if @roaster.update_attributes(params[:roaster])
        format.html { redirect_to @roaster, notice: 'Roaster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roaster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @roaster = Roaster.find(params[:id])
    @roaster.destroy

    respond_to do |format|
      format.html { redirect_to roasters_url }
      format.json { head :no_content }
    end
  end
end
