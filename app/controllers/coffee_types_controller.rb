class CoffeeTypesController < ApplicationController
  def index
    @coffee_types = CoffeeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coffee_types }
    end
  end

  def show
    @coffee_type = CoffeeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coffee_type }
    end
  end

  def new
    @coffee_type = CoffeeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coffee_type }
    end
  end

  def edit
    @coffee_type = CoffeeType.find(params[:id])
  end

  def create
    @coffee_type = CoffeeType.new(params[:coffee_type])

    respond_to do |format|
      if @coffee_type.save
        format.html { redirect_to @coffee_type, notice: 'Coffee type was successfully created.' }
        format.json { render json: @coffee_type, status: :created, location: @coffee_type }
      else
        format.html { render action: "new" }
        format.json { render json: @coffee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @coffee_type = CoffeeType.find(params[:id])

    respond_to do |format|
      if @coffee_type.update_attributes(params[:coffee_type])
        format.html { redirect_to @coffee_type, notice: 'Coffee type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coffee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coffee_type = CoffeeType.find(params[:id])
    @coffee_type.destroy

    respond_to do |format|
      format.html { redirect_to coffee_types_url }
      format.json { head :no_content }
    end
  end
end
