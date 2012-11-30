class RankingsController < ApplicationController
  # GET /rankings
  # GET /rankings.json
  def index
    @rankings = Ranking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rankings }
    end
  end

  # GET /rankings/1
  # GET /rankings/1.json
  def show
    @ranking = Ranking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ranking }
    end
  end

  # GET /rankings/new
  # GET /rankings/new.json
  def new
    @ranking = Ranking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ranking }
    end
  end

  # GET /rankings/1/edit
  def edit
    @ranking = Ranking.find(params[:id])
  end

  # POST /rankings
  # POST /rankings.json
  def create
    @ranking = Ranking.new(params[:ranking])

    respond_to do |format|
      if @ranking.save
        format.html { redirect_to @ranking, notice: 'Ranking was successfully created.' }
        format.json { render json: @ranking, status: :created, location: @ranking }
      else
        format.html { render action: "new" }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rankings/1
  # PUT /rankings/1.json
  def update
    @ranking = Ranking.find(params[:id])

    respond_to do |format|
      if @ranking.update_attributes(params[:ranking])
        format.html { redirect_to @ranking, notice: 'Ranking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rankings/1
  # DELETE /rankings/1.json
  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy

    respond_to do |format|
      format.html { redirect_to rankings_url }
      format.json { head :no_content }
    end
  end
end
