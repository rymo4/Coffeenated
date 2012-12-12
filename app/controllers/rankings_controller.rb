class RankingsController < ApplicationController
  def index
    @rankings = current_user.rankings.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rankings, each_serializer: RankingsIndexSerializer, root: false }
    end
  end

  def show
    @ranking = Ranking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ranking }
    end
  end

  def new
    @ranking = Ranking.new
    @autocomplete_roasters = CoffeeType.all.map { |r| 
      {label: r.name, value: r.id, category: r.roaster.name } 
    }.to_json

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ranking }
    end
  end

  def edit
    @ranking = Ranking.find(params[:id])
  end

  def create
    params[:ranking][:data].each do |k, v|
      params[:ranking][:data][k] = v.to_i
    end

    @ranking = current_user.rankings.new(params[:ranking])

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

  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy

    respond_to do |format|
      format.html { redirect_to rankings_url }
      format.json { head :no_content }
    end
  end
end
